/***************************************************************************/
	--Nombre del Objeto:  [db_marcaciones].[sp_marcacionesproc_Procesar]                                      
	--Fecha de creación:  2017/11/10 9:51 AM                                                 
	--Responsable:        mlopez                                                         
	--Funcionalidad:                                                        
/***************************************************************************/
/*                        Cambios Efectuados                               */
	-- Responsable:                                                            
	-- Fecha:                                                                  
	-- descripcion del Cambio:                                                 
/***************************************************************************/

USE [db_comsucre];
GO

/****** Object:  StoredProcedure [db_marcaciones].[sp_marcacionesproc_Procesar]    Script Date: 11/18/2017 5:28:05 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
ALTER PROCEDURE [db_marcaciones].[sp_marcacionesproc_Procesar]
(@anio INT,
 @mes  INT
)
AS
         BEGIN
 
-- USE [db_comsucre];
--DECLARE @anio INT;
--SET @anio = 2017;
--DECLARE @mes INT;
--SET @mes = 7;
             SET DATEFORMAT DMY;
             DECLARE @tabletemp TABLE
             (id             INT IDENTITY,
              cod_marcacion  NVARCHAR(50),
              nombreemp      NVARCHAR(200),
              Dia            DATETIME,
              HoraEntradaEmp DATETIME,
              HoraSalidaEmp  DATETIME,
              EntradaPorMarc DATETIME,
              SalidaPorMarc  DATETIME
             );
             INSERT INTO @tabletemp
             (cod_marcacion,
              nombreemp,
              Dia,
              HoraEntradaEmp,
              HoraSalidaEmp,
              EntradaPorMarc,
              SalidaPorMarc
             )
                    SELECT cod_marcacion,
                           nombreemp,
                           CAST(SUBSTRING(fechamarc, 1, 10) AS DATETIME) AS Dia,
                           CAST(SUBSTRING(fechamarc, 1, 10)+' '+CAST(hentrada AS NVARCHAR(10)) AS DATETIME) AS HoraEntradaEmp,
                           CAST(SUBSTRING(fechamarc, 1, 10)+' '+CAST(hsalida AS NVARCHAR(10)) AS DATETIME) AS HoraSalidaEmp,
                           CAST(SUBSTRING(fechamarc, 1, 10)+' '+SUBSTRING(replace(replace(replace(replace(replace(replace(horariot, ' ', ''), '-', ''), 'a', ''), 'M', ''), 'P', ''), 'P', ''), 5, 5) AS DATETIME) AS EntradaPorMarc,
                           CAST(SUBSTRING(fechamarc, 1, 10)+' '+SUBSTRING(replace(replace(replace(replace(replace(replace(horariot, ' ', ''), '-', ''), 'a', ''), 'M', ''), 'P', ''), 'P', ''), 10, 5) AS DATETIME) AS SalidaPorMarc
 -- ,cast('01-01-2000'+substring(                              ,) as datetime)) as atrazo,9 as hextra
                    FROM [db_marcaciones].[tb_marcaciones] m
                    WHERE CAST(SUBSTRING(fechamarc, 7, 4) AS INT) = @anio
                          AND CAST(SUBSTRING(fechamarc, 4, 2) AS INT) = @mes
                          AND NOT hentrada IS NULL
                          AND NOT hsalida IS NULL
                    ORDER BY 2,
                             3;
             DECLARE @tableProcesadotemp TABLE
             (id             INT IDENTITY,
              cod_marcacion  NVARCHAR(50),
              nombreemp      NVARCHAR(200),
              Dia            DATETIME,
              EntradaPorMarc DATETIME,
              HoraEntradaEmp DATETIME,
              TiempoAtraso   TIME,
              SalidaPorMarc  DATETIME,
              HoraSalidaEmp  DATETIME,
              TiempoHExtra   TIME
             );


 -- INSERTAMOS LOS REGISTROS PROCESADOS 
             INSERT INTO @tableProcesadotemp
             (cod_marcacion,
              nombreemp,
              Dia,
              EntradaPorMarc,
              HoraEntradaEmp,
              TiempoAtraso,
              SalidaPorMarc,
              HoraSalidaEmp,
              TiempoHExtra
             )
                    SELECT cod_marcacion,
                           nombreemp,
                           Dia,
                           EntradaPorMarc,
                           HoraEntradaEmp,
                           CASE
                               WHEN DATEDIFF(MINUTE, EntradaPorMarc, HoraEntradaEmp) < 0
                               THEN CAST('00:00:00.0000000' AS TIME)
                               ELSE CAST(HoraEntradaEmp - EntradaPorMarc AS TIME)
                               END AS TiempoAtraso,
                           SalidaPorMarc,
                           HoraSalidaEmp,
                           CASE
                               WHEN DATEDIFF(MINUTE, SalidaPorMarc, HoraSalidaEmp) < 0
                               THEN CAST('00:00:00.0000000' AS TIME)
                               ELSE CAST(HoraSalidaEmp - SalidaPorMarc AS TIME)
                               END AS TiempoHExtra
                    FROM @tabletemp;
             DECLARE @cod_marcacion NVARCHAR(50), @nombreemp NVARCHAR(200), @Dia DATETIME, @EntradaPorMarc DATETIME, @HoraEntradaEmp DATETIME, @TiempoAtraso TIME, @SalidaPorMarc DATETIME, @HoraSalidaEmp DATETIME, @TiempoHExtra TIME;
             DECLARE db_cursor CURSOR
             FOR SELECT cod_marcacion,
                        nombreemp,
                        Dia,
                        EntradaPorMarc,
                        HoraEntradaEmp,
                        TiempoAtraso,
                        SalidaPorMarc,
                        HoraSalidaEmp,
                        TiempoHExtra
                 FROM @tableProcesadotemp;
             OPEN db_cursor;
             FETCH NEXT FROM db_cursor INTO @cod_marcacion, @nombreemp, @Dia, @EntradaPorMarc, @HoraEntradaEmp, @TiempoAtraso, @SalidaPorMarc, @HoraSalidaEmp, @TiempoHExtra;
             WHILE @@FETCH_STATUS = 0
                 BEGIN
                     DECLARE @ExisteRegistroEn_tb_marcacionesproc INT;
                     DECLARE @CedulaEmpleado NVARCHAR(13);
                     SET @CedulaEmpleado = @cod_marcacion;
                     SET @ExisteRegistroEn_tb_marcacionesproc =
                     (
                         SELECT COUNT(1)
                         FROM [db_marcaciones].[tb_marcacionesproc]
                         WHERE [cedula] = @CedulaEmpleado
                               AND CAST([fechamarc] AS DATETIME) = @Dia
                     );
                     IF(@ExisteRegistroEn_tb_marcacionesproc = 0)
                         BEGIN
                             INSERT INTO [db_marcaciones].[tb_marcacionesproc]
                             ([uid_marcacionesproc],
                              [cod_marcacion],
                              [cedula],
                              [fechamarc],
                              [hentrada],
                              [hsalida],
                              [atraso],
                              [extra],
                              [justificado],
                              [motivojust],
                              [estadoexistencia]
                             )
                             VALUES
                             (NEWID(),
                              @cod_marcacion,
                              @cod_marcacion,
                              @Dia,
                              @HoraEntradaEmp,
                              @HoraSalidaEmp,
                              @TiempoAtraso,
                              @TiempoHExtra,
                              0,
                              NULL,
                              'A'
                             );
                         END;
                     FETCH NEXT FROM db_cursor INTO @cod_marcacion, @nombreemp, @Dia, @EntradaPorMarc, @HoraEntradaEmp, @TiempoAtraso, @SalidaPorMarc, @HoraSalidaEmp, @TiempoHExtra;
                 END;
             CLOSE db_cursor;
             DEALLOCATE db_cursor;
-- SELECT *FROM [db_marcaciones].[tb_marcacionesproc];

         END;