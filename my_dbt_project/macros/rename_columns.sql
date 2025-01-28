{% macro rename_columns(table_name) %}
    {% set columns = dbt_utils.get_columns_in_relation(table_name) %}
    {% set renamed_columns = [] %}

    {% for column in columns %}
        {% set new_column = column.name | lower | replace(" ", "_") | replace("/", "") %}
        {% do renamed_columns.append(new_column) %}
    {% endfor %}

    {% set renamed_columns_string = renamed_columns | join(', ') %}
    
    SELECT {{ renamed_columns_string }}
    FROM {{ table_name }}
{% endmacro %}
