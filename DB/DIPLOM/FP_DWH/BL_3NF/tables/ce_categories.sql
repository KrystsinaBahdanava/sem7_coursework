/**===============================================*\
Name...............:   att_categories
Contents...........:   Create table att_categories
Author.............:   Krystsina Bahdanava
Date...............:   30.03.2019
\*=============================================== */
--DROP TABLE ce_categories;
--**********************************************
CREATE TABLE att_categories (
    be_id       NUMBER(10) NOT NULL,
    be_name     VARCHAR2(200),
    create_dt   DATE,
    update_dt   DATE
);

ALTER TABLE att_categories ADD CONSTRAINT category_pk PRIMARY KEY ( be_id );

--**********************************************

INSERT INTO bl_3nf.att_categories (
    be_id,
    be_name,
    create_dt,
    update_dt
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

GRANT SELECT ON att_categories TO bl_cl;

GRANT INSERT ON att_categories TO bl_cl;

GRANT UPDATE ON att_categories TO bl_cl;

GRANT SELECT ON att_categories TO bl_dh;