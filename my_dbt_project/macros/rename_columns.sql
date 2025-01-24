{% macro rename_column(column_list, old_name, new_name) %}
    {% set renamed_columns = [] %}
    {% for column in column_list %}
        {% if column.name == old_name %}
            {% do renamed_columns.append(column.update(name=new_name)) %}
        {% else %}
            {% do renamed_columns.append(column) %}
        {% endif %}
    {% endfor %}
    {{ renamed_columns }}
{% endmacro %}
