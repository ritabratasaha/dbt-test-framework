select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from DBT_TEST_DEMO.dbt_test__audit.is_not_null_src_customers_c_mktsegment
    
      
    ) dbt_internal_test