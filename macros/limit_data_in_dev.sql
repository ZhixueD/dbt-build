{% macro limit_data_in_dev(date_column, days=3) %}

{% if target.name == 'dev' %}
where {{date_column}} >= DATE_SUB(current_date, interval {{days}} day)
{% endif %}
    
{% endmacro %}