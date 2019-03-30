/**===============================================*\
Name...............:   att_restaurants
Contents...........:   Create table att_restaurants
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_restaurants;
--**********************************************
CREATE TABLE att_restaurants (
    be_id            NUMBER(10) NOT NULL,
    be_name          VARCHAR2(200),
    category_id      NUMBER(10) NOT NULL,
    image            VARCHAR2(200),
    schedule         VARCHAR2(200),
    average_rating   NUMBER(8,2),
    update_dt        DATE
);

ALTER TABLE att_restaurants ADD CONSTRAINT restaurant_pk PRIMARY KEY ( be_id );

ALTER TABLE att_restaurants
    ADD CONSTRAINT restaurant_category_fk FOREIGN KEY ( category_id )
        REFERENCES att_categories ( be_id );
        
--**********************************************

INSERT INTO bl_3nf.att_restaurants (
    be_id,
    be_name,
    category_id,
    image,
    schedule,
    average_rating,
    update_dt
) VALUES (
    -98,
    'N/D',
    -98,
    'N/D',
    'N/D',
    -98,
    TO_DATE('01/01/1900','DD/MM/YYYY')
);

COMMIT;
--**********************************************
--GRANTS
--**********************************************

GRANT SELECT ON att_restaurants TO bl_cl;

GRANT INSERT ON att_restaurants TO bl_cl;

GRANT UPDATE ON att_restaurants TO bl_cl;

GRANT SELECT ON att_restaurants TO bl_dh;