IF OBJECT_ID('[dbo].[uspDimSource]') IS NOT NULL
	DROP PROCEDURE [dbo].[uspDimSource]
GO


/*
* Descripción: Inserta la data en [dbo].[DimSource] desde la fuente FuenteRaw
*/
CREATE PROCEDURE [dbo].[uspDimSource] 

AS

BEGIN TRY

--consulta para insertar datos
INSERT INTO [dbo].[DimSource]([eventProps.wzrk_pid] ,[eventProps.wzrk_cid] ,[eventProps.wzrk_dt] ,[profile.identity] )
	SELECT [eventProps.wzrk_pid] ,max([eventProps.wzrk_cid]) ,max([eventProps.wzrk_dt]) ,convert(bigint, r.[profile.identity])
	FROM [dbo].[FuenteRaw] r
	WHERE NOT EXISTS (SELECT 1 FROM [dbo].[FactMetrics] f 
		WHERE convert(bigint, r.[profile.identity]) = f.[profile.identity]
		AND convert(bigint, r.[deviceInfo.dpi]) = f.[deviceInfo.dpi]
		)
	GROUP BY r.[profile.identity]
	,r.[eventProps.wzrk_pid]

END TRY
BEGIN CATCH


END CATCH;