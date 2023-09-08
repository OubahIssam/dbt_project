with ingredients as (

   select * from {{source('star_lake_bdd','ingredients')}}

),

products as (
    select * from {{source('star_lake_bdd','products_1')}} 
),

final as (
select p.product_id, p.name, sum(details.price - i.price) as profit_margin_per_product 
 from products p , UNNEST(ingredients) as e
 inner join ingredients i
 on e.ingredient_id = i.ingredient_id
 group by  p.product_id, p.name
)

select * from   final