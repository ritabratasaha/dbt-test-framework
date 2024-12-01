

    select 
    *
    from DBT_TEST_DEMO.src.src_customers
    where c_custkey is null
    limit 100

