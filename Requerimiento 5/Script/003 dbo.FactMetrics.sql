/*
* Tabla: dbo.FactMetrics
* Descripción: Contiene detalle asociado a la persona
*/

create table dbo.FactMetrics (
	[deviceInfo.dpi] bigint not null
	,[deviceInfo.dimensions.width] int null
	,[deviceInfo.dimensions.height] int null
	,[profile.identity] bigint not null
)

ALTER TABLE FactMetrics ADD CONSTRAINT FK_FactMetrics_DimPersonas 
FOREIGN KEY ([profile.identity]) REFERENCES DimPersonas([profile.identity]);