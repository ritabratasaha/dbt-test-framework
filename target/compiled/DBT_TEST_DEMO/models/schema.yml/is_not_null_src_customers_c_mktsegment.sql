

    select 
    *
    from DBT_TEST_DEMO.src.src_customers
    where c_mktsegment is null
    limit 100

