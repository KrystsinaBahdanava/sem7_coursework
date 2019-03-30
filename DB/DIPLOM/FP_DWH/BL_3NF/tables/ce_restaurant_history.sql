/**===============================================*\
Name...............:   att_restaurant_history
Contents...........:   Create table att_restaurant_history
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_restaurant_history;
--**********************************************
CREATE TABLE att_restaurant_history (
    be_id            NUMBER(10) NOT NULL,
    average_rating   NUMBER(8,2),
    restaurant_id    NUMBER(10) NOT NULL,
    scd_id           NUMBER(3),
    scd_start_dt     DATE,
    scd_end_dt       DATE,
    scd_version      NUMBER(10),
    scd_active       NUMBER(3)
);

ALTER TABLE att_restaurant_history ADD CONSTRAINT restaurant_history_pk PRIMARY KEY ( be_id );

ALTER TABLE att_restaurant_history
    ADD CONSTRAINT restaurant_history_fk FOREIGN KEY ( restaurant_id )
        REFERENCES att_restaurants ( be_id );
        
--**********************************************

INSERT INTO bl_3nf.att_restaurant_history (
    be_id,
    average_rating,
    restaurant_id,
    scd_id,
    scd_start_dt,
    scd_end_dt,
    scd_version,
    scd_active
) VALUES (
    -98,
    -98,
    -98,
    -98,
    TO_DATE('01/01/1900','DD/MM/YYYY'),
    TO_DATE('01/01/1900','DD/MM/YYYY'),
    -98,
    -98
);

COMMIT;
--**********************************************
--GRANTS
--**********************************************

GRANT SELECT ON att_restaurant_history TO bl_cl;

GRANT INSERT ON att_restaurant_history TO bl_cl;

GRANT UPDATE ON att_restaurant_history TO bl_cl;

GRANT SELECT ON att_restaurant_history TO bl_dh;