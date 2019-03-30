/**===============================================*\
Name...............:   att_city
Contents...........:   Create table att_city
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_city;
--**********************************************
CREATE TABLE att_city (
    be_id        NUMBER(10) NOT NULL,
    be_name      VARCHAR2(200),
    country_id    NUMBER(10),
    update_dt    DATE,
    create_dt    DATE
);

ALTER TABLE att_city ADD CONSTRAINT city_pk PRIMARY KEY ( be_id );

ALTER TABLE att_city
    ADD CONSTRAINT country_city_fk FOREIGN KEY ( country_id )
        REFERENCES att_country ( be_id );
--**********************************************

INSERT INTO bl_3nf.att_city (
    be_id,
    be_name,
    country_id,
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

GRANT SELECT ON att_city TO bl_cl;

GRANT INSERT ON att_city TO bl_cl;

GRANT UPDATE ON att_city TO bl_cl;

GRANT SELECT ON att_city TO bl_dh;