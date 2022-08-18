{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}

    {%- if target.name == 'test' or custom_schema_name is none -%}
        {{ default_schema}}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
    
{%- endmacro %}