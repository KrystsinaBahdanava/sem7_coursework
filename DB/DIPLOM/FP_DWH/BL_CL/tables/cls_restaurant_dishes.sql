/**===============================================*\
Name...............:   Table cls_restaurant_dishes
Contents...........:   Create table 
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE cls_restaurant_dishes;
--**********************************************
CREATE TABLE cls_restaurant_dishes (
    be_id              NUMBER(10) NOT NULL,
    be_name            VARCHAR2(200) NOT NULL,
    restaurant_id      NUMBER(10) NOT NULL,
    description        CLOB,
    price              NUMBER(8,2) NOT NULL,
    image              VARCHAR2(200),
    is_active          NUMBER(1),
    last_date_update   DATE
);