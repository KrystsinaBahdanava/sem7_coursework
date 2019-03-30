/**===============================================*\
Name...............:   Table cls_order_item
Contents...........:   Create table 
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE cls_order_item;
--**********************************************
CREATE TABLE cls_order_item (
    be_id        NUMBER(10) NOT NULL,
    order_id     NUMBER(10) NOT NULL,
    product_id   NUMBER(10) NOT NULL,
    quantity     NUMBER(10) NOT NULL,
    created_at   DATE
);