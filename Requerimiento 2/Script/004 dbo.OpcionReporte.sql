CREATE TABLE OpcionReporte (
	OpcionReporte_Id bigint not null
	,TituloReporte varchar(100) not null
	,ComandoSql varchar(max) not null
)

INSERT INTO OpcionReporte(OpcionReporte_Id, TituloReporte, ComandoSql) VALUES(1,'Ventas realizadas', 'EXEC [dbo].[uspConsultarVentas] ''{0}'', ''{1}''')
INSERT INTO OpcionReporte(OpcionReporte_Id, TituloReporte, ComandoSql) VALUES(2,'Puntaje de vendedor', 'EXEC [dbo].[uspConsultarPuntosVendedor] ''{0}'', ''{1}''')
INSERT INTO OpcionReporte(OpcionReporte_Id, TituloReporte, ComandoSql) VALUES(3,'Puntaje por producto de vendedor', 'EXEC [dbo].[uspConsultarPuntosxProductoVendedor] ''{0}'', ''{1}''')


