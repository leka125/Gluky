IF OBJECT_ID('[dbo].[uspInsertardimPersonas]') IS NOT NULL
	DROP PROCEDURE [dbo].[uspInsertardimPersonas]
GO

/*
* Descripcion: Consulta que inserta datos de la tabla que consolida la data cargada a dbo.DimPersona
*/
CREATE PROCEDURE [dbo].[uspInsertardimPersonas] 

AS

BEGIN TRY


	INSERT INTO [dbo].[DimPersonas]([profile.identity],[profile.all_identities], [profile.platform],[profile.phone],[profile.name],[profile.email],[deviceInfo.make])
	SELECT DISTINCT [profile.identity],[profile.all_identities], [profile.platform],convert(bigint, [profile.phone]),[profile.name],[profile.email],[deviceInfo.make]
	FROM [dbo].[FuenteRaw] r
	WHERE NOT EXISTS (SELECT 1 FROM [dbo].[DimPersonas] p 
		WHERE convert(bigint, r.[profile.identity]) = p.[profile.identity])

END TRY
BEGIN CATCH


END CATCH;