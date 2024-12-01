## Welcome to your new dbt test demo project!


### We are going to create a test framework with DBT. We will use the following dbt tools

- dbt test
- dbt expectation
- dbt run

### Here are some of the basic steps to get your environment up and running

1. Create a virtual env
2. Activate the env
3. Install the requirements.txt file



### Sequence of commands to get the project up and running

1. Setup the target env variables. Connection to Snowflake uses these variables.

    ```
    export SNOWFLAKE_ACCOUNT='QDB88635'; export SNOWFLAKE_USER='developer';export SNOWFLAKE_PASSWORD='Hello!123';export SNOWFLAKE_ROLE='Accountadmin';
    ```

2. Create the target database objects

    ```
    snow sql -f database_objects/create_db.sql --temporary-connection \    
                           --account $SNOWFLAKE_ACCOUNT \
                           --user $SNOWFLAKE_USER \
                           --password $SNOWFLAKE_PASSWORD \
                           --role $SNOWFLAKE_ROLE
    ```
    ```
    snow sql -f database_objects/sp_load_error.sql --temporary-connection \
                           --account $SNOWFLAKE_ACCOUNT \
                           --user $SNOWFLAKE_USER \
                           --password $SNOWFLAKE_PASSWORD \
                           --role $SNOWFLAKE_ROLE
    ```


3. Sequence of dbt commands to get this setup up and running

    ```
    dbt debug --profiles-dir ./
    dbt run --profiles-dir ./ -select src
    dbt test --profiles-dir ./ -select tag:schema_check
    dbt run --profiles-dir ./ -select curated
    dbt test --profiles-dir ./ -select tag:data_quality
    dbt test --profiles-dir ./ -select tag:data_validation
    dbt run --profiles-dir ./ -select error_capture  
    ```

4. Some of the SQL to review the error data captired at each step

    ```
    -- Pull list of error tables
    Select table_name,row_count 
    from dbt_test_demo.information_schema.tables
    where table_schema = 'DBT_TEST__AUDIT';


    -- Review the data in each error table

    Select * from dbt_test_demo.dbt_test__audit.assert_total_price_is_positive;

    Select * from dbt_test_demo.dbt_test__audit.value_src_orders_o_orderstatus;

    Select * from dbt_test_demo.dbt_test__audit.dbt_expect_src_orders_columns;

    -- Review the collated error data post execution of SP

    truncate table dbt_test_demo.dbt_test_report.log_model_errors;

    Select * from dbt_test_demo.dbt_test_report.log_model_errors;

    ```

### Ref Artefacts:

- https://medium.com/p/f14f6fb3a2cc/edit


