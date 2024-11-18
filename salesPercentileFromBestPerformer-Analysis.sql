-- bBst performer by max sales person or percentile
select BusinessEntityID,
		TerritoryID,
		SalesQuota,
		Bonus,
		CommissionPct,
		SalesYTD,
		
		[Totol YTD Sales]= sum(salesYTD) over(), -- total sales YTD in table
		[Max YTD Sales]= max(salesYTD) over(),		-- Max of all sales person 
		[Best Performer]= SalesYTD / max(salesYTD) over()  
		
		
	from Sales.SalesPerson;

-- from above query Business Entity Idd 276 is with Max Sales YTD.

-- Conversion rate for each employee from the best performer
select p.FirstName, p.LastName,
		e.JobTitle,
		eph.Rate,
		[AverageRate]= avg(eph.rate) over(),
		[MaxRate] = max(eph.rate) over(),
		[DiffFromAvgRate]= eph.rate - avg(eph.rate) over(),
		[PercentofMaxRate]= (eph.rate / max(eph.rate) over()) * 100
	from person.Person p
	join HumanResources.Employee e 
	on p.BusinessEntityID = e.BusinessEntityID
	join HumanResources.EmployeePayHistory eph
	on e.BusinessEntityID = eph.BusinessEntityID;


-- prodct category and sub category list price difference
select p.Name, p.ListPrice,
		psc.name,
		pc.name,
		[AvgPriceByCategory]=avg(p.listprice) over(partition by pc.name),
		[AvgPriceByCategoryAndSubcategory] = avg(p.listprice) over(partition by pc.name, psc.name),
		[ProductVsCategoryDiff]= p.ListPrice - avg(p.listprice) over(partition by pc.name)
	
		from Production.Product as p join 
		Production.ProductSubcategory psc 
		on p.ProductSubcategoryID = psc.ProductSubcategoryID
		join Production.ProductCategory pc on
		psc.ProductCategoryID = pc.ProductCategoryID