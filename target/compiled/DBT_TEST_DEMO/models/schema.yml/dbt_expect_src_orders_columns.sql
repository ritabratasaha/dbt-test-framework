with relation_columns as (

        
        select cast('O_CUSTKEY' as TEXT) as relation_column
        union all
        
        select cast('O_ORDERKEY' as TEXT) as relation_column
        union all
        
        select cast('O_ORDERDATE' as TEXT) as relation_column
        union all
        
        select cast('O_TOTALPRICE' as TEXT) as relation_column
        union all
        
        select cast('O_ORDERSTATUS' as TEXT) as relation_column
        
        
    ),
    input_columns as (

        
        select cast('CUSTKEY' as TEXT) as input_column
        union all
        
        select cast('O_ORDERKEY' as TEXT) as input_column
        union all
        
        select cast('O_ORDERDATE' as TEXT) as input_column
        union all
        
        select cast('O_TOTALPRICE' as TEXT) as input_column
        union all
        
        select cast('O_ORDERSTATUS' as TEXT) as input_column
        
        
    )
    select *
    from
        relation_columns r
        full outer join
        input_columns i on r.relation_column = i.input_column
    where
        -- catch any column in input list that is not in the list of table columns
        -- or any table column that is not in the input list
        r.relation_column is null or
        i.input_column is null