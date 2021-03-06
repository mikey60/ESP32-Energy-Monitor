/***************************************************************************
 MQTT Energy Monitor uses Aeon labs DSB09104-zwus current clamps and housing 
****************************************************************************/ 
#include <WiFi.h>
#include <PubSubClient.h>
#include <ArduinoOTA.h>
#include "esp_wifi.h"

//#define DEBUG_SERIAL
#define DEBUG_TELNET

#if defined(DEBUG_TELNET)
#define DEBUG_TELNET_PORT 23
#endif

#if defined(DEBUG_TELNET)
WiFiServer  telnetServer(DEBUG_TELNET_PORT);
WiFiClient  telnetClient;
#define     DEBUG_PRINT(x)    telnetClient.print(x)
#define     DEBUG_PRINTLN(x)  telnetClient.println(x)

#elif defined(DEBUG_SERIAL)
#define     DEBUG_PRINT(x)    Serial.print(x)
#define     DEBUG_PRINTLN(x)  Serial.println(x)
#else
#define     DEBUG_PRINT(x)
#define     DEBUG_PRINTLN(x)
#endif

#if CONFIG_FREERTOS_UNICORE
#define ARDUINO_RUNNING_CORE 0
#else
#define ARDUINO_RUNNING_CORE 1
#endif

#ifndef LED_BUILTIN
#define LED_BUILTIN 13
#endif
#define portTICK_PERIOD_MS 1

#define OTA_password "your_OTA_password"
const char* ssid = "your_SSID";
const char* password = "your_SSID_password";
const char* hostname = "Energy Monitor";
const char* mqttServer = "xxx.xxx.xxx.xxx"; //your IP address
const int mqttPort = 1883;
//const char* mqttUser = "yourMQTTuser";   //Use if desired
//const char* mqttPassword = "yourMQTTpassword";

WiFiClient espClient;
PubSubClient client(espClient);

//counters to limit connection retries
volatile int wifi_cnt = 0;
volatile int mqtt_cnt = 0;


const int line1_current = 34; //pin for line 1 current ADC input
const int line2_current = 35; //pin for line 2 current ADC input
const int voltage = 32;  //pin for voltage ADC input
//const int Pin_DC_bias = 25;  // pin to provide dc bias to AC current ADC samples 
const int Pin_time = 4; // pin to check sampling time
const int nsamples = 1000;
const unsigned long time_between_messages = 300000UL; // Time in msec
const double power_change = 200.0;  //The power change threshold to send MQTT message
const double fsamples = 1000.0;
const double twoPI = 6.2831853;
//const int DC_bias = 127; // 255 is full scale ~3.3 volts not using in design using resitor divider
const double SF_line1 = 0.00934755; //  
const double SF_line2 = 0.00934755; // Scale factors determined by calibrating against power meter
volatile int buff_cnt = 0;
volatile int buff1 = true;  // Buffer indicator: true = buff1 and false = buff2 
volatile double line1_buff1[nsamples];
volatile double line1_buff2[nsamples];
volatile double line2_buff1[nsamples];
volatile double line2_buff2[nsamples];
volatile double v_buff1[nsamples];
volatile double v_buff2[nsamples];
volatile bool buff1_full = false;
volatile bool buff2_full = false;
volatile double line1_energy = 0.0;
volatile double line2_energy = 0.0;
volatile double total_energy = 0.0;
volatile double line1_avg_pwr;
volatile double line2_avg_pwr;
volatile double total_power;
volatile double line1_energy_buff = 0.0;
volatile double line2_energy_buff = 0.0;
volatile double total_energy_buff = 0.0;
volatile double line1_avg_pwr_buff = 0.0;
volatile double line2_avg_pwr_buff = 0.0;
volatile double total_power_buff = 0.0;
volatile double value[6];
volatile bool MQTT_message_flag = false;
volatile long last_time = 0L;
String line1_avg_pwr_topic = "sensor/clamp1_power";
String line2_avg_pwr_topic = "sensor/clamp2_power";
String total_power_topic = "sensor/total_power";
String line1_energy_topic = "sensor/clamp1_energy";
String line2_energy_topic = "sensor/clamp2_energy";
String total_energy_topic = "sensor/total_energy";
String topic0 = "sensor/clamp1_power";
String topic1 = "sensor/clamp2_power";
String topic2 = "sensor/total_power";
String topic3 = "sensor/clamp1_energy";
String topic4 = "sensor/clamp2_energy";
String topic5 = "sensor/total_energy";
TaskHandle_t Sc;
TaskHandle_t Cap;
TaskHandle_t Sp;

long strt = 0L;
// Set Static IP address
IPAddress local_IP(192, 168, 1, 41);
// Set Gateway  and subnet
IPAddress gateway(192, 168, 1, 1);
IPAddress subnet(255, 255, 0, 0);


/***          Function Prototypes        ****/
void handleTelnet(void);
double multiple_adc_read(int pinnum);
void Sample_current( void *pvParameters );
void Calculate_avg_power( void *pvParameters );
void Send_power(void *pvParameters);
void callback(char* topic, byte* payload, unsigned int length);
/*
   Function called to handle Telnet clients
   https://www.youtube.com/watch?v=j9yW10OcahI
*/
#if defined(DEBUG_TELNET)
void handleTelnet(void) {
  if (telnetServer.hasClient()) {
    if (!telnetClient || !telnetClient.connected()) {
      if (telnetClient) {
        telnetClient.stop();
      }
      telnetClient = telnetServer.available();
    } else {
      telnetServer.available().stop();
    }
  }
}
#endif

void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i=0;i<length;i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
}


/*--------------------------------------------------*/
/*---------------------- Tasks ---------------------*/
/*--------------------------------------------------*/

void Send_power(void *pvParameters)  // This is a task.
// This is a task to send the power and energy data to Home-Assistant MQTT server when flag is set.
{
  (void) pvParameters;
  String topic;
 for (;;) // A Task that never returns or exits.
  {
    vTaskDelay(1);
    ArduinoOTA.handle();
    #if defined(DEBUG_TELNET)
    // handle the Telnet connection
     handleTelnet();
    #endif
    strt=xTaskGetTickCount();
    if(MQTT_message_flag == true)  //Only send data when true
    {
      mqtt_cnt = 0;    
        while (!client.connected() &&  mqtt_cnt <6)
        { 
      
          DEBUG_PRINTLN("Connecting to MQTT...");
          if (client.connect("ESP32Power")) 
          {
            DEBUG_PRINTLN("connected to MQTT server");
            //DEBUG_PRINTLN("line1_avg_pwr string = " + String(line1_avg_pwr_buff));
            client.subscribe(line1_avg_pwr_topic.c_str());
            client.publish(line1_avg_pwr_topic.c_str(), String(line1_avg_pwr_buff).c_str(), true);
            client.publish(line2_avg_pwr_topic.c_str(), String(line2_avg_pwr_buff).c_str(), true);
            client.publish(total_power_topic.c_str(), String(total_power_buff).c_str(), true);
            client.publish(line1_energy_topic.c_str(), String(line1_energy_buff).c_str(), true);
            client.publish(line2_energy_topic.c_str(), String(line2_energy_buff).c_str(), true);
            client.publish(total_energy_topic.c_str(), String(total_energy_buff).c_str(), true);
            client.subscribe(total_energy_topic.c_str());

          } 
          else 
          {
            DEBUG_PRINT("failed with state ");
            DEBUG_PRINTLN(client.state());
            delay(1000);
            mqtt_cnt ++;  // only allow 6 trys for connection to MQTT server
          }
          if(mqtt_cnt >= 6) esp_restart(); // restart the device at this point
          // Todo: Save line 1, line 2 and total energy other wise they are reset to 0
          // Possibly could just call WiFi.mode(WIFI_OFF) and WiFi.begin(...) 
  
         }
      client.disconnect();
      //WiFi.disconnect();    
      //WiFi.mode(WIFI_OFF);
      MQTT_message_flag = false;  //reset flag
      //DEBUG_PRINTLN(xTaskGetTickCount());
        DEBUG_PRINTLN(ESP.getFreeHeap());
      //DEBUG_PRINTLN("Reset MQTT flag");
      //vTaskResume(Sc);
      //vTaskResume(Cap);

    }
  }
}

void Calculate_avg_power(void *pvParameters)  // This is a task.
// This is a task to calculate average power (real power) once a second from sampled current ADC Buffer.
{
  (void) pvParameters;
  int jj;
  int kk = 0;
  double sum_line1 = 0.0;
  double sum_line2 = 0.0;
  double sum_v = 0.0;
  double DC_offset1, DC_offset2, DC_offsetv;
  double sum_line1_pwr = 0.0; 
  double sum_line2_pwr = 0.0;
  volatile double total_power_p;   //Power from last measurement
  //volatile long last_time = 0L;  //Time of last MQTT message

  /*
  Calculates power and energy once a second of line current and voltage of ADC buffer*/


  for (;;) // A Task that never returns or exits.
  {
    vTaskDelay(1);
    if(buff1_full || buff2_full)
    {

      for(jj = 0; jj < nsamples; jj++)
      {
        if(buff1_full)
        {
          //DEBUG_PRINTLN(line1_buff1[jj]);
          sum_line1 += line1_buff1[jj];
          sum_line2 += line2_buff1[jj];
          sum_v += v_buff1[jj];
        }
        else
        {
          sum_line1 += line1_buff2[jj];
          sum_line2 += line2_buff2[jj];
          sum_v += v_buff2[jj];
        }
      }
      DC_offset1 = sum_line1/fsamples;
      DC_offset2 = sum_line2/fsamples;
      DC_offsetv = sum_v/fsamples;
      //DEBUG_PRINT("DC=");  DEBUG_PRINTLN(DC_offset1);
     for(jj = 0; jj < nsamples; jj++)
     {
       if(buff1_full)
       {
          sum_line1_pwr += (line1_buff1[jj] - DC_offset1) * (v_buff1[jj] - DC_offsetv);
          sum_line2_pwr += (line2_buff1[jj] - DC_offset2) * (v_buff1[jj] - DC_offsetv);       
       }
       else
       {
          sum_line1_pwr += (line1_buff2[jj] - DC_offset1) * (v_buff2[jj] - DC_offsetv);
          sum_line2_pwr += (line2_buff2[jj] - DC_offset2) * (v_buff2[jj] - DC_offsetv);
       }
      }
      //DEBUG_PRINT("buff1=");  DEBUG_PRINTLN(buff1);
      //line1_rms_current = sqrt(sum_line1_sqr/fsamples); 
      //line2_rms_current = sqrt(sum_line2_sqr/fsamples);

      // Take the absolute value of the power because on the the line currents
      // is out of phase with the voltage just in case this is not taken care
      // in the output connection of the current clamp.
      line1_avg_pwr = abs(sum_line1_pwr/fsamples) * SF_line1;
      line2_avg_pwr = abs(sum_line2_pwr/fsamples) * SF_line2;
      /* 
      delay(5);    
      DEBUG_PRINT(kk);  DEBUG_PRINT(":1:");  DEBUG_PRINTLN(line1_avg_pwr); 
      DEBUG_PRINT(kk);  DEBUG_PRINT(":2:");  DEBUG_PRINTLN(line2_avg_pwr);    
      delay(5);
      */
      total_power_p = total_power; //Save previous total power reading
      total_power = line1_avg_pwr + line2_avg_pwr;
      //output one second power for data noise analysis
      //DEBUG_PRINTLN(total_power);
      line1_energy += line1_avg_pwr/3600.0/1000.0;  // kWh  
      line2_energy += line2_avg_pwr/3600.0/1000.0;  // kWh
      total_energy = line1_energy + line2_energy; // kWh 
      // zero out sums for next pass
      sum_line1 = 0.0;
      sum_line2 = 0.0;
      sum_v = 0.0;
      sum_line1_pwr = 0.0; 
      sum_line2_pwr = 0.0;
      // Flag buffer full as false because data of buffer has been calculated
      if(!buff1)
      {
        buff1_full = false;
        kk++;
      }
      else
      {
        buff2_full = false;
        kk++;
      }
      // Check for significant power change or 5 minutes since last message to 
      // set Flag to send measurements message to Home-Assistant MQTT server
      if((xTaskGetTickCount()-last_time > time_between_messages) || abs(total_power-total_power_p) > power_change )
      {
        line1_energy_buff = line1_energy;
        line2_energy_buff = line2_energy;
        total_energy_buff = total_energy;
        line1_avg_pwr_buff = line1_avg_pwr;
        line2_avg_pwr_buff = line2_avg_pwr;
        total_power_buff = total_power;
        /*line1_energy_buff++;
        line2_energy_buff++;
        total_energy_buff++;
        line1_avg_pwr_buff++;
        line2_avg_pwr_buff++;
        total_power_buff++;*/
        //for(int q=0; q<6; q++)
        //{
         // value[q]++;
        //}
        MQTT_message_flag = true;
        last_time = xTaskGetTickCount();
        //vTaskSuspend(Sc);
        //vTaskSuspend(Cap);

      }  
    }
  }
}

void Sample_current(void *pvParameters)  // This is a task.
{
  (void) pvParameters;
  
/*
Read current of both lines and voltage
*/
  TickType_t xLastWakeTime;
  const TickType_t xFrequency = 1;
  // Initialise the xLastWakeTime variable with the current time.
  xLastWakeTime = xTaskGetTickCount();
  //DEBUG_PRINTLN("got to here2");
  for (;;) // A Task that never returns or exits.
  {
    // Wait for the next cycle.
    vTaskDelayUntil( &xLastWakeTime, xFrequency );
    digitalWrite(Pin_time, HIGH);
    //  DEBUG_PRINT(".");
        if( buff_cnt < nsamples && buff1)
    {  
      noInterrupts();
      line1_buff1 [buff_cnt] = multiple_adc_read(line1_current);
      line2_buff1 [buff_cnt] = multiple_adc_read(line2_current);
      v_buff1 [buff_cnt] = multiple_adc_read(voltage);
      //v_buff1 [buff_cnt] = 200.0*sin(twoPI * 60.0 * double(buff_cnt)/fsamples) +  multiple_adc_read(voltage);
      interrupts();
      //DEBUG_PRINTLN(".");
    }
    else if( buff_cnt < nsamples && !buff1)
    {
      noInterrupts();
      line1_buff2 [buff_cnt] = multiple_adc_read(line1_current);
      line2_buff2 [buff_cnt] = multiple_adc_read(line2_current);  
      v_buff2 [buff_cnt] = multiple_adc_read(voltage);
      //v_buff2 [buff_cnt] = 200.0*sin(twoPI * 60.0 * double(buff_cnt)/fsamples) +  multiple_adc_read(voltage);
      interrupts();
      //DEBUG_PRINTLN("-");
  
    }
    buff_cnt++;  // Increment data index
    if(buff_cnt == nsamples)
    {
      if(buff1)
      {
        buff1_full = true;
        //DEBUG_PRINTLN(buff1_full);
        //buff2_full = false;  // Extra insurance
        buff_cnt = 0;
        buff1 = false;  // Switch to buffer 2
      } 
      else
      {
        buff2_full = true;
        //buff1_full = false;  // Extra insurance
        buff_cnt = 0;
        buff1 = true;  // Switch to buffer 1    
      }
    }
  digitalWrite(Pin_time, LOW);  
  } 
}

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize serial communication at 115200 bits per second:
  Serial.begin(115200);
  delay(10);
  // ****  Start and connect to WiFi network **** //
  WiFi.mode(WIFI_STA);
  WiFi.setHostname(hostname);
  WiFi.config(local_IP, gateway, subnet);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED && wifi_cnt < 6) {
    delay(1000);
    wifi_cnt ++;  
    DEBUG_PRINTLN("Connecting to WiFi..");
  }
  if(wifi_cnt < 6){  //only allow about 4 seconds for connection to wifi router
    DEBUG_PRINTLN("Connected to the WiFi network");
    DEBUG_PRINT("IP address: ");  DEBUG_PRINTLN(WiFi.localIP());
  }   
  else{
    DEBUG_PRINTLN(" NOT connected to the WiFi network");  
  }
 
  client.setServer(mqttServer, mqttPort);
  client.setCallback(callback);

  pinMode(line1_current, INPUT);
  pinMode(line2_current, INPUT);
  //pinMode(Pin_DC_bias, OUTPUT);
  pinMode(Pin_time, OUTPUT);
  //dacWrite(Pin_DC_bias, DC_bias);
  DEBUG_PRINTLN("got to here");

 #if defined(DEBUG_SERIAL)
//    Serial.begin(115200); //already started
  #elif defined(DEBUG_TELNET)
    telnetServer.begin();
    telnetServer.setNoDelay(true);
  #endif


  // Setup OTA
  #if defined(OTA_password)
    ArduinoOTA.setPassword((const char *)OTA_password);
  #endif
    DEBUG_PRINTLN(String("Hostname: ") + hostname);
    ArduinoOTA.setHostname(hostname);
  //  ArduinoOTA.onProgress(drawOtaProgress);
  ArduinoOTA.begin();
  
  //esp_wifi_set_max_tx_power(127);   

  // Now set up three tasks to run independently.
  xTaskCreatePinnedToCore(
    Sample_current
    ,  "Sample_current"
    ,  2048  // Stack size
    ,  NULL
    ,  6  // Priority
    ,  &Sc // Task Handle
    ,  1);  //Run on Core 1 for best sampling?
  xTaskCreatePinnedToCore(
    Calculate_avg_power
    ,  "Calculate_avg_power"   // A name just for humans
    ,  8192  // This stack size can be checked & adjusted by reading the Stack Highwater
    ,  NULL
    ,  4  // Priority of 2 (configMAX_PRIORITIES - 1) being the highest, and 0 being the lowest.
    ,  &Cap //Task Handle
    ,  0);
  xTaskCreatePinnedToCore(
    Send_power
    ,  "Send_power"   // A name just for humans
    ,  8192  // This stack size can be checked & adjusted by reading the Stack Highwater
    ,  NULL
    ,  2  // Priority of 3 (configMAX_PRIORITIES - 1) being the highest, and 0 being the lowest.
    ,  &Sp 
    ,  0);

  // Now the task scheduler, which takes over control of scheduling individual tasks, is automatically started.
}

void loop()
{
}


double multiple_adc_read(int pinnum){
   // function takes ~ 40 usec for 4 ADC reads
   const int num_samples = 4;
   double reading_sum = 0.0;
   double reading_avg;
   for(int i = 0; i <num_samples ; i++) reading_sum += double(analogRead(pinnum));
   reading_avg = reading_sum/double(num_samples);
   return reading_avg;
}


