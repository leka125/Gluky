
/*
* Tabla: [dbo].[olist_customers_dataset]
* Descripción: Contiene los compradores
*/

CREATE TABLE [dbo].[olist_customers_dataset](
	[customer_id] [nvarchar](50) NOT NULL,
	[customer_unique_id] [nvarchar](50) NOT NULL,
	[customer_zip_code_prefix] [int] NOT NULL,
	[customer_city] [nvarchar](50) NOT NULL,
	[customer_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


