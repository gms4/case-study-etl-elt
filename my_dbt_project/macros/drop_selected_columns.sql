{% macro drop_selected_columns(columns, drop_columns) %}
    {% set remaining_columns = [] %}
    {% for column in columns %}
        {% if column not in drop_columns %}
            {% do remaining_columns.append(column) %}
        {% endif %}
    {% endfor %}
    {{ return(remaining_columns) }}
{% endmacro %}
