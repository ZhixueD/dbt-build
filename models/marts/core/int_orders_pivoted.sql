{% set payment_method=['bank_transfer','coupon','credit_card','gift_card'] %}
with payments as (
    select * from {{ ref('stg_payments')}}
),

pivoted as (
    select 
    order_id,
    {% for item in payment_method %}
    sum(case when payment_method = '{{item}}' then amount else 0 end) as {{item}}_amount
    {% if not loop.last %}
        ,
    {% endif %}        
    {% endfor %}
    from payments
    where status='success'
    group by 1

)

select * from pivoted