-- Exploring sales reason 

select *
from Sales.SalesReason

-- Sales reason count. and the Most common salesreason .

select 
		t1.name, 
		format(count(t2.salesreasonid),'#,#') as SalesReasonCount
	from Sales.SalesReason t1 
	join Sales.SalesOrderHeaderSalesReason t2 on 
	t1.SalesReasonID = t2.SalesReasonID
	group by t1.name
/*
 while joining SaleReason table with SalesOrderheaderSaleReason gives us over 27k records
 running salesorderheader tables shows over 31k records
 that means few orders have more than one reason
*/
	select 
		count(t1.SalesOrderID),
		count(distinct t1.SalesOrderID),
		count(t2.salesorderid) 

		from Sales.SalesOrderHeader t1 
			left join Sales.SalesOrderHeaderSalesReason t2 on 
			t1.SalesOrderID = t2.SalesOrderID 
			left join Sales.SalesReason t3 on 
			t2.SalesReasonID = t3.SalesReasonID


			-- finding number of total reason 
with salesreasoncount_cte as(
	select t1.SalesOrderID,
		count(t2.SalesOrderID) as cnt

		from Sales.SalesOrderHeader t1 
			left join Sales.SalesOrderHeaderSalesReason t2 on 
			t1.SalesOrderID = t2.SalesOrderID 
			left join Sales.SalesReason t3 on 
			t2.SalesReasonID = t3.SalesReasonID
		group by t1.SalesOrderID
) 
select 
	cnt,
	count(*) as totalSalesOrderIds
from salesreasoncount_cte
group by cnt
order by 1;
	
/*
	Summary:
		over 18 thousands order ids have one sales reason
*/
