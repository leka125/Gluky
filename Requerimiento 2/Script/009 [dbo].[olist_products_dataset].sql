/*
* Tabla: [dbo].[olist_products_dataset]
* Descripción: Contiene los productos
*/

CREATE TABLE [dbo].[olist_products_dataset](
	[product_id] [nvarchar](50) NOT NULL,
	[product_category_name] [nvarchar](50) NULL,
	[product_name_lenght] [int] NULL,
	[product_description_lenght] [int] NULL,
	[product_photos_qty] [int] NULL,
	[product_weight_g] [int] NULL,
	[product_length_cm] [int] NULL,
	[product_height_cm] [int] NULL,
	[product_width_cm] [int] NULL
) ON [PRIMARY]
GO


