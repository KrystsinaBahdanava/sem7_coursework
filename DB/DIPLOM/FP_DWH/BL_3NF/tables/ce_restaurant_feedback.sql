/**===============================================*\
Name...............:   att_restaurant_feedback
Contents...........:   Create table att_restaurant_feedback
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */

--DROP TABLE att_restaurant_feedback;
--**********************************************
CREATE TABLE att_restaurant_feedback (
    be_id            NUMBER(10) NOT NULL,
    restaurant_id    NUMBER(10),
    client_name      VARCHAR2(200),
    client_comment   VARCHAR2(200),
    rate             NUMBER(3),
    create_dt        DATE,
    update_dt        DATE
);

ALTER TABLE att_restaurant_feedback ADD CONSTRAINT restaurant_feedback_pk PRIMARY KEY ( be_id );

ALTER TABLE att_restaurant_feedback
    ADD CONSTRAINT att_restaurant_feedback FOREIGN KEY ( restaurant_id )
        REFERENCES att_restaurants ( be_id );
        
--**********************************************

INSERT INTO bl_3nf.att_restaurant_feedback (
    be_id,
    restaurant_id,
    client_name,
    client_comment,
    rate,
    create_dt,
    update_dt
) VALUES (
    -98,
    -98,
    'N/D',
    'N/D',
    -98,
    TO_DATE('01/01/1900','DD/MM/YYYY'),
    TO_DATE('01/01/1900','DD/MM/YYYY')
);

COMMIT;
--**********************************************
--GRANTS
--**********************************************

GRANT SELECT ON att_restaurant_feedback TO bl_cl;

GRANT INSERT ON att_restaurant_feedback TO bl_cl;

GRANT UPDATE ON att_restaurant_feedback TO bl_cl;

GRANT SELECT ON att_restaurant_feedback TO bl_dh;