CREATE TABLE TECHNICIAN
(
    ID                             LONG NOT NULL,
    EMPNO                          VARCHAR2(10),
    NAME                           NVARCHAR2(20),
    PHONENO                        VARCHAR2(16),
    ADDRESS                        NVARCHAR2(50),
    QQ                             VARCHAR2(20),
    MSN                            VARCHAR2(30),
    EMAIL                          VARCHAR2(30),
    AGE                            NUMBER(3,0),
    BIRTHYEAR                      VARCHAR2(4),
    BIRTHMONTH                     VARCHAR2(2),
    BIRTHDAY                       VARCHAR2(2),
    GENDER                         CHAR(1),
    BIRTHPLACE                     NVARCHAR2(20),
    HEIGHT                         VARCHAR2(3),
    WEIGHT                         VARCHAR2(2),
    BUST                           NVARCHAR2(3),
    HIP                            NVARCHAR2(3),
    WAISTLINE                      NVARCHAR2(3),
    HOBBY                          NVARCHAR2(500),
    INTRODUCTION                   NVARCHAR2(500),
    PHOTO1ID                       VARCHAR2(20),
    PHOTO2ID                       VARCHAR2(20),
    PHOTO3ID                       VARCHAR2(20),
    PHOTO4ID                       VARCHAR2(20),
    PHOTO5ID                       VARCHAR2(20),
    PHOTO6ID                       VARCHAR2(20),
    PRICE                          NUMBER(8,0)
)
/
ALTER TABLE TECHNICIAN
    ADD(PRIMARY KEY (ID) USING INDEX)
/
COMMENT ON COLUMN TECHNICIAN.ID IS 'Ö÷¼ü'
/
COMMENT ON COLUMN TECHNICIAN.GENDER IS '0:Å® 1:ÄÐ 2:Î´Öª'
/
CREATE TABLE CUSTOMER
(
    ID                             LONG NOT NULL,
    NAME                           NVARCHAR2(20),
    PHONENO                        VARCHAR2(16),
    ADDRESS                        NVARCHAR2(50),
    QQ                             VARCHAR2(20),
    MSN                            VARCHAR2(30)
)
/
CREATE TABLE ORDERFORM
(
    ID                             LONG NOT NULL,
    ORDERNO                        VARCHAR2(20),
    CUSTOMERID                     LONG,
    REMARK                         VARCHAR2(500),
    TOTAL                          NUMBER(5,0)
)
/
ALTER TABLE ORDERFORM
    ADD(PRIMARY KEY (ID) USING INDEX)
/
ALTER TABLE ORDERFORM
    ADD(FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER (ID))
/
CREATE TABLE ORDERINFO
(
    ID                             LONG NOT NULL,
    ORDERFORMID                    LONG,
    TECHNICHIANID                  LONG,
    PRICE                          NUMBER(5,0),
    CURRENCY                       VARCHAR2(3) DEFAULT RMB,
    DEMAND                         VARCHAR2(200)
)
/
ALTER TABLE ORDERINFO
    ADD(PRIMARY KEY (ID) USING INDEX)
/
COMMENT ON COLUMN ORDERINFO.CURRENCY IS 'RMB,JPY,USD'
/
CREATE TABLE COMMENTS
(
    ID                             LONG NOT NULL,
    TECHNICHIANID                  LONG,
    NAME                           VARCHAR2(20),
    SCORE                          NUMBER(4,1),
    COMMENTS                       VARCHAR2(500),
    CREATEDATE                     DATE,
    UPDATEDATE                     DATE
)
/
ALTER TABLE COMMENTS
    ADD(PRIMARY KEY (ID) USING INDEX)
/
ALTER TABLE ORDERINFO
    ADD(FOREIGN KEY(ORDERFORMID) REFERENCES ORDERFORM (ID))
/
ALTER TABLE ORDERINFO
    ADD(FOREIGN KEY(TECHNICHIANID) REFERENCES TECHNICIAN (ID))
/
ALTER TABLE ORDERFORM
    ADD(FOREIGN KEY() REFERENCES CUSTOMER ())
/
ALTER TABLE COMMENTS
    ADD(FOREIGN KEY(TECHNICHIANID) REFERENCES TECHNICIAN (ID))
/
