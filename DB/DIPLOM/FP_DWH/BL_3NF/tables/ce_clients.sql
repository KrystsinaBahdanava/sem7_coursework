/**===============================================*\
Name...............:   att_clients
Contents...........:   Create table att_clients
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_clients;
--**********************************************
CREATE TABLE att_clients (
    be_id       NUMBER(10) NOT NULL,
    phone       VARCHAR2(200),
    update_dt   DATE,
    create_dt   DATE
);

ALTER TABLE att_clients ADD CONSTRAINT clients_pk PRIMARY KEY ( be_id );
        
--**********************************************

INSERT INTO bl_3nf.att_clients (
    be_id,
    phone,
    update_dt,
    create_dt
) VALUES (
    -98,
    'N/D',
    TO_DATE('01/01/1900','DD/MM/YYYY'),
    TO_DATE('01/01/1900','DD/MM/YYYY')
);

COMMIT;
--**********************************************
--GRANTS
--**********************************************

GRANT SELECT ON att_clients TO bl_cl;

GRANT INSERT ON att_clients TO bl_cl;

GRANT UPDATE ON att_clients TO bl_cl;

GRANT SELECT ON att_clients TO bl_dh;