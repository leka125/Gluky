/*
* Tabla: [dbo].[olist_products_dataset]
* Descripción: Contiene los vendedores -identificado por un id-
*/

CREATE TABLE [dbo].[olist_sellers_dataset](
	[seller_id] [nvarchar](50) NOT NULL,
	[seller_zip_code_prefix] [int] NOT NULL,
	[seller_city] [nvarchar](50) NOT NULL,
	[seller_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


