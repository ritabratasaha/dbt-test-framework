select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from DBT_TEST_DEMO.dbt_test__audit.assert_orderdt_gt_currentdt
    
      
    ) dbt_internal_test