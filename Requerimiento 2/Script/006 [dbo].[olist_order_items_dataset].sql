/*
* Tabla: [dbo].[olist_order_items_dataset]
* Descripción: Relaciona la venta con el cliente, producto y vendedor
*/
CREATE TABLE [dbo].[olist_order_items_dataset](
	[order_id] [nvarchar](50) NOT NULL,
	[order_item_id] [nvarchar](50) NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[seller_id] [nvarchar](50) NOT NULL,
	[shipping_limit_date] [datetime2](7) NOT NULL,
	[price] [float] NOT NULL,
	[freight_value] [float] NOT NULL
) ON [PRIMARY]
GO


