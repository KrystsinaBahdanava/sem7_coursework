/**===============================================*\
  Name...............:   pkg_load_3nf_categories
  Contents...........:   Implementation of ETL process of loading cls_categories
  Author.............:   Krystsina Bahdanava
  Date...............:   30/03/2019
  \*=============================================== */
  
CREATE OR REPLACE PACKAGE BODY pkg_load_3nf_categories AS

    PROCEDURE load_cls_categories
        IS
    BEGIN
        EXECUTE IMMEDIATE 'truncate table cls_categories';
        INSERT INTO cls_categories
                    SELECT DISTINCT
                        TRIM(' ' FROM id) AS be_id,
                        TRIM(' ' FROM TITLE) AS be_name,
                        created_at,
                        last_time_update
                    FROM
                        sa_src.lt_mysql_categories
        COMMIT;
        dbms_output.put_line('Loading in table cls_categories completed successfully!');
    EXCEPTION
        WHEN OTHERS THEN
            RAISE;
    END load_cls_categories;
    
    /**********************************/

    PROCEDURE load_att_categpries
        IS
    BEGIN
        MERGE INTO att_categories b USING ( SELECT
            be_id,
            be_name,
            created_at,
            last_time_update as update_dt
                                             FROM
            cls_categories
        MINUS
        SELECT
            be_id,
            be_name,
            update_dt,
            create_dt,
            update_dt
        FROM
            bl_3nf.att_categories
        )
        cls ON ( cls.be_id = b.be_id )
        WHEN MATCHED THEN UPDATE SET b.be_name = cls.be_name,
        b.create_dt = cls.create_dt,
        b.update_dt = sysdate
        WHEN NOT MATCHED THEN INSERT (
            be_id,
                be_name,
                create_dt,
            update_dt
        ) VALUES (
            cls.be_id,
                cls.be_name,
                cls.create_dt,
            cls.update_dt
        );

        COMMIT;
        dbms_output.put_line('Loading in table load_att_categpries completed successfully!');
    EXCEPTION
        WHEN OTHERS THEN
            RAISE;
    END load_att_categpries;
    
    /**********************************/

END pkg_load_3nf_categories;
/

--EXEC pkg_load_3nf_group.load_wrk_articles;

--EXEC pkg_load_3nf_group.load_cls_group;

--EXEC pkg_load_3nf_group.load_ce_group;

--truncate table wrk_articles;
--truncate table cls_group;