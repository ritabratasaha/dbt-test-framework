select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from DBT_TEST_DEMO.dbt_test__audit.unique_src_customers_c_custkey
    
      
    ) dbt_internal_test