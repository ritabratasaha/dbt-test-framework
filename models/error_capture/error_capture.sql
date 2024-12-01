{{ config(
    post_hook="Call dbt_test_report.load_dbt_model_errors();"
) }}
Select '1'
