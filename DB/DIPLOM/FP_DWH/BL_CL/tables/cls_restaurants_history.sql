/**===============================================*\
Name...............:   Table cls_restaurant_history
Contents...........:   Create table 
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE cls_restaurant_history;
--**********************************************
CREATE TABLE cls_restaurant_history (
    be_id            NUMBER(10) NOT NULL,
    restaurant_id    NUMBER(10) NOT NULL,
    average_rating   NUMBER(8,2),
    scd_id           CLOB,
    scd_start        DATE,
    scd_end          DATE,
    scd_version      NUMBER(10) NOT NULL,
    scd_active       NUMBER(1) NOT NULL
);