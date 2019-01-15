/**===============================================*\
Name...............:   User bl_dh
Contents...........:   Create user 
Author.............:   Krystsina Bahdanava
Date...............:   15.01.2019
\*=============================================== */
DROP USER bl_dh CASCADE;
--**********************************************

CREATE USER bl_dh IDENTIFIED BY Q1W2E3R4
    DEFAULT TABLESPACE users
    QUOTA UNLIMITED ON users
    TEMPORARY TABLESPACE temp
    PROFILE default;

-- GRANTS

GRANT connect TO bl_dh;
GRANT resource TO bl_dh;
GRANT CREATE SYNONYM TO bl_dh;