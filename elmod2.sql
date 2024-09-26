SELECT * FROM deflections
SELECT * FROM moduli
SELECT * FROM gps
SELECT * FROM thickness
SELECT * FROM materials


SELECT
	B."FileName" AS FULL_FILE_NAME,
	A."FileName" AS FILE_NAME ,
	B."batch_no" AS BATCH,
	'Network' as SURVEY_TYPE,
	B."Chainage" AS CHAINAGE,
	B."PointNo" AS POINT_NO,
	B."Drop No" AS DROP_NO,
	B."Stress" AS STRESS ,
	B."Load" AS "LOAD" ,
	B."D1",
	B."D2",
	B."D3",
	B."D4",
	B."D5",
	B."D6",
	B."D7",
	B."D8",
	B."D9",
	B."Temperature1" AS TEMP_AC , 
	B."AirTemperature" AS TEMP_AIR ,
	B."Temperature2" AS TEMP_SURF,
	B."TheTime" AS SURVEY_DATE,
	D."Latitude" AS LATITUDE ,
	D."Longitude" AS LONGITUDE, 
	D."Height" AS HEIGHT,
	A."H1",
	A."H2",
	A."H3",
	A."H4",
	A."Method" AS "METHOD",
	A."Temperature",
	A."E1",
	A."E1_Ref" AS E1_REF,
	A."E2",
	A."E3",
	A."E4",
	A."E5",
	A."RMS"	
FROM moduli AS A
LEFT OUTER JOIN deflections AS B
ON A.batch_no = B.batch_no
AND A."FileName" = B."FileName"
AND A."Drop" = B."Drop No"
AND A."PointNo" = B."PointNo"
LEFT OUTER JOIN gps AS D
ON A.batch_no = D.batch_no
AND A."FileName" = D."FileName"
AND A."PointNo" = D."PointNo"
AND A."Chainage" = D."Chainage"
-- where B."D1" IS NULL
ORDER BY B."FileName", B."PointNo"
