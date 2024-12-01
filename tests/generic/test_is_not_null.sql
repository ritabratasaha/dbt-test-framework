-- Logging the first 100 errors

{% test is_not_null(model, column_name) %}

    select 
    *
    from {{ model }}
    where {{ column_name }} is null
    limit 100

{% endtest %}