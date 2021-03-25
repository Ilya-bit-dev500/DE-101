select SUM(sales)
from orders o
where order_id not in (select distinct order_id from "returns" r2)


select SUM(profit)
from orders o
where order_id not in (select distinct order_id from "returns" r2)


select (SUM(profit)/SUM(sales)*100)
from orders o 
where order_id not in (select distinct order_id from "returns" r2)


select order_id, SUM(profit) as sum_profit
from orders o 
group by order_id
order by sum_profit desc 


select customer_name, SUM(sales) as sum_sales
from orders o 
where order_id not in (select distinct order_id from "returns" r2)
group by customer_name 
order by sum_sales desc 


select customer_name, round(avg(discount), 2) as avg_discount
from (select distinct order_id, customer_name, discount from orders o) d
group by customer_name 
order by avg_discount desc 


select extract(month from order_date) as mt, segment, sum(sales) as sum_sales
from orders o 
group by mt, segment 
order by mt


select extract(month from order_date) as mt, category, sum(sales) as sum_sales
from orders o 
group by mt, category 
order by mt

select customer_name, SUM(sales) as sum_sales, SUM(profit) as sum_profit
from orders o 
where order_id not in (select distinct order_id from "returns" r2)
group by customer_name 
order by sum_sales desc


select region, SUM(sales) as sum_sales
from orders o
where order_id not in (select distinct order_id from "returns" r2)
group by region 
order by sum_sales desc


select customer_name, sum_sales, rank () over (order by sum_sales desc) as sales_rank
from 
(select customer_name, sum(sales) as sum_sales 
from orders o2 
where order_id not in (select distinct order_id from "returns" r2)
group by customer_name) d
order by sales_rank