-- Looking into Grosss revenue and Net revenue

select product.Name,
		format(ListPrice,'C0'),
		format(StandardCost,'C0'),
		format(ListPrice - StandardCost,'C0') as ProductMargins,
		(ListPrice - StandardCost) as Sort_productmargins
		
	from Production.Product
	order by 5 desc;


/*
a. Within the Production.Product table find a identifier that groups the 8 "Mountain-100" bicycles (4 Silver and 4 Black).

b. How many special offers have been applied to these 8 bicycles? When did the special offer start? When did the    special offer end? What was the special offer?

c. Based on the most recent special offer start date is the product actually discontinued? Is the product still sold?

d. When was the last date the product was sold to an actual customer?

*/

-- Mountain-100" bicycles (4 Silver and 4 Black) are under productmodelid: 19
-- number of special offers have been applied to these 8 bicycles. Special offer details.

select 
	so.StartDate,
	so.EndDate,
	so.type,
	so.category,
	so.Description,
	so.DiscountPct,
	count(distinct p.name) as productCount

from Production.product p join
	sales.SpecialOfferProduct sop on
	p.ProductID = sop.ProductID
	inner join Sales.SpecialOffer so on
	sop.SpecialOfferID = so.SpecialOfferID

where p.name LIKE '%Mountain-100%'
group by so.StartDate,
	so.EndDate,
	so.type,
	so.category,
	so.Description,
	so.DiscountPct

	-- all Mountain-100 biks with ProductModelID: 19 are still being sold as thre no detail in discontinud
select 
	SellStartDate,
	SellEndDate,
	DiscontinuedDate
	from Production.Product
	where ProductModelID = '19'



-- last date the product was sold to an actual customer
select MIN(orderdate) as firstDate,
		MAX(orderdate) as mostRecentDate
	from Sales.SalesOrderHeader soh
		join sales.SalesOrderDetail sod on
		soh.SalesOrderID = sod.SalesOrderID
		join Production.Product p on
		sod.ProductID = p.ProductID
where p.ProductModelID = '19'

/*
Summary from above queries:
	- there are 8 biycle under productmodelid 19 and 
	- thee special offers were applicable on these bikes
	- Third offer ended on 29-May-2012 that was on all 8 bikes
	- all 8 bikes are still being sold. 
	- and the most recent sale was done on 29-May-2012

*/

-- current inventory details for mountain-100 bkes products
select 
	p.Name,
	sum(i.quantity) as Inventory
	from Production.product p
	inner join Production.ProductInventory i on
	p.ProductID = i.ProductID
	where p.ProductModelID ='19'
	group by p.Name 


	
		



		



	