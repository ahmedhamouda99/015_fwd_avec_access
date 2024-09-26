-- To clean the database according to the check of the files done in python


SELECT * FROM summary_table
where file_name = 'H10-R-L2-1479-1438.mdb'
WHERE guid = '52549DD6A2BC42F0A338093019C76DAA'

UPDATE summary_table
SET file_name = 'H70-R-L3-460-435.mdb',
	dir_cd = 'R'
WHERE guid = '52549DD6A2BC42F0A338093019C76DAA'

SELECT * 
DELETE
FROM stations
WHERE stations."Latitude" = 0

SELECT * FROM stations
WHERE "AsphaltTemperature" IS NULL

SELECT * FROM stations
where stations."Station" is null

24.510721160834308

UPDATE stations
SET "AsphaltTemperature" = "SurfaceTemperature"
WHERE "AsphaltTemperature" IS NULL


UPDATE stations
SET "Station" = "StationID"
WHERE "Station" IS NULL
	
select * from drops
where "Asphalt" is null

UPDATE drops
SET "Asphalt" = "Surface"
where "Asphalt" is null

	
SELECT * 
-- DELETE 
FROM Stations
WHERE "GUID" = (SELECT guid FROM summary_table
where file_name = 'H8555-R-L2-64-23.mdb'
) 
-- AND "StationID" = 40

SELECT * FROM stations
WHERE stations."Longitude" is null

SELECT * FROM stations
WHERE "GUID" in (
sELECT guid FROM (
SELECT row_number () OVER (PARTITION BY road_no, dir_cd ORDER BY cast (start_kp as INTEGER)),road_no, dir_cd, start_kp, file_name, guid FROM summary_table
WHERE road_no = '44' and dir_cd = 'M') AS A)


SELECT batch_no, road_no, dir_cd, min (start_kp), MAX (end_kp) FROM summary_table
where dir_cd = 'M'
GROUP BY batch_no, road_no, dir_cd
order by cast (road_no as int) , dir_cd

select *,
	CASE 
		WHEN start_kp < end_kp THEN start_kp
		ELSE end_kp
	END AS min_kp,
	CASE 
		WHEN start_kp < end_kp THEN end_kp
		ELSE start_kp
	END AS max_kp
FROM summary_table

SELECT A.* FROM drops AS A
LEFT OUTER JOIN stations AS B
ON A."GUID" = B."GUID"
AND A."StationID" = B."StationID"
WHERE B."Latitude" IS NOT NULL 
-- AND B."GUID" = '342D4887F3DA4CB5B65CD8F3460913E'