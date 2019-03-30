/**===============================================*\
Name...............:   att_order_items
Contents...........:   Create table att_order_items
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_order_items;
--**********************************************
CREATE TABLE att_order_items (
    be_id       NUMBER(10) NOT NULL,
    order_id    NUMBER(10),
    dish_id     NUMBER(10),
    quantity    NUMBER(3),
    update_dt   DATE,
    create_dt   DATE
);

ALTER TABLE att_order_items ADD CONSTRAINT order_items_pk PRIMARY KEY ( be_id );

ALTER TABLE att_order_items
    ADD CONSTRAINT order_items_order_fk FOREIGN KEY ( order_id )
        REFERENCES att_orders ( be_id );

ALTER TABLE att_order_items
    ADD CONSTRAINT order_items_dish_fk FOREIGN KEY ( dish_id )
        REFERENCES att_restaurant_dishes ( be_id );
        
--**********************************************

INSERT INTO bl_3nf.att_order_items (
    be_id,
    order_id,
    dish_id,
    quantity,
    update_dt,
    create_dt
) VALUES (
    -98,
    -98,
    -98,
    -98,
    TO_DATE('01/01/1900','DD/MM/YYYY'),
    TO_DATE('01/01/1900','DD/MM/YYYY')
);

COMMIT;
--**********************************************
--GRANTS
--**********************************************

GRANT SELECT ON att_order_items TO bl_cl;

GRANT INSERT ON att_order_items TO bl_cl;

GRANT UPDATE ON att_order_items TO bl_cl;

GRANT SELECT ON att_order_items TO bl_dh;