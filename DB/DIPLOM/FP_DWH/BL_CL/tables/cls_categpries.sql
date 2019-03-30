/**===============================================*\
Name...............:   Table cls_categories
Contents...........:   Create table 
Author.............:   Krystsina Bahdanava
Date...............:   28.03.2019
\*=============================================== */

--DROP TABLE cls_categories;
--**********************************************
CREATE TABLE cls_categories (
    be_id              NUMBER(10) NOT NULL,
    be_name            VARCHAR2(200),
    created_at         NUMBER(10) NOT NULL,
    last_time_update   DATE
);