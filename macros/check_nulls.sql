
{% macro check_nulls(table_name, column_list) %}
{% set null_check_columns = [] %}
{% for col in column_list %}
{% do null_check_columns.append(col ~ ' IS NULL') %}
{% endfor %}

SELECT *,
(CASE WHEN {{ null_check_columns | join(' OR ') }} THEN 'FAIL'
ELSE 'PASS'
END) AS null_check_status
FROM {{ table_name }}
{% endmacro %}
