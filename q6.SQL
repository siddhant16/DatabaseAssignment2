SELECT * FROM (SELECT YC.YELP_USER_ID, 
       YU.FIRSTNAME, 
       YU.LASTNAME, 
       COUNT(YC.CHECKIN_ID) AS NO_OF_CHECKIN 
FROM   YELP_CHECKIN YC
       INNER JOIN YELP_USER YU
               ON YC.YELP_USER_ID = YU.YELP_USER_ID 
       INNER JOIN YELP_BUSINESS YB
               ON YC.BUSINESS_ID = YB.BUSINESS_ID 
HAVING (SELECT COUNT(DISTINCT(STATE)) FROM YELP_BUSINESS_ADDRESS ) > 5 
GROUP  BY YC.YELP_USER_ID, 
          YU.FIRSTNAME, 
          YU.LASTNAME 
ORDER  BY COUNT(YC.CHECKIN_ID) DESC, 
          TO_NUMBER(SUBSTR(YC.YELP_USER_ID, 2)) ASC)
          WHERE ROWNUM <= 10
          
-- from the given data the 5 star is given to review, in the query its given as 5 star business, that is why i have queried without assigning condition of 5 star review
 