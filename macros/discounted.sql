{% macro discountmacro(column_name) %}
 
  {{ column_name }} * 0.1

{% endmacro %}
