Zepto Inventory Analysis SQL Project

Project Title : Zepto Inventory Analysis

level : Beginner

Project Overview 

The Zepto Inventory Data Analysis Project focuses on analyzing the inventory management system of Zepto and the project aims to extract valuable business insights from raw inventory data using Structured Query Language (SQL).This dataset provides a detailed view of the product catalog and pricing structure of Zepto, a fast-growing 10-minute grocery delivery platform. The data captures essential attributes for over 3,000+ across various categories like Fruits & Vegetables, Dairy, Packaged Foods, Beverages, and more.
The data is structured to support various types of retail analysis, including:
Discount trends by category
Inventory availability and stock-outs
Price distribution and pricing strategy

Objectives 

1.Setup a Zepto Inventory database : Create and populate a zepto Inventory database with provided inventory data.

2.Data Cleaning : Identify and Remove any records with missing or null values.

3.Exploratory Data Analysis (EDA) : Perfom basic exploratory data analysis toi understand the dataset.

4.Business Analysis : use SQL to answer specific bussiness questions and derive insights from the data.

Project Structure

1.Database Setup

* Database Creation : The project starts by creating a database named Zepto_Inventory.
* Table Creation    : The table named Zepto is created to store the inventory data.The table structure includes columns for name,category,mrp,discount percent,discounted selling price,out of stock,quantity,available quantity,weight in gms.

```sql
create database Zepto_Inventory

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
```
-- data exploration

-- count of rows
```sql
select count(*) from zepto;
```
