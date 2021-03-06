SELECT YMB.BUSINESS_ID, COUNT(*) AS NO_OF_REVIEWS FROM 
(SELECT YB.* FROM   YELP_BUSINESS YB JOIN YELP_BUSINESS_ADDRESS YBA 
ON YB.BUSINESS_ID = YBA.BUSINESS_ID
WHERE  STATE = 'CA' AND DAYS_OF_OPERATION NOT LIKE '%Sunday%' AND AMBIENT = 'Touristy') YMB 
JOIN YELP_REVIEWS YR ON 
YMB.BUSINESS_ID = YR.BUSINESS_ID  AND YR.AUTHOR NOT IN 
(SELECT YELP_USER_ID FROM YELP_USER WHERE  BIRTHPLACE = 'CA') 
GROUP  BY YMB.BUSINESS_ID 
ORDER  BY NO_OF_REVIEWS DESC,  TO_NUMBER(SUBSTR(YMB.BUSINESS_ID, 2)); 