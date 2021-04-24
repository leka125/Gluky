IF OBJECT_ID('[dbo].[uspConsultarPuntosxProductoVendedor]') IS NOT NULL
	DROP PROCEDURE [dbo].[uspConsultarPuntosxProductoVendedor]
GO

CREATE PROCEDURE [dbo].[uspConsultarPuntosxProductoVendedor](
		  @vFechaInicial varchar(10)		/*Fecha incial de consulta*/
		 ,@vFechaFinal varchar(10)		/*Fecha final de consulta*/
	)

AS

BEGIN TRY

	DECLARE @FechaInicial DATE
	DECLARE @FechaFinal DATE

	SELECT @FechaInicial = CONVERT(DATE,@vFechaInicial,103)
		,@FechaFinal = CONVERT(DATE,@vFechaFinal,103)

	SELECT 
		s.seller_zip_code_prefix IdentificadorInternoVendedor
		,oi.product_id AS IdentificadorInternoProducto
		,(SELECT top 1 p.product_category_name FROM [dbo].[olist_products_dataset] p WHERE p.product_id = oi.product_id) AS Item
		,max(s.seller_city) AS CiudadDelVendedor
		,sum(CONVERT(INT,r.review_score)) AS Puntuacion
		,@FechaInicial AS FechaInicioConsulta
		,@FechaFinal AS FechaFinConsulta
	FROM [dbo].[olist_sellers_dataset] s
	JOIN [dbo].[olist_order_items_dataset] oi ON oi.seller_id = s.seller_id
	JOIN [dbo].[olist_orders_dataset] o ON o.order_id = oi.order_id
	JOIN [dbo].[olist_order_reviews_dataset] r	ON oi.order_id = r.order_id
	--JOIN [dbo].[olist_products_dataset] p ON oi.product_id = p.product_id
	WHERE o.order_approved_at >= @FechaInicial AND o.order_approved_at <= @FechaFinal
	GROUP BY s.seller_zip_code_prefix
		,oi.product_id


END TRY
BEGIN CATCH


END CATCH;