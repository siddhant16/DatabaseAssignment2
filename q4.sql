SELECT YB.BUSINESS_ID, COUNT(*) AS NO_OF_REVIEWS FROM YELP_BUSINESS YB JOIN YELP_REVIEWS YR
ON YB.BUSINESS_ID = YR.BUSINESS_ID JOIN YELP_USER YU
ON YR.AUTHOR = YU.YELP_USER_ID AND YR.AUTHOR IN 
(SELECT YELP_USER_ID FROM YELP_USER_FRIENDLIST)
GROUP BY YB.BUSINESS_ID
ORDER BY NO_OF_REVIEWS DESC, 
TO_NUMBER(SUBSTR(YB.BUSINESS_ID, 2, 2 ));


--in this query I have assumed that the complimented friendlist in the yelp_user data are the friends who are complimented by the yelp user