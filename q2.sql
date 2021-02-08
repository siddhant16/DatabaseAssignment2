SELECT * FROM YELP_USER WHERE yelp_user_id  NOT IN
(SELECT YELP_USER_ID FROM YELP_CHECKIN yc JOIN YELP_BUSINESS yb 
ON yb.BUSINESS_ID = yc.BUSINESS_ID JOIN YELP_BUSINESS_ADDRESS yba 
ON yb.BUSINESS_ID = yba.BUSINESS_ID WHERE yba.STATE = 'CA') AND
birthplace = 'CA';
