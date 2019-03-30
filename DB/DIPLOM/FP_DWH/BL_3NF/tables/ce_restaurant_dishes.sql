/**===============================================*\
Name...............:   att_restaurant_dishes
Contents...........:   Create table att_restaurant_dishes
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_restaurant_dishes;
--**********************************************
CREATE TABLE att_restaurant_dishes (
    be_id           NUMBER(10) NOT NULL,
    be_name         VARCHAR2(200),
    restaurant_id   NUMBER(10),
    description     VARCHAR2(200),
    price           NUMBER(8,2),
    image           VARCHAR2(200),
    is_active       NUMBER(3),
    update_dt       DATE,
    create_dt       DATE
);

ALTER TABLE att_restaurant_dishes ADD CONSTRAINT restaurant_dishes_pk PRIMARY KEY ( be_id );

ALTER TABLE att_restaurant_dishes
    ADD CONSTRAINT att_restaurant_dishes FOREIGN KEY ( restaurant_id )
        REFERENCES att_restaurants ( be_id );
        
--**********************************************

INSERT INTO bl_3nf.att_restaurant_dishes (
    be_id,
    be_name,
    restaurant_id,
    description,
    price,
    image,
    is_active,
    update_dt,
    create_dt
) VALUES (
    -98,
    'N/D',
    -98,
    'N/D',
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

GRANT SELECT ON att_restaurant_dishes TO bl_cl;

GRANT INSERT ON att_restaurant_dishes TO bl_cl;

GRANT UPDATE ON att_restaurant_dishes TO bl_cl;

GRANT SELECT ON att_restaurant_dishes TO bl_dh;