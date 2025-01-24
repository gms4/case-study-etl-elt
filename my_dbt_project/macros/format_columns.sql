-- macros/format_columns.sql
{% macro format_columns(columns) %}
    {% set formatted_columns = [] %}
    {% for column in columns %}
        {% set formatted_column = column | lower | replace(" ", "_") | replace("/", "") %}
        {% do formatted_columns.append(formatted_column) %}
    {% endfor %}
    {{ return(formatted_columns) }}
{% endmacro %}
