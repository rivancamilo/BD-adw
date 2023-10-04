SELECT
/* sc.CustomerID
,(case 
    when ExtractValue(p.Demographics, '/IndividualSurvey/MaritalStatus') = 'S'  and ExtractValue(p.Demographics, '/IndividualSurvey/Gender') = 'F' then 'Soltera'
    when ExtractValue(p.Demographics, '/IndividualSurvey/MaritalStatus') = 'S'  and ExtractValue(p.Demographics, '/IndividualSurvey/Gender') <> 'F' then 'Soltero'
    when ExtractValue(p.Demographics, '/IndividualSurvey/MaritalStatus') = 'M'  and ExtractValue(p.Demographics, '/IndividualSurvey/Gender') = 'F' then 'Casada'
    else 'Casado' end) AS estadoCivil
,ExtractValue(p.Demographics, '/IndividualSurvey/YearlyIncome') as ingresosAnuales 
,(case 
    when ExtractValue(p.Demographics, '/IndividualSurvey/Gender') = 'F' then 'Femanino'
    else 'Masculino' end) as genero
,ExtractValue(p.Demographics, '/IndividualSurvey/TotalChildren') as numHijos
,(case 
    when ExtractValue(p.Demographics, '/IndividualSurvey/HomeOwnerFlag') = 1 then 'Si'
    else 'NO' end) as casaPropia
,STR_TO_DATE(SUBSTR(ExtractValue(p.Demographics, '/IndividualSurvey/DateFirstPurchase'),1,10), '%Y-%m-%d') as datePrimeraCompra
,(YEAR(DATE(CONVERT_TZ(CURDATE(), 'UTC', 'America/Bogota')))-YEAR(STR_TO_DATE(SUBSTR(ExtractValue(p.Demographics, '/IndividualSurvey/BirthDate'),1,10), '%Y-%m-%d'))) as edad
,adw.CalcularEdad(SUBSTR(ExtractValue(p.Demographics, '/IndividualSurvey/BirthDate'),1,10),DATE(CONVERT_TZ(CURDATE(), 'UTC', 'America/Bogota'))) as rangoEdad
,t.Group AS continente
,cr.Name as pais
,s.Name as estado
,a.City as ciudad */
COUNT(*)
FROM Sales_Customer sc
INNER JOIN Person_Person p
    ON sc.PersonID = p.BusinessEntityID
INNER JOIN Sales_SalesTerritory t
    ON sc.TerritoryID = t.TerritoryID
INNER JOIN  Person_CountryRegion cr
	ON t.CountryRegionCode = cr.CountryRegionCode
INNER JOIN  Person_StateProvince s
    ON sc.TerritoryID = s.TerritoryID
INNER JOIN  Person_Address a
    ON s.StateProvinceID = a.StateProvinceID







/* SELECT adw.CalcularEdad(STR_TO_DATE('2023-10-03', '%Y-%m-%d'),DATE(CONVERT_TZ(CURDATE(), 'UTC', 'America/Bogota'))) */

