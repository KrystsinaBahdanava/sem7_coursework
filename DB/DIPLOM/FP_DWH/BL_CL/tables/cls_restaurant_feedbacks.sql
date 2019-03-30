/**===============================================*\
Name...............:   Table cls_restaurant_feedback
Contents...........:   Create table 
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE cls_restaurant_feedback;
--**********************************************
CREATE TABLE cls_restaurant_feedback (
    be_id            NUMBER(10) NOT NULL,
    client_name      VARCHAR2(200),
    restaurant_id    NUMBER(10) NOT NULL,
    rate             NUMBER(2),
    client_comment   CLOB,
    created_at       DATE
);