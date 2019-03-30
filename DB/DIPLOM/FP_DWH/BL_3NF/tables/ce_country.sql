/**===============================================*\
Name...............:   att_country
Contents...........:   Create table att_country
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_country;
--**********************************************
CREATE TABLE att_country (
    be_id          NUMBER(10) NOT NULL,
    be_name        VARCHAR2(200),
    country_code   VARCHAR2(3),
    update_dt      DATE,
    create_dt      DATE
);

ALTER TABLE att_country ADD CONSTRAINT country_pk PRIMARY KEY ( be_id );

--**********************************************

INSERT INTO bl_3nf.att_country (
    be_id,
    be_name,
    country_code,
    update_dt,
    create_dt
) VALUES (
    -98,
    'N/D',
    'N/D',
    TO_DATE('01/01/1900','DD/MM/YYYY'),
    TO_DATE('01/01/1900','DD/MM/YYYY')
);

COMMIT;
--**********************************************
--GRANTS
--**********************************************

GRANT SELECT ON att_country TO bl_cl;

GRANT INSERT ON att_country TO bl_cl;

GRANT UPDATE ON att_country TO bl_cl;

GRANT SELECT ON att_country TO bl_dh;