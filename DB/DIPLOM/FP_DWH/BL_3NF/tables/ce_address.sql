/**===============================================*\
Name...............:   att_address
Contents...........:   Create table att_address
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_address;
--**********************************************
CREATE TABLE att_address (
    be_id        NUMBER(10) NOT NULL,
    be_name      VARCHAR2(200),
    district_id    NUMBER(10),
    update_dt    DATE,
    create_dt    DATE
);

ALTER TABLE att_address ADD CONSTRAINT address_pk PRIMARY KEY ( be_id );

ALTER TABLE att_address
    ADD CONSTRAINT district_address_fk FOREIGN KEY ( district_id )
        REFERENCES att_district ( be_id );
--**********************************************

INSERT INTO bl_3nf.att_address (
    be_id,
    be_name,
    district_id,
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

GRANT SELECT ON att_address TO bl_cl;

GRANT INSERT ON att_address TO bl_cl;

GRANT UPDATE ON att_address TO bl_cl;

GRANT SELECT ON att_address TO bl_dh;