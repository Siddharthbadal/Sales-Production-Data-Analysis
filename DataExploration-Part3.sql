
-- Working with state province table and exploring taxes


-- use AdventureWorks2019

-- list of every country and state in the database.
select 
	countryregioncode, 
	--stateprovincecode, 
	count(stateprovincecode) as TotalstateProvince

	from Person.stateprovince
	group by countryregioncode


-- state province names with countries
select 
	cr.name as 'country',
	sp.name as 'State'

from Person.stateprovince sp
	inner join Person.countryregion cr on 
	sp.countryregioncode = cr.countryregioncode 

/*
Total 181 state province
*/


-- Tax rates with state province and countries

select 
	cr.name as 'country',
	sp.name as 'State',
	tr.TaxRate as 'TaxRate'

from Person.stateprovince sp
	inner join Person.countryregion cr on 
	sp.countryregioncode = cr.countryregioncode 
	left join Sales.SalesTaxRate tr on 
	tr.StateProvinceID = sp.StateProvinceID
/*
There are 181 rows when working with countries and states, 
but with tax rates the number of rows increases to 184. (query above)
because we have three duplicate entries. Query below.
*/

select 
	sp.StateProvinceCode,
	sp.StateProvinceID

	from Person.stateprovince sp
		inner join Person.countryregion cr on 
		sp.countryregioncode = cr.countryregioncode 
		left join Sales.SalesTaxRate tr on 
		tr.StateProvinceID = sp.StateProvinceID

	group by sp.StateProvinceID, sp.StateProvinceCode
	having count(StateProvinceCode) > 1;






--locations with the  highest tax rates
Select 
	cr.Name as 'Country',
	sp.Name as 'State',
	tr.TaxRate
From Person.StateProvince sp
	Inner Join Person.CountryRegion cr 
	on cr.CountryRegionCode = sp.CountryRegionCode
	Left Join Sales.SalesTaxRate tr on 
	tr.StateProvinceID = sp.StateProvinceID
Order by 3 desc














