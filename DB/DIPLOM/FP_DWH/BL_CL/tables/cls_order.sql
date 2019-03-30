/**===============================================*\
Name...............:   Table cls_order
Contents...........:   Create table 
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE cls_order;
--**********************************************
CREATE TABLE cls_order (
    be_id         NUMBER(10) NOT NULL,
    session_id    VARCHAR2(200) NOT NULL,
    client_name   VARCHAR2(200) NOT NULL,
    phone         VARCHAR2(20) NOT NULL,
    email         VARCHAR2(200),
    address       VARCHAR2(200) NOT NULL,
    total_price   NUMBER(8,2) NOT NULL,
    created_at    DATE
);