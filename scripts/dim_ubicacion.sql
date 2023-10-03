
SELECT 
t.TerritoryID
,t.Group AS continente
,cr.Name as pais
,s.Name as estado
,a.City as ciudad
FROM Sales_SalesTerritory t
LEFT JOIN  Person_CountryRegion cr
	ON t.CountryRegionCode = cr.CountryRegionCode
LEFT JOIN  Person_StateProvince s
    ON t.CountryRegionCode = s.CountryRegionCode AND t.TerritoryID = s.TerritoryID
LEFT JOIN  Person_Address a
    ON s.StateProvinceID = a.StateProvinceID;


