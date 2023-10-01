
WITH fechas AS (
    SELECT DISTINCT DATE(OrderDate) AS fechaPedido
    FROM Sales_SalesOrderHeader
)
SELECT
    TO_DAYS(fechaPedido)  AS dateKey,
    fechaPedido  AS dateValue,
    MONTH(fechaPedido)  AS numMes,
    MONTHNAME(fechaPedido)  AS mesNom,
    adw.DeterminarSemestre(fechaPedido) as semestre,
    YEAR(fechaPedido) AS numYear,
    DATE_FORMAT(fechaPedido, '%Y-%m')  AS yearMesNumber
FROM fechas limit 10;