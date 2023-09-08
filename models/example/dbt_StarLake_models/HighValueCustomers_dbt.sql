
with customers as (

   select * from {{source('star_lake_bdd','CustomerLifeTimeValue')}}

),

final as (

select
customer_id, customer_full_name, sum(total_spend_to_date) as lifetime_value 
 from customers 
 group by  customer_full_name, customer_id
 order by lifetime_value desc
)

select * from   final