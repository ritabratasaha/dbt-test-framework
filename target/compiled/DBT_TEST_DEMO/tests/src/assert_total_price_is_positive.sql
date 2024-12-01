-- Check if the total price is negetive.


-- Logging the first 100 errors
select
    orders.o_orderkey,
    orders.o_totalprice
from DBT_TEST_DEMO.src.src_orders as orders
where orders.o_totalprice < 10000
limit 100