
with ProductProfitability as(
    select * from {{source('star_lake_bdd','ProductProfitability')}}
),

final as(

select product_id, name , sum(profit_margin_per_product) as profit_margin

from ProductProfitability
group by product_id, name 
order by profit_margin desc
)
select * FROM ProductProfitability