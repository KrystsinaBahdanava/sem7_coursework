/**===============================================*\
Name...............:   User SA_SRC
Contents...........:   Create user 
Author.............:   Krystsina Bahdanava
Date...............:   15.01.2019
\*=============================================== */
DROP USER SA_SRC CASCADE;
--**********************************************

create tablespace tbs_exit datafile 'db_exit_001.dat' SIZE 20M AUTOEXTEND ON;

CREATE USER SA_SRC 
IDENTIFIED BY Q1W2E3R4
DEFAULT TABLESPACE TBS_EXIT 
TEMPORARY TABLESPACE TEMP
;

GRANT CONNECT TO SA_SRC;
GRANT RESOURCE TO SA_SRC;
GRANT CREATE SYNONYM TO SA_SRC;
GRANT SELECT_CATALOG_ROLE TO SA_SRC;
GRANT SELECT ANY DICTIONARY TO SA_SRC;
GRANT UNLIMITED TABLESPACE TO SA_SRC;
GRANT READ ON DIRECTORY EXIT_FILES TO SA_SRC;
GRANT WRITE ON DIRECTORY EXIT_FILES TO SA_SRC;