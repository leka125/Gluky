/*
* Tabla: [dbo].[olist_order_reviews_dataset]
* Descripción: Contiene la calificación de la venta
*/
CREATE TABLE [dbo].[olist_order_reviews_dataset](
	[review_id] [nvarchar](50) NOT NULL,
	[order_id] [nvarchar](50) NOT NULL,
	[review_score] [nvarchar](50) NOT NULL,
	[review_comment_title] [nvarchar](50) NULL,
	[review_comment_message] [nvarchar](250) NULL,
	[review_creation_date] [datetime2](7) NOT NULL,
	[review_answer_timestamp] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO


