

with ProductPerformance as(
    select * from {{source('star_lake_bdd','ProductPerformance')}}
),

final as(
select
product_id, name , sum(total_units_sold) as units_sold, sum(total_revenue_generated)  as revenue

from ProductPerformance

group by product_id, name
order by units_sold,revenue desc
)
select * FROM final