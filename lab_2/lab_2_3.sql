SELECT start_station_name AS active_station_name, COUNT(bt.trip_id) AS num_trips, AVG(bt.duration_minutes) AS duration_minutes
FROM bigquery-public-data.austin_bikeshare.bikeshare_trips AS bt
JOIN bigquery-public-data.austin_bikeshare.bikeshare_stations AS bs
ON bt.start_station_id = bs.station_id
WHERE bs.status = 'active'
GROUP BY start_station_name
ORDER BY num_trips DESC