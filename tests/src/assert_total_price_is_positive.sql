-- Check if the total price is negetive.
{{ config(
    store_failures_as="table",
    tags=["postload","data_validation"] 
    )
}}

-- Logging the first 100 errors
select
    orders.o_orderkey,
    orders.o_totalprice
from {{ ref('src_orders') }} as orders
where orders.o_totalprice < 10000
limit 100
