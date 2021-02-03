---CREATE TABLE QUERIES---

CREATE TABLE YELP_USER(
    Yelp_user_id varchar(3),
    Email varchar(25) NOT NULL,
    FirstName varchar(15) NOT NULL,
    LastName varchar(15) NOT NULL,
    DOB DATE NOT NULL,
    BirthPlace varchar(20),
    Gender char(1) NOT NULL,
    CONSTRAINT YELP_USER_PK PRIMARY KEY(Yelp_user_id)
);

CREATE TABLE USER_FRIENDLIST(
    Yelp_user_id varchar(3),
    Yelp_friend_id varchar(3) NOT NULL,
    CONSTRAINT USR_FRNDLST PRIMARY KEY (Yelp_user_id, Yelp_friend_id),
    CONSTRAINT USR_FRNDLST_FK_Yelp_user_id FOREIGN KEY (Yelp_user_id) REFERENCES YELP_USER(Yelp_user_id) ON DELETE CASCADE,
    CONSTRAINT USR_FRNDLST_FK_Yelp_frnd_id FOREIGN KEY (Yelp_friend_id) REFERENCES YELP_USER(Yelp_user_id) ON DELETE CASCADE
);

CREATE TABLE COMPLIMENTED_FRIENDLIST(
    Yelp_user_id varchar(3),
    Yelp_friend_id varchar(3) NOT NULL,
    CONSTRAINT Com_Frndlst_PK PRIMARY KEY (Yelp_user_id, Yelp_friend_id),
    CONSTRAINT Com_Frndlst_FK_Yelp_user_id FOREIGN KEY (Yelp_user_id) REFERENCES YELP_USER(Yelp_user_id) ON DELETE CASCADE ,
    CONSTRAINT Com_Frndlst_FK_Yelp_friend_id FOREIGN KEY (Yelp_friend_id) REFERENCES YELP_USER(Yelp_user_id) ON DELETE CASCADE
);

CREATE TABLE BUSINESS_CATEGORY(
    Business_cat_id varchar(5),
    Business_cat_name varchar(25),
    CONSTRAINT Business_Category_PK PRIMARY KEY (Business_cat_id) 
);

CREATE TABLE BUSINESS_SUB_CATEGORY 
(
    Business_cat_id varchar(5),
    Business_sub_cat_name varchar(100),
    constraint BNESS_SUB_CAT_PK PRIMARY KEY (Business_cat_id, Business_sub_cat_name),
    constraint BNESS_SUB_CAT_FK_Bus_cat_id FOREIGN KEY (Business_cat_id) REFERENCES BUSINESS_CATEGORY(Business_cat_id) ON DELETE CASCADE 
);

CREATE TABLE BUSINESS(
    Business_id varchar(5),
    Business_name varchar(25),
    Days_Of_Operation varchar(50),
    Ambient varchar(20),
    Business_cat_id varchar(7),
    CONSTRAINT Business_PK PRIMARY KEY(Business_id),
    CONSTRAINT Business_FK_Business_cat_id FOREIGN KEY (Business_cat_id) REFERENCES BUSINESS_CATEGORY(Business_cat_id) ON DELETE CASCADE
);

CREATE TABLE BUSINESS_ADDRESS(
    Business_id varchar(5),
    Street_no varchar(15),
    Street_name varchar(25),
    City varchar(15),
    State varchar(15),
    ZipCode number,
    CONSTRAINT BUSINESS_ADDRESS_PK PRIMARY KEY(Business_id),
    CONSTRAINT Business_Address_FK FOREIGN KEY (Business_id) REFERENCES BUSINESS(Business_id) ON DELETE CASCADE
); 


CREATE TABLE CHECKIN(
    Checkin_id varchar(5),
    Yelp_user_id varchar(3),
    Business_id varchar(5),
    Info varchar(100),
    CONSTRAINT Checkin_PK PRIMARY KEY (checkin_id),
    CONSTRAINT Checkin_FK_Yelp_user_id FOREIGN KEY (Yelp_user_id) REFERENCES YELP_USER(Yelp_user_id) ON DELETE CASCADE,
    CONSTRAINT Checkin_FK_Checkin_Business_id FOREIGN KEY (Business_id) REFERENCES BUSINESS(Business_id) ON DELETE CASCADE
);

CREATE TABLE REVIEWS(
    Review_id varchar(5),
    No_of_Stars number,
    Author varchar(5),
    Publish_Date date,
    Business_id varchar(5),
    CONSTRAINT Review_PK PRIMARY KEY (REVIEW_ID),
    CONSTRAINT Review_FK_Author FOREIGN KEY (Author) REFERENCES YELP_USER(Yelp_user_id) ON DELETE CASCADE,
    CONSTRAINT Review_FK_Business_id FOREIGN KEY (Business_id) REFERENCES BUSINESS(Business_id) ON DELETE CASCADE
);


CREATE TABLE LIST_OF_COMMENTS(
    Review_id varchar2(3),
    Yelp_user_id varchar(3),
    Comments varchar(150),
    CONSTRAINT Lst_Comments_PK PRIMARY KEY (Review_id, Yelp_user_id),
    CONSTRAINT Lst_Comments_FK_Yelp_user_id FOREIGN KEY (Yelp_user_id) REFERENCES YELP_USER(Yelp_user_id) ON DELETE CASCADE,
    CONSTRAINT Lst_Comments_FK_Review_id FOREIGN KEY (Review_id) REFERENCES REVIEWS(Review_id) ON DELETE CASCADE
);


---INSERT DATA QUERIES------

INSERT ALL 
INTO YELP_USER VALUES ('Y1','john@yahoo.com','John','Smith',TO_DATE('12/12/1992','MM/DD/YYYY'),'FL','M');
INTO YELP_USER VALUES ('Y2','juan@gmail.com','Juan','Carlos',TO_DATE('2/7/1988','MM/DD/YYYY'),'AK','M');
INTO YELP_USER VALUES ('Y3','Jane@gmail.com','Jane','Chapel',TO_DATE('6/1/1980','MM/DD/YYYY'),'IL','F');
INTO YELP_USER VALUES ('Y4','adi@yahoo.com','Aditya','Awasthi',TO_DATE('4/12/1994','MM/DD/YYYY'),'CA','M');
INTO YELP_USER VALUES ('Y5','james@hotmail.com','James','Williams',TO_DATE('5/5/1991','MM/DD/YYYY'),'NY','M');
INTO YELP_USER VALUES ('Y6','mike@yahoo.com','Mike','Brown',TO_DATE('3/1/1988','MM/DD/YYYY'),'NC','M');
INTO YELP_USER VALUES ('Y7','bob@yahoo.com','Bob','Jones',TO_DATE('2/19/1970','MM/DD/YYYY'),'NY','M');
INTO YELP_USER VALUES ('Y8','wei@gmail.com','Wei','Zhang',TO_DATE('3/18/1975','MM/DD/YYYY'),'NV','F');
INTO YELP_USER VALUES ('Y9','mark@gmail.com','Mark','Davis',TO_DATE('11/2/1993','MM/DD/YYYY'),'CA','M');
INTO YELP_USER VALUES ('Y10','daniel@yahoo.com','Daniel','Garcia',TO_DATE('5/10/1984','MM/DD/YYYY'),'NJ','M');
INTO YELP_USER VALUES ('Y11','maria@hotmail.com','Maria','Rodriguez',TO_DATE('8/12/1985','MM/DD/YYYY'),'CA','F');
INTO YELP_USER VALUES ('Y12','freya@yahoo.com','Freya','Wilson',TO_DATE('10/5/1995','MM/DD/YYYY'),'NJ','F');

INSERT ALL
INTO USER_FRIENDLIST VALUES('Y1','Y2');
INTO USER_FRIENDLIST VALUES('Y1','Y7');
INTO USER_FRIENDLIST VALUES('Y1','Y9');
INTO USER_FRIENDLIST VALUES('Y3','Y6');
INTO USER_FRIENDLIST VALUES('Y3','Y11');
INTO USER_FRIENDLIST VALUES('Y3','Y5');
INTO USER_FRIENDLIST VALUES('Y4','Y7');
INTO USER_FRIENDLIST VALUES('Y4','Y11');
INTO USER_FRIENDLIST VALUES('Y6','Y2');
INTO USER_FRIENDLIST VALUES('Y6','Y4');
INTO USER_FRIENDLIST VALUES('Y7','Y1');
INTO USER_FRIENDLIST VALUES('Y7','Y3');
INTO USER_FRIENDLIST VALUES('Y8','Y6');
INTO USER_FRIENDLIST VALUES('Y8','Y1');
INTO USER_FRIENDLIST VALUES('Y9','Y1');
INTO USER_FRIENDLIST VALUES('Y9','Y2');
INTO USER_FRIENDLIST VALUES('Y11','Y3');
INTO USER_FRIENDLIST VALUES('Y11','Y5');
INTO USER_FRIENDLIST VALUES('Y12','Y11');

INSERT ALL
INTO COMPLIMENTED_FRIENDLIST VALUES('Y1','Y7');
INTO COMPLIMENTED_FRIENDLIST VALUES('Y1','Y9');
INTO COMPLIMENTED_FRIENDLIST VALUES('Y3','Y6');
INTO COMPLIMENTED_FRIENDLIST VALUES('Y4','Y11');
INTO COMPLIMENTED_FRIENDLIST VALUES('Y6','Y4');
INTO COMPLIMENTED_FRIENDLIST VALUES('Y7','Y3');
INTO COMPLIMENTED_FRIENDLIST VALUES('Y8','Y6');
INTO COMPLIMENTED_FRIENDLIST VALUES('Y9','Y2');
INTO COMPLIMENTED_FRIENDLIST VALUES('Y11','Y5');
INTO COMPLIMENTED_FRIENDLIST VALUES('Y12','Y11');

INSERT ALL
INTO BUSINESS_CATEGORY VALUES ('BCT1','Amusement Parks');
INTO BUSINESS_CATEGORY VALUES ('BCT2','National Parks');
INTO BUSINESS_CATEGORY VALUES ('BCT3','Career Counseling');
INTO BUSINESS_CATEGORY VALUES ('BCT4','Food and More');
INTO BUSINESS_CATEGORY VALUES ('BCT5','Bars');
INTO BUSINESS_CATEGORY VALUES ('BCT6','Restaurents');
INTO BUSINESS_CATEGORY VALUES ('BCT7','Pool Cleaners');
INTO BUSINESS_CATEGORY VALUES ('BCT8','Coffee Shops');


INSERT ALL
INTO BUSINESS_SUB_CATEGORY VALUES ('BCT1','Water Parks');
INTO BUSINESS_SUB_CATEGORY VALUES ('BCT2','Wildlife National Parks');
INTO BUSINESS_SUB_CATEGORY VALUES ('BCT3','Career Counselling for kids');
INTO BUSINESS_SUB_CATEGORY VALUES ('BCT4','Ice-cream and Yougurt');
INTO BUSINESS_SUB_CATEGORY VALUES ('BCT5','Sports bar');
INTO BUSINESS_SUB_CATEGORY VALUES ('BCT6','Ice-cream and Yougurt');
INTO BUSINESS_SUB_CATEGORY VALUES ('BCT7','Swimming pool cleaners');
INTO BUSINESS_SUB_CATEGORY VALUES ('BCT8','Cold coffee shops');

INSERT ALL
INTO BUSINESS VALUES ('B1','Big Surf','Mon, Tue, Wed','Touristy','BCT1');
INTO BUSINESS VALUES ('B2','SMITH THOMSON ','Mon, Tue, Wed, Thu','Touristy','BCT6');
INTO BUSINESS VALUES ('B3','Bay Area Coffee Shop','Mon, Tue, Wed','Touristy', 'BCT8');
INTO BUSINESS VALUES ('B4','China  Coffee Toffee ','Mon, Tue, Wed','Touristy','BCT4');
INTO BUSINESS VALUES ('B5','Hastings Water Works','Mon, Tue, Wed','','BCT7');
INTO BUSINESS VALUES ('B6','Catch Your Big Break','Mon, Tue, Wed, Thu, Fri, Sat, Sun','','BCT3');
INTO BUSINESS VALUES ('B7','The Cinebar','Mon, Tue, Wed, Thu','','BCT5');
INTO BUSINESS VALUES ('B8','Coffee Bar  Bistro','Mon, Tue, Wed','','BCT5');
INTO BUSINESS VALUES ('B9','Hobees','Mon, Tue, Wed, Thu, Fri','','BCT6')
INTO BUSINESS VALUES ('B10','Cafe Gourmet','Mon, Tue','','BCT6')
INTO BUSINESS VALUES ('B11','Yellow Stone National Park','Mon, Fri, Sat, Sun','','BCT2');
INTO BUSINESS VALUES ('B12','Petrified Forest National Park','Mon, Thu, Sun','','BCT2');
INTO BUSINESS VALUES ('B13','Grand Canyon National park','Mon, Sat, Sun','','BCT2');
INTO BUSINESS VALUES ('B35','Connecticut Bar','Mon, Thu, Sun','','BCT5');
INTO BUSINESS VALUES ('B36','Sherleys Bar  Restaurent','Mon, Wed, Sun','', 'BCT5');
INTO BUSINESS VALUES ('B14','Connecticut Bar  Restaurent','Mon, Wed, Sun','','BCT5');

INSERT ALL
INTO BUSINESS_ADDRESS VALUES('B1', 1500, 'N McClintock Dr', 'Tempe', 'AZ', 85281);
INTO BUSINESS_ADDRESS VALUES('B2', 1595, 'Spring Hill Road Suite 110', 'Vienna', 'VA', 22182);
INTO BUSINESS_ADDRESS VALUES('B3', 1522, 'W. Sam Rayburn Dr.', 'Bonham', 'CA', 95051);
INTO BUSINESS_ADDRESS VALUES('B4', 2570, 'El Camino Real', 'Santa Clara', 'CA', 95051);
INTO BUSINESS_ADDRESS VALUES('B5', 10331, 'Brecksville Rd.', 'Brecksville', 'OH', 44141);
INTO BUSINESS_ADDRESS VALUES('B6', 2341, 'Roosevelt Ct', 'Santa Clara', 'CA', 95051);
INTO BUSINESS_ADDRESS VALUES('B7', 2O285, 'South Western Ave. Suite # 2OO', 'Torrance', 'CA', 9O5O1);
INTO BUSINESS_ADDRESS VALUES('B8', 2585, 'El Camino Real', 'Santa Clara', 'CA', 95050);
INTO BUSINESS_ADDRESS VALUES('B9', 90, 'Skyport Dr', 'San Jose', 'CA', 95110);
INTO BUSINESS_ADDRESS VALUES('B10', 80, 'N Market St', 'San Jose', 'CA', 95113);
INTO BUSINESS_ADDRESS VALUES('B11', null,'Yellow Stone National Park', 'WY', 82190);
INTO BUSINESS_ADDRESS VALUES('B12', null,'P.O. Box 221', 'AZ', 86028);
INTO BUSINESS_ADDRESS VALUES('B13', null,'Highway 64', 'AZ', 86023);
INTO BUSINESS_ADDRESS VALUES('B35', 5847, 'San Felipe, Suite 2400', 'Houston', 'TX', 77057);
INTO BUSINESS_ADDRESS VALUES('B36', 1132, 'Terry Road, Hartford', 'CT', 06105);
INTO BUSINESS_ADDRESS VALUES('B14', 1133, 'Terry Road, Hartford', 'CT', 06105);


INSERT ALL
INTO CHECKIN VALUES ('C1','Y1','B3','Checkin Info 1');
INTO CHECKIN VALUES ('C2','Y1','B2','Checkin Info 2');
INTO CHECKIN VALUES ('C3','Y1','B13','Checkin Info 3');
INTO CHECKIN VALUES ('C4','Y1','B35','Checkin Info 4');
INTO CHECKIN VALUES ('C5','Y1','B36','Checkin Info 5');
INTO CHECKIN VALUES ('C6','Y1','B5','Checkin Info 6');
INTO CHECKIN VALUES ('C7','Y1','B4','Checkin Info 7');
INTO CHECKIN VALUES ('C8','Y1','B9','Checkin Info 8');
INTO CHECKIN VALUES ('C9','Y2','B10','Checkin Info 9');
INTO CHECKIN VALUES ('C10','Y2','B5','Checkin Info 10');
INTO CHECKIN VALUES ('C11','Y2','B11','Checkin Info 11');
INTO CHECKIN VALUES ('C12','Y2','B2','Checkin Info 12');
INTO CHECKIN VALUES ('C13','Y2','B36','Checkin Info 13');
INTO CHECKIN VALUES ('C14','Y2','B35','Checkin Info 14');
INTO CHECKIN VALUES ('C15','Y4','B4','Checkin Info 15');
INTO CHECKIN VALUES ('C16','Y4','B11','Checkin Info 16');
INTO CHECKIN VALUES ('C17','Y4','B12','Checkin Info 17');
INTO CHECKIN VALUES ('C18','Y4','B5','Checkin Info 18');
INTO CHECKIN VALUES ('C19','Y4','B36','Checkin Info 19');
INTO CHECKIN VALUES ('C20','Y4','B35','Checkin Info 20');
INTO CHECKIN VALUES ('C21','Y4','B2','Checkin Info 21');
INTO CHECKIN VALUES ('C22','Y5','B6','Checkin Info 22');
INTO CHECKIN VALUES ('C23','Y5','B11','Checkin Info 23');
INTO CHECKIN VALUES ('C24','Y5','B12','Checkin Info 24');
INTO CHECKIN VALUES ('C25','Y5','B5','Checkin Info 25');
INTO CHECKIN VALUES ('C26','Y5','B36','Checkin Info 26');
INTO CHECKIN VALUES ('C27','Y5','B35','Checkin Info 27');
INTO CHECKIN VALUES ('C28','Y5','B8','Checkin Info 28');
INTO CHECKIN VALUES ('C29','Y6','B36','Checkin Info 29');
INTO CHECKIN VALUES ('C30','Y6','B11','Checkin Info 30');
INTO CHECKIN VALUES ('C31','Y6','B2','Checkin Info 31');
INTO CHECKIN VALUES ('C32','Y6','B3','Checkin Info 32');
INTO CHECKIN VALUES ('C33','Y6','B13','Checkin Info 33');
INTO CHECKIN VALUES ('C34','Y7','B13','Checkin Info 34');
INTO CHECKIN VALUES ('C35','Y7','B35','Checkin Info 35');
INTO CHECKIN VALUES ('C36','Y7','B36','Checkin Info 36');
INTO CHECKIN VALUES ('C37','Y7','B11','Checkin Info 37');
INTO CHECKIN VALUES ('C38','Y7','B2','Checkin Info 38');
INTO CHECKIN VALUES ('C39','Y7','B3','Checkin Info 39');
INTO CHECKIN VALUES ('C40','Y8','B11','Checkin Info 40');
INTO CHECKIN VALUES ('C41','Y8','B2','Checkin Info 41');
INTO CHECKIN VALUES ('C42','Y8','B13','Checkin Info 42');
INTO CHECKIN VALUES ('C43','Y8','B35','Checkin Info 43');
INTO CHECKIN VALUES ('C44','Y8','B36','Checkin Info 44');
INTO CHECKIN VALUES ('C45','Y8','B4','Checkin Info 45');
INTO CHECKIN VALUES ('C46','Y9','B5','Checkin Info 46');
INTO CHECKIN VALUES ('C47','Y9','B11','Checkin Info 47');
INTO CHECKIN VALUES ('C48','Y9','B2','Checkin Info 48');
INTO CHECKIN VALUES ('C49','Y9','B13','Checkin Info 49');
INTO CHECKIN VALUES ('C50','Y9','B35','Checkin Info 50');
INTO CHECKIN VALUES ('C51','Y9','B36','Checkin Info 51');
INTO CHECKIN VALUES ('C52','Y10','B1','Checkin Info 52');
INTO CHECKIN VALUES ('C53','Y10','B5','Checkin Info 53');
INTO CHECKIN VALUES ('C54','Y10','B11','Checkin Info 54');
INTO CHECKIN VALUES ('C55','Y10','B2','Checkin Info 55');
INTO CHECKIN VALUES ('C56','Y10','B36','Checkin Info 56');
INTO CHECKIN VALUES ('C57','Y10','B35','Checkin Info 57');
INTO CHECKIN VALUES ('C58','Y10','B3','Checkin Info 58');
INTO CHECKIN VALUES ('C59','Y11','B3','Checkin Info 59');
INTO CHECKIN VALUES ('C60','Y11','B4','Checkin Info 60');
INTO CHECKIN VALUES ('C61','Y11','B1','Checkin Info 61');
INTO CHECKIN VALUES ('C62','Y11','B5','Checkin Info 62');
INTO CHECKIN VALUES ('C63','Y11','B11','Checkin Info 63');
INTO CHECKIN VALUES ('C64','Y11','B2','Checkin Info 64');
INTO CHECKIN VALUES ('C65','Y11','B36','Checkin Info 65');
INTO CHECKIN VALUES ('C66','Y11','B35','Checkin Info 66');
INTO CHECKIN VALUES ('C67','Y12','B7','Checkin Info 67');
INTO CHECKIN VALUES ('C68','Y12','B10','Checkin Info 68');
INTO CHECKIN VALUES ('C69','Y12','B5','Checkin Info 69');
INTO CHECKIN VALUES ('C70','Y12','B11','Checkin Info 70');
INTO CHECKIN VALUES ('C71','Y12','B2','Checkin Info 71');
INTO CHECKIN VALUES ('C72','Y12','B13','Checkin Info 72');
INTO CHECKIN VALUES ('C73','Y12','B35','Checkin Info 73');
INTO CHECKIN VALUES ('C74','Y12','B36','Checkin Info 74');

INSERT ALL
INTO REVIEWS VALUES ('R1','3','Y11',TO_DATE('Oct-02-0709:10:54', 'MON-DD-YYHH24:MI:SS'),'B3');
INTO REVIEWS VALUES ('R2','2','Y10',TO_DATE('Sep-29-0713:45:00', 'MON-DD-YYHH24:MI:SS'),'B1');
INTO REVIEWS VALUES ('R3','4','Y2',TO_DATE('Sep-29-0710:38:25', 'MON-DD-YYHH24:MI:SS'),'B10');
INTO REVIEWS VALUES ('R4','5','Y11',TO_DATE('Oct-02-0713:05:56', 'MON-DD-YYHH24:MI:SS'),'B4');
INTO REVIEWS VALUES ('R5','5','Y1',TO_DATE('Oct-25-0717:15:00',  'MON-DD-YYHH24:MI:SS'),'B3');
INTO REVIEWS VALUES ('R6','5','Y4',TO_DATE('Sep-26-0717:15:00',  'MON-DD-YYHH24:MI:SS'),'B4');
INTO REVIEWS VALUES ('R7','5','Y9',TO_DATE('Sep-26-0717:15:00',  'MON-DD-YYHH24:MI:SS'),'B5');
INTO REVIEWS VALUES ('R8','5','Y5',TO_DATE('Sep-27-0717:15:00',  'MON-DD-YYHH24:MI:SS'),'B6');
INTO REVIEWS VALUES ('R9','5','Y12',TO_DATE('Sep-28-0717:15:00', 'MON-DD-YYHH24:MI:SS'),'B7');
INTO REVIEWS VALUES ('R10','5','Y5',TO_DATE('Oct-29-0717:15:00', 'MON-DD-YYHH24:MI:SS'),'B8');
INTO REVIEWS VALUES ('R11','5','Y1',TO_DATE('Sep-30-0717:15:00', 'MON-DD-YYHH24:MI:SS'),'B9');
INTO REVIEWS VALUES ('R12','5','Y12',TO_DATE('Oct-25-0717:15:00', 'MON-DD-YYHH24:MI:SS'),'B10');
INTO REVIEWS VALUES ('R13','5','Y4',TO_DATE('Sep-25-0717:15:00', 'MON-DD-YYHH24:MI:SS'),'B11');
INTO REVIEWS VALUES ('R14','5','Y5',TO_DATE('Sep-25-0717:15:00', 'MON-DD-YYHH24:MI:SS'),'B12');
INTO REVIEWS VALUES ('R15','5','Y1',TO_DATE('Sep-29-0717:15:00', 'MON-DD-YYHH24:MI:SS'),'B13');
INTO REVIEWS VALUES ('R16','2','Y11',TO_DATE('Jun-07-1517:15:00', 'MON-DD-YYHH24:MI:SS'),'B2');
INTO REVIEWS VALUES ('R17','1','Y4',TO_DATE('May-05-1517:15:00', 'MON-DD-YYHH24:MI:SS'),'B2');
INTO REVIEWS VALUES ('R18','1','Y1',TO_DATE('May-05-1517:15:00', 'MON-DD-YYHH24:MI:SS'),'B2');
INTO REVIEWS VALUES ('R19','1','Y10',TO_DATE('Oct-25-0717:15:00', 'MON-DD-YYHH24:MI:SS'),'B3');
INTO REVIEWS VALUES ('R20','1','Y1',TO_DATE('Sep-28-0717:15:00', 'MON-DD-YYHH24:MI:SS'),'B4');
INTO REVIEWS VALUES ('R21','4','Y11',TO_DATE('Jun-07-1517:15:00', 'MON-DD-YYHH24:MI:SS'),'B14');
INTO REVIEWS VALUES ('R22','1','Y4',TO_DATE('May-05-1517:15:00', 'MON-DD-YYHH24:MI:SS'),'B14');
INTO REVIEWS VALUES ('R23','1','Y1',TO_DATE('May-05-1517:15:00', 'MON-DD-YYHH24:MI:SS'),'B14');


INSERT ALL
INTO LIST_OF_COMMENTS VALUES ('R2','Y3','This is comment 1');
INTO LIST_OF_COMMENTS VALUES ('R2','Y2','This is comment 2');
INTO LIST_OF_COMMENTS VALUES ('R3','Y3','This is comment 3');
INTO LIST_OF_COMMENTS VALUES ('R7','Y8','This is comment 4');
INTO LIST_OF_COMMENTS VALUES ('R7','Y11','This is comment 5');
INTO LIST_OF_COMMENTS VALUES ('R15','Y8','This is comment 6');
INTO LIST_OF_COMMENTS VALUES ('R16','Y8','This is comment 7');
INTO LIST_OF_COMMENTS VALUES ('R20','Y7','This is comment 8');
INTO LIST_OF_COMMENTS VALUES ('R20','Y10','This is comment 9');


