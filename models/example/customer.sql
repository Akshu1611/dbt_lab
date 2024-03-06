SELECT 
    CustomerID, 
    FirstName, 
    LastName,
    {% for CustomerID in ['1', '2', '3'] %}
        NULL AS val_{{ CustomerID }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM 
    {{ source('first_src', 'Customers_dett') }} 