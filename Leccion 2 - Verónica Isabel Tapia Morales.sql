USE [northwind]

/*
	SE NECESITA OBTENER EL NUMERO DE PRODUCTOS QUE EXISTE EN CADA DETALLE DE ORDENES.
	EN EL CUAL SOLO SE MUESTRE LOS DETALLE DE ORDENES CUYA CANTIDAD SEA MAYOR A 10.
	EL REPORTE DEBERA SALIR DE LA SIGUIENTE MANERA:
		CODIGO DE LA ORDEN
		CODIGO PRODUCTO
		NOMBRE PRODUCTO
		CANTIDAD PRODUCTOS
	DEBERAN MOSTRAR LA FECHA DEL DIA DE HOY (COLUMNAS CALCULADAS)
	ADICIONAL AL MES, AÑO Y DIA.
*/

SELECT
    O.OrderID AS 'codigo_de_la_orden',
    OD.ProductID AS 'codigo_producto',
    P.ProductName AS 'nombre_producto',
    OD.Quantity AS 'cantidad_productos',
    GETDATE() AS 'fecha_del_dia_de_hoy',
    YEAR(GETDATE()) AS 'año',
    MONTH(GETDATE()) AS 'mes',
    DAY(GETDATE()) AS 'dia'
FROM
    OrderDetails AS OD
INNER JOIN
    Orders O ON OD.OrderID = O.OrderID
INNER JOIN
    Products P ON OD.ProductID = P.ProductID
WHERE
    OD.Quantity > 10 AND
    OD.OrderID IN (
        SELECT OrderID
        FROM OrderDetails
        WHERE Quantity > 10
    );


--- EXPLICACIÓN DEL INNER JOIN 

/* Según el pedido planteado para el ejercicio, se solicitó obtener el número de productos en cada detalle de las órdenes, 
mostrando solo los detalles de órdenes cuya cantidad sea mayor a 10. Al utilizar un INNER JOIN, 
solo se incluirán los registros que tengan coincidencias en ambas  tablas, es decir, 
se mostrarán únicamente los detalles de las órdenes que cumplan con el criterio de cantidad,
haciendo que INNER JOIN sea la mejor elección. */





