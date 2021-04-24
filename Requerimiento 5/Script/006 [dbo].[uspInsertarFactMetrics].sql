IF OBJECT_ID('[dbo].[uspInsertarFactMetrics]') IS NOT NULL
	DROP PROCEDURE [dbo].[uspInsertarFactMetrics]
GO


/*
* Descripción: Inserta la data en dbo.FactMetrics desde la fuenteRaw
*/
CREATE PROCEDURE [dbo].[uspInsertarFactMetrics] 

AS

BEGIN TRY

	INSERT INTO [dbo].[FactMetrics]([deviceInfo.dpi],[deviceInfo.dimensions.width],[deviceInfo.dimensions.height],[profile.identity])
	SELECT [deviceInfo.dpi],max([deviceInfo.dimensions.width]),max([deviceInfo.dimensions.height]),max([profile.identity])
	FROM [dbo].[FuenteRaw] r
	WHERE NOT EXISTS (SELECT 1 FROM [dbo].[FactMetrics] f 
		WHERE convert(bigint, r.[profile.identity]) = f.[profile.identity]
		AND convert(bigint, r.[deviceInfo.dpi]) = f.[deviceInfo.dpi]
		)
	GROUP BY r.[profile.identity]
	,r.[deviceInfo.dpi]

END TRY
BEGIN CATCH


END CATCH;
