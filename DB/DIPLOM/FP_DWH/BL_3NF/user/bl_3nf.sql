/**===============================================*\
Name...............:   User BL_3NF
Contents...........:   Create user 
Author.............:   Krystsina Bahdanava
Date...............:   15.01.2019
\*=============================================== */
DROP USER bl_3nf CASCADE;
--**********************************************

CREATE USER bl_3nf IDENTIFIED BY Q1W2E3R4
    DEFAULT TABLESPACE users
    QUOTA UNLIMITED ON users
    TEMPORARY TABLESPACE temp
    PROFILE default;

-- GRANTS

GRANT connect TO bl_3nf;
GRANT resource TO bl_3nf;
GRANT CREATE SYNONYM TO bl_3nf;