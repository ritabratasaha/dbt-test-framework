-- Check if the order date is greater than current date
-- Logging the first 100 errors
{{ config(
    store_failures_as="table",
    tags=["postload","data_validation"] 
    )
}}

select
    orders_dist.o_orderkey,
    orders_dist.o_orderdate
from {{ ref('cur_order_dist_by_mktseg') }} as orders_dist
where orders_dist.o_orderdate > current_date
limit 100
