
/*
* Tabla: dbo.DimPersonas
* Descripción: Tabla que contiene los datos de las personas.
*/

create table dbo.DimPersonas (
	[profile.identity] bigint not null PRIMARY KEY
	,[profile.all_identities] varchar(max)
	,[profile.platform] varchar(500)
	,[profile.phone] bigint null
	,[profile.name] varchar(500)
	,[profile.email] varchar(500)
	,[deviceInfo.make] varchar(500)
)