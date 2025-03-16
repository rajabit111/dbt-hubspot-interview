{% macro split_string_into_rows(column_name, delimiter=',') %}
    LATERAL FLATTEN(input => SPLIT({{ column_name }}, '{{ delimiter }}'))
{% endmacro %}