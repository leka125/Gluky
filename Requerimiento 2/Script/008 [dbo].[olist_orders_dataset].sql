/*
* Tabla: [dbo].[olist_orders_dataset]
* Descripción: Tiene las ventas realizadas
*/
CREATE TABLE [dbo].[olist_orders_dataset](
	[order_id] [nvarchar](50) NOT NULL,
	[customer_id] [nvarchar](50) NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[order_purchase_timestamp] [datetime2](7) NOT NULL,
	[order_approved_at] [datetime2](7) NULL,
	[order_delivered_carrier_date] [datetime2](7) NULL,
	[order_delivered_customer_date] [datetime2](7) NULL,
	[order_estimated_delivery_date] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO


