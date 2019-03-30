/**===============================================*\
Name...............:   Table cls_restaurants
Contents...........:   Create table 
Author.............:   Krystsina Bahdanava
Date...............:   28.03.2019
\*=============================================== */

--DROP TABLE cls_restaurants;
--**********************************************
CREATE TABLE cls_restaurants (
    be_id            NUMBER(10) NOT NULL,
    be_name          VARCHAR2(200),
    category_id      NUMBER(10) NOT NULL,
    image            VARCHAR2(200),
    schedule         VARCHAR2(200),
    average_rating   NUMBER(8,2)
);