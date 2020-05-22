-- SQLite
SELECT DISTINCT 
    entity_id,
    state,
    created
FROM
    states
WHERE
    entity_id = "sensor.total_house_power";
-- SQLite
