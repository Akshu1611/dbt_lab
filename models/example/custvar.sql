SELECT * FROM {{ ref('customer') }}
WHERE last_name = '{{ var('last_name') }}';