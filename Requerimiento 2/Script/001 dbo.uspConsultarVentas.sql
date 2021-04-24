IF OBJECT_ID('[dbo].[uspConsultarVentas]') IS NOT NULL
	DROP PROCEDURE [dbo].[uspConsultarVentas]
GO

CREATE PROCEDURE [dbo].[uspConsultarVentas] (
		 @vFechaInicial varchar(10)		/*Fecha incial de consulta*/
		 ,@vFechaFinal varchar(10)		/*Fecha final de consulta*/
	)

AS

BEGIN TRY

	DECLARE @FechaInicial DATE
	DECLARE @FechaFinal DATE

	SELECT @FechaInicial = CONVERT(DATE,@vFechaInicial,103)
		,@FechaFinal = CONVERT(DATE,@vFechaFinal,103)

	SELECT o.order_id AS IdentificadorInternoVenta
		,o.order_status AS Estado
		,c.customer_city AS Destino
		,o.order_approved_at AS FechaAprobacion
		,oi.order_item_id AS Orden
		,p.product_category_name AS Producto
	FROM [dbo].[olist_orders_dataset] o
	JOIN [dbo].[olist_customers_dataset] c ON o.customer_id = c.customer_id
	JOIN [dbo].[olist_order_items_dataset] oi ON o.order_id = oi.order_id
	JOIN [dbo].[olist_products_dataset] p ON oi.product_id = p.product_id
	WHERE o.order_approved_at >= @FechaInicial AND order_approved_at <= @FechaFinal
	AND p.product_category_name IS NOT NULL
	ORDER BY o.order_id

END TRY
BEGIN CATCH


END CATCH;