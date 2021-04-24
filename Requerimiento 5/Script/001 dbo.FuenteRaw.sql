
/*
* Tabla: dbo.FuenteRaw
* Descripción: Tabla base que consolida la data de los archivos a cargar.
*/

create table dbo.FuenteRaw (
	[profile.identity] varchar(500) null
	,[profile.all_identities] varchar(max) null
	,[profile.platform] varchar(500) null
	,[profile.phone] varchar(500)   null 
	,[profile.name] varchar(500)	null 
	,[profile.email] varchar(500)	null 
	,[deviceInfo.make] varchar(500)	null 
	,[deviceInfo.dpi] varchar(500)	null 
	,[deviceInfo.dimensions.width] varchar(500) null
	,[deviceInfo.dimensions.height] varchar(500) null
	,[eventProps.wzrk_pid] varchar(500) null
	,[eventProps.wzrk_cid] varchar(500)	null
	,[eventProps.wzrk_dt] varchar(500)	null
)