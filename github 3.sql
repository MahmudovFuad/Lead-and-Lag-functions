---using lead lag function sql server 
-- -- Hierarchical arrangement of sales history of products 
---establishing the hierarchical growth sequence of dates


--creating table 
CREATE TABLE [dbo].[product](
	[product_name] [nvarchar](20) NULL,
	[production_date] [date] NULL,
	[number] [int] NULL,
	[price] [decimal](9, 3) NULL,
	[city] [nvarchar](20) NULL
) ON [PRIMARY]

go

---inserting data


insert into product(city,product_name,production_date,number,price)
values('Baku','Yoghurt','2020-01-01',100,2.550),
('Ankara','Tea','2020-05-02',150,10.500),
('Baku','Sausage','2021-03-19',240,13.75),
('Istanbul','Rice','2022-04-30',500,4.500),
('Ankara','Sugar','2019-07-19',660,5.500),
('Istanbul','Soap','2022-01-01',1000,11.30),
('Ankara','Waffles','2022-02-02',330,8.500),
('Istanbul','Fruit Juice','2021-03-01',2200,2.000),
('Baku','Alcohol','2022-05-05',1200,25.000),
('Ankara','Water','2022-10-10',900,1.800),
('Baku','Bread','2022-07-05',240,2.000),
('Istanbul','Cake','2023-09-18',465,3.700),
('Baku','Pasta','2018-07-01',1250,3.400),
('Ankara','Milk','2021-03-20',1345,2.800),
('Istanbul','Chip','2022-10-30',680,3.000)
,('Baku','Yoghurt','2020-01-01',100,2.550),
('Ankara','Tea','2020-05-02',150,10.500),
('Baku','Sausage','2021-03-19',240,13.75),
('Istanbul','Rice','2022-04-30',500,4.500),
('Ankara','Sugar','2019-07-19',660,5.500),
('Istanbul','Soap','2022-01-01',1000,11.30),
('Ankara','Waffles','2022-02-02',330,8.500),
('Istanbul','Fruit Juice','2021-03-01',2200,2.000),
('Baku','Alcohol','2022-05-05',1200,25.000),
('Ankara','Water','2022-10-10',900,1.800),
('Baku','Bread','2022-07-05',240,2.000),
('Istanbul','Cake','2023-09-18',465,3.700),
('Baku','Pasta','2018-07-01',1250,3.400),
('Ankara','Milk','2021-03-20',1345,2.800),
('Istanbul','Chip','2022-10-30',680,3.000)


select * from product order by 2

-- arrangement of dates before and after each date - through LAG and LEAD functions
select product_name,city,LAG(production_date) over(order by production_date) before_time,production_date,
LEAD(production_date) over(order by production_date) after_time,
number,price from(
select * from (
select product_name,city,production_date,
ROW_NUMBER() over(partition by production_date order by production_date) rn,
number,price from product
)t where rn=1
)r