
with orders as (
    select * from {{source('star_lake_bdd','orders_1')}} 
),

products as (
     select * from {{source('star_lake_bdd','products_1')}}
),

final as(
    SELECT 
pr.product_id, pr.name , sum(p.quantity) as total_units_sold , sum(p.price) as total_revenue_generated,sum(p.price) / sum(p.quantity) as  average_revenue_per_unit_sold
FROM  orders o , UNNEST(products) as p
INNER JOIN  products pr
ON pr.product_id = p.product_id
GROUP BY pr.product_id, pr.name 
) 

select * from final





