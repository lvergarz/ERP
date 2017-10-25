USE [db_comsucre]
GO

SET SHOWPLAN_ALL  ON 
GO
DECLARE	@return_value int,
		@resultado varchar(20)

EXEC	@return_value = [db_seguridad].[sp_login]
		@Usuario = N'avergara',
		@Clave = N'lechuga555',
		@FechaCreacionLogin = NULL,
		@FechaModificacion = NULL,
		@FechaExpiracion = NULL,
		@Estado = 1,
		@Expira = 0,
		@trx = N'01001',
		@resultado = @resultado OUTPUT

SELECT	@resultado as N'@resultado'

SELECT	'Return Value' = @return_value

GO

SET SHOWPLAN_ALL  OFF 
GO