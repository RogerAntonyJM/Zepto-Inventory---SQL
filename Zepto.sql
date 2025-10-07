drop table if exists zepto;

create table zepto(
category varchar(100),
name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms integer,
outOfStock Boolean,
quantity integer
);

-- data exploration

-- count of rows
select count(*) from zepto;

-- sample data 

select * from zepto
limit 5;

-- To check any null values in the table 

 select * from zepto
 where category is null 
 or
 name is null
 or
 mrp is null 
 or
 discountPercent is null
 or 
 availableQuantity is null
 or 
 discountedSellingPrice is null
 or
 weightInGms is null
 or
 outOfStock is null
 or
 quantity is null;


-- data cleaning 

-- product with price = 0

select * from zepto
where mrp = 0 
or discountedSellingPrice = 0;

delete from zepto
where mrp = 0;

-- convert paise to rupees

update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto;

--Q1.Find the top 10 best-value product based on the discount percentage.

select distinct name ,mrp,discountPercent 
from zepto
order by discountPercent desc
limit 10;

--Q2.find the product with highest mrp that are currently out of stock.

select distinct name , mrp
from zepto
where outOfStock=true 
order by mrp desc;

--Q3.find all products where discounted price > mrp (data issue)

select name ,category, discountedSellingPrice,mrp
from zepto
where discountedSellingPrice>mrp;

--Q4.find the total number of available products per category

select category , count(*) as available_products
from zepto
where outOfStock=false
group by category;

--Q5.calculate the average mrp per category

select category ,
round(avg(mrp),2) as avg_mrp
from zepto
group by category;

--Q6.calculate total inventory value per category

select category,
sum(discountedSellingPrice*availablequantity) as total_inventory_value
from zepto
group by category;

--Q7.find categories where more than 50% products are out of stock

select category
from zepto
group by category
having sum(case when outOfStock = 'yes' then 1 else 0 end)> count(*)/2;

--Q7.find slow - moving inventory(high stock, low discount)

select name,category,availableQuantity,discountPercent
from zepto
where availableQuantity>5 and discountPercent<10;

--Q8.find the top selling product(highests stock turnover) category

select category,
sum(quantity-availableQuantity) as sold_units
from zepto
group by category
order by sold_units desc
limit 5;

--Q9.find 
 




 





