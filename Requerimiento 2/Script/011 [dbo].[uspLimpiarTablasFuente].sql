IF OBJECT_ID('[dbo].[uspLimpiarTablasFuente]') IS NOT NULL
	DROP PROCEDURE [dbo].[uspLimpiarTablasFuente]
GO

CREATE PROCEDURE [dbo].[uspLimpiarTablasFuente]

AS

BEGIN TRY

DELETE FROM [dbo].[olist_customers_dataset]  
DELETE FROM [dbo].[olist_order_items_dataset]
DELETE FROM [dbo].[olist_orders_dataset]
DELETE FROM [dbo].[olist_order_reviews_dataset]
DELETE FROM [dbo].[olist_products_dataset]
DELETE FROM [dbo].[olist_sellers_dataset]


END TRY
BEGIN CATCH


END CATCH;