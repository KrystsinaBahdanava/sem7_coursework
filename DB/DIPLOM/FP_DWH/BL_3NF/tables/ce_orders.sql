/**===============================================*\
Name...............:   att_orders
Contents...........:   Create table att_orders
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_orders;
--**********************************************
CREATE TABLE att_orders (
    be_id        NUMBER(10) NOT NULL,
    be_name      VARCHAR2(200),
    client_id    NUMBER(10),
    address_id   NUMBER(10),
    name_        VARCHAR2(200),
    email        VARCHAR2(200),
    update_dt    DATE,
    create_dt    DATE
);

ALTER TABLE att_orders ADD CONSTRAINT orders_pk PRIMARY KEY ( be_id );

ALTER TABLE att_orders
    ADD CONSTRAINT att_orders FOREIGN KEY ( client_id )
        REFERENCES att_clients ( be_id );
ALTER TABLE att_orders
    ADD CONSTRAINT orders_address_fk FOREIGN KEY ( address_id )
        REFERENCES att_address ( be_id );
        
--**********************************************

INSERT INTO bl_3nf.att_orders (
    be_id,
    be_name,
    client_id,
    address_id,
    name_,
    email,
    update_dt,
    create_dt
) VALUES (
    -98,
    'N/D',
    -98,
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

GRANT SELECT ON att_orders TO bl_cl;

GRANT INSERT ON att_orders TO bl_cl;

GRANT UPDATE ON att_orders TO bl_cl;

GRANT SELECT ON att_orders TO bl_dh;