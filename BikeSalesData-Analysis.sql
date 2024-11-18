use AdventureWorksDW2019

select substring(cast(t1.OrderDateKey as char), 1, 6) as month_key,
	sum(case when EnglishProductSubcategoryName = 'mountain bikes' then salesamount else 0 end) as mountain_bike_sales,
	sum(case when EnglishProductSubcategoryName = 'road bikes' then salesamount else 0 end) as road_bike_sales,
	sum(salesamount) as TotalSales
	from dbo.FactInternetSales t1
	join dbo.DimProduct t2 on
	t1.ProductKey = t2.ProductKey
	join dbo.DimProductSubcategory t3 on 
	t2.ProductSubcategoryKey = t3.ProductSubcategoryKey

	where substring(cast(t1.OrderDateKey as char), 1, 4) = '2012'
	group by substring(cast(t1.OrderDateKey as char), 1, 6)


	select sum(salesamount)
	from  dbo.FactInternetSales t1
	join dbo.DimProduct t2 on
	t1.ProductKey = t2.ProductKey
	join dbo.DimProductSubcategory t3 on 
	t2.ProductSubcategoryKey = t3.ProductSubcategoryKey
	where EnglishProductSubcategoryName = 'mountain bikes' and substring(cast(t1.OrderDateKey as char), 1, 4) = '2012'


	select *
	from dbo.FactInternetSales