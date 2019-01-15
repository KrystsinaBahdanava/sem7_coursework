/**===============================================*\
Name...............:   User bl_cl
Contents...........:   Create user 
Author.............:   Krystsina Bahdanava
Date...............:   15.01.2019
\*=============================================== */
DROP USER bl_cl CASCADE;
--**********************************************

CREATE USER bl_cl IDENTIFIED BY Q1W2E3R4
    DEFAULT TABLESPACE users
    QUOTA UNLIMITED ON users
    TEMPORARY TABLESPACE temp
    PROFILE default;

-- GRANTS

GRANT connect TO bl_cl;
GRANT resource TO bl_cl;
GRANT CREATE SYNONYM TO bl_cl;
GRANT CREATE PUBLIC SYNONYM TO bl_cl;