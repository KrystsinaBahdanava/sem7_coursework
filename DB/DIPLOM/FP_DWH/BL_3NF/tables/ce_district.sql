/**===============================================*\
Name...............:   att_district
Contents...........:   Create table att_district
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_district;
--**********************************************
CREATE TABLE att_district (
    be_id        NUMBER(10) NOT NULL,
    be_name      VARCHAR2(200),
    city_id    NUMBER(10),
    update_dt    DATE,
    create_dt    DATE
);

ALTER TABLE att_district ADD CONSTRAINT cdistrict_pk PRIMARY KEY ( be_id );

ALTER TABLE att_district
    ADD CONSTRAINT country_district_fk FOREIGN KEY ( city_id )
        REFERENCES att_city ( be_id );
--**********************************************

INSERT INTO bl_3nf.att_district (
    be_id,
    be_name,
    city_id,
    update_dt,
    create_dt
) VALUES (
    -98,
    'N/D',
    -98,
    TO_DATE('01/01/1900','DD/MM/YYYY'),
    TO_DATE('01/01/1900','DD/MM/YYYY')
);

COMMIT;
--**********************************************
--GRANTS
--**********************************************

GRANT SELECT ON att_district TO bl_cl;

GRANT INSERT ON att_district TO bl_cl;

GRANT UPDATE ON att_district TO bl_cl;

GRANT SELECT ON att_district TO bl_dh;