{% macro limit_data_in_dev(date_column, days) %}

{% if target.name == 'default' %}
where {{date_column}} >= dateadd('day', -{{days}}, current_timestamp)
{% endif %}
    
{% endmacro %}