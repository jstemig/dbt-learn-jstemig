with Orders as (
    select *
    from {{ref('stg_orders')}}
)

, payments as (

    select *
    from {{ref('stg_payments')}}
)

--best practice - when you're bringing in other stuff using ref, just create them as objects in our CTE.

, Order_Payments as (
    select
     sum(amount) Amount,
     Order_ID
    from payments p
    where p.status <> 'fail'
    group by Order_ID 
)

--best practice - last step CTE should be final, then select * from final - this makes it slick to troubleshoot in snowflake. 

, final as (
    select 
        o.customer_id
      , o.Order_ID
      , o.order_date
      , o.status
      , op.Amount
    from Orders o
    left join Order_Payments op
    on o.Order_ID = op.Order_ID
)

--1672 is rev goal 

select *
from final







