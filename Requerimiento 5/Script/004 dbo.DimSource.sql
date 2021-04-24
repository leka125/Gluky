
/*
* Tabla: dbo.DimSource
* Descripción: Tiene detalle asociado a la persona
*/

create table dbo.DimSource (
	[eventProps.wzrk_pid] varchar(14) null 
	,[eventProps.wzrk_cid] varchar(500) null
	,[eventProps.wzrk_dt] varchar(500) null
	,[profile.identity] bigint not null
)


ALTER TABLE DimSource ADD CONSTRAINT FK_DimSource_DimPersonas 
FOREIGN KEY ([profile.identity]) REFERENCES DimPersonas([profile.identity]);