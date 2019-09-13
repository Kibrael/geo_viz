SELECT 
	CONCAT(state, county),
	COUNT(*)
FROM s3_out.lar_2018_07_24
WHERE 
	CONCAT(agency_code, respondent_id) IN ( 
		SELECT
			CONCAT(agency_code, respondent_id)
		FROM 
			s3_out.lar_2018_07_24
		GROUP BY 
			CONCAT(agency_code, respondent_id)
		HAVING 
			COUNT(*) >=500) AND
	CONCAT(state,county) NOT LIKE '%NA%' AND
	state != '' AND 
	county != ''
GROUP BY CONCAT(state, county)
ORDER BY CONCAT(state, county) ASC

  