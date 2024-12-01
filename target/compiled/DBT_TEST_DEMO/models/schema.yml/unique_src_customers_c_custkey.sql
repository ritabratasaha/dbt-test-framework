
    
    

select
    c_custkey as unique_field,
    count(*) as n_records

from DBT_TEST_DEMO.src.src_customers
where c_custkey is not null
group by c_custkey
having count(*) > 1


