

with customers as (

   select * from {{source('star_lake_bdd','customers_1')}}

),

orders as (
    select * from {{source('star_lake_bdd','orders_1')}} 
),

final as(
SELECT 

c.customer_id ,concat(c.first_name,' ',c.last_name) as customer_full_name ,sum(p.
price) as total_spend_to_date, avg(p.price) total_spend_order,  COUNT(distinct(o.order_id)) AS frequency_of_orders



FROM  orders as o , UNNEST(products) as p
INNER JOIN  customers as c

ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_full_name 
)

select * from final