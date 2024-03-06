{% set customer_data = run_query("SELECT customerid FROM {{ source('first_src', 'Customers_dett') }}") %}

{% if customer_data %}
    {% set scustomer_id = customer_data[0]['customerid'] %}
{% else %}
    {% set scustomer_id = None %}
{% endif %}

SELECT *
FROM {{ source('first_src', 'cust') }}
{% if scustomer_id %}
WHERE customerid = '{{ scustomer_id }}'
{% endif %}