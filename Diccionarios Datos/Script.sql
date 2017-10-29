




/*************************************************************************************************/
/*************************************  DROP TABLE  **********************************************/
/*************************************************************************************************/
DROP TABLE [db_inventario].[tb_kardex];
DROP TABLE [db_inventario].[tb_materiaprima];
DROP TABLE [db_manufactura].[tb_cabeceraorden];
DROP TABLE [db_manufactura].[tb_datalleordenmprima];
DROP TABLE [db_manufactura].[datallegfprima];
DROP TABLE [db_manufactura].[tb_gastosg];
DROP TABLE [db_manufactura].[tb_manoobra];
DROP TABLE [db_traza].[tb_traza];
DROP TABLE [db_seguridad].[tb_login];
DROP TABLE [db_seguridad].[tb_permisosroltrx];
DROP TABLE [db_seguridad].[tb_rol];
DROP TABLE [db_seguridad].[tb_roltrx];
DROP TABLE [db_seguridad].[tb_trx];




/*************************************************************************************************/
/*************************************  DROP SCHEMA  **********************************************/
/*************************************************************************************************/
DROP SCHEMA[db_inventario];
DROP SCHEMA[db_manufactura];
DROP SCHEMA[db_traza];
DROP SCHEMA[db_seguridad];




/*************************************************************************************************/
/**********************************  CREATE SCHEMA  **********************************************/
/*************************************************************************************************/
CREATE SCHEMA[db_inventario];
CREATE SCHEMA[db_manufactura];
CREATE SCHEMA[db_traza];
CREATE SCHEMA[db_seguridad];




/*************************************************************************************************/
/**********************************  CREATE TABLE   **********************************************/
/*************************************************************************************************/
CREATE TABLE [db_inventario].[tb_kardex] (
		id_kardex INT   NOT NULL  ,
		id_materia INT  NOT NULL  ,
		ingreso FLOAT   NOT NULL  ,
		egreso FLOAT    NOT NULL  ,
		fechakardex DATE NOT NULL  ,
		horakardex TIME NOT NULL  );
CREATE TABLE [db_inventario].[tb_materiaprima] (
		id_materia INT  NOT NULL  ,
		cod_materia VARCHAR(10) NOT NULL  ,
		descripcionmateria VARCHAR(100) NOT NULL  ,
		unidad VARCHAR(5) NOT NULL  ,
		fechacreacionmateria DATE NOT NULL  ,
		fechamodificacionmateria DATE NOT NULL  );
CREATE TABLE [db_manufactura].[tb_cabeceraorden] (
		id_cabecera INT NOT NULL  ,
		fechainiciocabecera DATETIME NOT NULL  ,
		operador VARCHAR(200) NOT NULL  ,
		fechafin DATETIME NOT NULL  ,
		fechaempaque DATE NOT NULL  );
CREATE TABLE [db_manufactura].[tb_datalleordenmprima] (
		id_datelleorden INT NOT NULL  ,
		id_cabecera INT NOT NULL  ,
		cod_materiaprima VARCHAR(10) NOT NULL  ,
		cantidad FLOAT  NOT NULL  ,
		costounit FLOAT NOT NULL  ,
		porcentaje FLOAT NOT NULL  ,
		costototal FLOAT NOT NULL  );
CREATE TABLE [db_manufactura].[datallegfprima] (
		id_datelleordengf INT NOT NULL  ,
		id_cabecera INT NOT NULL  ,
		id_gatosf INT   NOT NULL  ,
		horas INT       NOT NULL  ,
		costo FLOAT     NOT NULL  ,
		porcentaje FLOAT NOT NULL  ,
		total FLOAT     NOT NULL  );
CREATE TABLE [db_manufactura].[tb_gastosg] (
		id_gastosg INT  NOT NULL  ,
		descripciongastosg VARCHAR(100) NOT NULL  ,
		estado BIT      NOT NULL  );
CREATE TABLE [db_manufactura].[tb_manoobra] (
		id_manoobra INT NOT NULL  ,
		descripcionmanoobra VARCHAR(100) NOT NULL  ,
		estado BIT      NOT NULL  );
CREATE TABLE [db_traza].[tb_traza] (
		id_traza INT    NOT NULL  ,
		id_trx INT      NOT NULL  ,
		id_login INT    NOT NULL  ,
		accion VARCHAR(20) NOT NULL  ,
		log DATE        NOT NULL  ,
		fechalog DATE   NOT NULL  );
CREATE TABLE [db_seguridad].[tb_login] (
		id_login INT    NOT NULL  ,
		usuario VARCHAR(8) NOT NULL  ,
		clave VARCHAR(20) NOT NULL  ,
		fechacreacionlogin DATE NOT NULL  ,
		fechamodificacion DATE NOT NULL  ,
		fechaexpiracion DATE NOT NULL  ,
		estado BIT      NOT NULL  ,
		expira BIT      NOT NULL  );
CREATE TABLE [db_seguridad].[tb_permisosroltrx] (
		id_permiso VARCHAR(8) NOT NULL  ,
		id_roltrx VARCHAR(8) NOT NULL  ,
		id_login VARCHAR(8) NOT NULL  ,
		fechacreacionpermisosroltrx DATE NOT NULL  ,
		fechamodificacionpermisosroltrx DATE NOT NULL  );
CREATE TABLE [db_seguridad].[tb_rol] (
		id_rol VARCHAR(8) NOT NULL  ,
		cod_rol VARCHAR(20) NOT NULL  ,
		nombrerol VARCHAR(20) NOT NULL  ,
		descripcionrol VARCHAR(500) NOT NULL  ,
		fechacreacionrol DATE NOT NULL  ,
		estado BIT      NOT NULL  );
CREATE TABLE [db_seguridad].[tb_roltrx] (
		id_roltrx VARCHAR(8) NOT NULL  ,
		cod_rol VARCHAR(20) NOT NULL  ,
		cod_trx VARCHAR(20) NOT NULL  ,
		fechacreacionroltrx DATE NOT NULL  ,
		fechamodificacion DATE NOT NULL  );
CREATE TABLE [db_seguridad].[tb_trx] (
		id_trx VARCHAR(8) NOT NULL  ,
		cod_trx VARCHAR(20) NOT NULL  ,
		nombre_trx VARCHAR(20) NOT NULL  ,
		descripciontrx VARCHAR(500) NOT NULL  ,
		fechadecreaciontrx DATE NOT NULL  ,
		estadotrx BIT   NOT NULL  );




/*************************************************************************************************/
/**********************************  primary keys   **********************************************/
/*************************************************************************************************/
ALTER TABLE [db_inventario].[tb_kardex] ADD CONSTRAINT  db_inventariotb_kardex_PK PRIMARY KEY(id_kardex);
ALTER TABLE [db_inventario].[tb_materiaprima] ADD CONSTRAINT  db_inventariotb_materiaprima_PK PRIMARY KEY(id_materia);
ALTER TABLE [db_manufactura].[tb_cabeceraorden] ADD CONSTRAINT  db_manufacturatb_cabeceraorden_PK PRIMARY KEY(id_cabecera);
ALTER TABLE [db_manufactura].[tb_datalleordenmprima] ADD CONSTRAINT  db_manufacturatb_datalleordenmprima_PK PRIMARY KEY(id_datelleorden);
ALTER TABLE [db_manufactura].[datallegfprima] ADD CONSTRAINT  db_manufacturadatallegfprima_PK PRIMARY KEY(id_datelleordengf);
ALTER TABLE [db_manufactura].[tb_gastosg] ADD CONSTRAINT  db_manufacturatb_gastosg_PK PRIMARY KEY(id_gastosg);
ALTER TABLE [db_manufactura].[tb_manoobra] ADD CONSTRAINT  db_manufacturatb_manoobra_PK PRIMARY KEY(id_manoobra);
ALTER TABLE [db_traza].[tb_traza] ADD CONSTRAINT  db_trazatb_traza_PK PRIMARY KEY(id_traza);
ALTER TABLE [db_seguridad].[tb_login] ADD CONSTRAINT  db_seguridadtb_login_PK PRIMARY KEY(id_login);
ALTER TABLE [db_seguridad].[tb_permisosroltrx] ADD CONSTRAINT  db_seguridadtb_permisosroltrx_PK PRIMARY KEY(id_permiso);
ALTER TABLE [db_seguridad].[tb_rol] ADD CONSTRAINT  db_seguridadtb_rol_PK PRIMARY KEY(id_rol);
ALTER TABLE [db_seguridad].[tb_roltrx] ADD CONSTRAINT  db_seguridadtb_roltrx_PK PRIMARY KEY(id_roltrx);
ALTER TABLE [db_seguridad].[tb_trx] ADD CONSTRAINT  db_seguridadtb_trx_PK PRIMARY KEY(id_trx);




/*************************************************************************************************/
/**********************************   procedures    **********************************************/
/*************************************************************************************************/
DROP PROCEDURE [db_inventario].[sp_kardex_select] ;
CREATE PROCEDURE [db_inventario].[sp_kardex_select](
@id_kardex INT,
@id_materia INT,
@ingreso FLOAT,
@egreso FLOAT,
@fechakardex DATE,
@horakardex TIME
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_kardex,id_materia,ingreso,egreso,fechakardex,horakardex
From [db_inventario].[tb_kardex]
Where (id_kardex= @id_kardex or @id_kardex = NULL) and
(id_materia= @id_materia or @id_materia = NULL) and
(ingreso= @ingreso or @ingreso = NULL) and
(egreso= @egreso or @egreso = NULL) and
(fechakardex= @fechakardex or @fechakardex = NULL) and
(horakardex= @horakardex or @horakardex = NULL)  
  END 

DROP PROCEDURE [db_inventario].[sp_kardex_insert] ;
CREATE PROCEDURE [db_inventario].[sp_kardex_insert](
@id_kardex INT,
@id_materia INT,
@ingreso FLOAT,
@egreso FLOAT,
@fechakardex DATE,
@horakardex TIME
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_inventario].[tb_kardex] Where id_kardex=@id_kardex);IF @CONT=0 BEGIN
Insert Into  [db_inventario].[tb_kardex](id_kardex,id_materia,ingreso,egreso,fechakardex,horakardex) Values(@id_kardex,
@id_materia,
@ingreso,
@egreso,
@fechakardex,
@horakardex);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_inventario].[sp_kardex_update] ;
CREATE PROCEDURE [db_inventario].[sp_kardex_update](
@id_kardex INT,
@id_materia INT,
@ingreso FLOAT,
@egreso FLOAT,
@fechakardex DATE,
@horakardex TIME
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_inventario].[tb_kardex] set id_kardex=(Case When  @id_kardex IS NULL  then id_kardex else id_kardex end ),id_materia=(Case When  @id_materia IS NULL  then id_materia else id_materia end ),ingreso=(Case When  @ingreso IS NULL  then ingreso else ingreso end ),egreso=(Case When  @egreso IS NULL  then egreso else egreso end ),fechakardex=(Case When  @fechakardex IS NULL  then fechakardex else fechakardex end ),horakardex=(Case When  @horakardex IS NULL  then horakardex else horakardex end )
Where (id_kardex= @id_kardex or @id_kardex = NULL) and
(id_materia= @id_materia or @id_materia = NULL) and
(ingreso= @ingreso or @ingreso = NULL) and
(egreso= @egreso or @egreso = NULL) and
(fechakardex= @fechakardex or @fechakardex = NULL) and
(horakardex= @horakardex or @horakardex = NULL)  
  END 

DROP PROCEDURE [db_inventario].[sp_kardex];
CREATE PROCEDURE [db_inventario].[sp_kardex] (
@id_kardex INT,
@id_materia INT,
@ingreso FLOAT,
@egreso FLOAT,
@fechakardex DATE,
@horakardex TIME
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='03001' BEGIN  
EXEC [db_inventario].[sp_kardex_select] 
 @id_kardex,
@id_materia,
@ingreso,
@egreso,
@fechakardex,
@horakardex
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='03002' BEGIN  
EXEC [db_inventario].[sp_kardex_insert] 
@id_kardex,
@id_materia,
@ingreso,
@egreso,
@fechakardex,
@horakardex
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='03003' BEGIN  
EXEC [db_inventario].[sp_kardex_update] 
@id_kardex,
@id_materia,
@ingreso,
@egreso,
@fechakardex,
@horakardex
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_inventario].[sp_materiaprima_select] ;
CREATE PROCEDURE [db_inventario].[sp_materiaprima_select](
@id_materia INT,
@cod_materia VARCHAR(10),
@descripcionmateria VARCHAR(100),
@unidad VARCHAR(5),
@fechacreacionmateria DATE,
@fechamodificacionmateria DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_materia,cod_materia,descripcionmateria,unidad,fechacreacionmateria,fechamodificacionmateria
From [db_inventario].[tb_materiaprima]
Where (id_materia= @id_materia or @id_materia = NULL) and
(cod_materia= @cod_materia or @cod_materia = NULL) and
(descripcionmateria= @descripcionmateria or @descripcionmateria = NULL) and
(unidad= @unidad or @unidad = NULL) and
(fechacreacionmateria= @fechacreacionmateria or @fechacreacionmateria = NULL) and
(fechamodificacionmateria= @fechamodificacionmateria or @fechamodificacionmateria = NULL)  
  END 

DROP PROCEDURE [db_inventario].[sp_materiaprima_insert] ;
CREATE PROCEDURE [db_inventario].[sp_materiaprima_insert](
@id_materia INT,
@cod_materia VARCHAR(10),
@descripcionmateria VARCHAR(100),
@unidad VARCHAR(5),
@fechacreacionmateria DATE,
@fechamodificacionmateria DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_inventario].[tb_materiaprima] Where id_materia=@id_materia);IF @CONT=0 BEGIN
Insert Into  [db_inventario].[tb_materiaprima](id_materia,cod_materia,descripcionmateria,unidad,fechacreacionmateria,fechamodificacionmateria) Values(@id_materia,
@cod_materia,
@descripcionmateria,
@unidad,
@fechacreacionmateria,
@fechamodificacionmateria);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_inventario].[sp_materiaprima_update] ;
CREATE PROCEDURE [db_inventario].[sp_materiaprima_update](
@id_materia INT,
@cod_materia VARCHAR(10),
@descripcionmateria VARCHAR(100),
@unidad VARCHAR(5),
@fechacreacionmateria DATE,
@fechamodificacionmateria DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_inventario].[tb_materiaprima] set id_materia=(Case When  @id_materia IS NULL  then id_materia else id_materia end ),cod_materia=(Case When  @cod_materia IS NULL  then cod_materia else cod_materia end ),descripcionmateria=(Case When  @descripcionmateria IS NULL  then descripcionmateria else descripcionmateria end ),unidad=(Case When  @unidad IS NULL  then unidad else unidad end ),fechacreacionmateria=(Case When  @fechacreacionmateria IS NULL  then fechacreacionmateria else fechacreacionmateria end ),fechamodificacionmateria=(Case When  @fechamodificacionmateria IS NULL  then fechamodificacionmateria else fechamodificacionmateria end )
Where (id_materia= @id_materia or @id_materia = NULL) and
(cod_materia= @cod_materia or @cod_materia = NULL) and
(descripcionmateria= @descripcionmateria or @descripcionmateria = NULL) and
(unidad= @unidad or @unidad = NULL) and
(fechacreacionmateria= @fechacreacionmateria or @fechacreacionmateria = NULL) and
(fechamodificacionmateria= @fechamodificacionmateria or @fechamodificacionmateria = NULL)  
  END 

DROP PROCEDURE [db_inventario].[sp_materiaprima];
CREATE PROCEDURE [db_inventario].[sp_materiaprima] (
@id_materia INT,
@cod_materia VARCHAR(10),
@descripcionmateria VARCHAR(100),
@unidad VARCHAR(5),
@fechacreacionmateria DATE,
@fechamodificacionmateria DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='03004' BEGIN  
EXEC [db_inventario].[sp_materiaprima_select] 
 @id_materia,
@cod_materia,
@descripcionmateria,
@unidad,
@fechacreacionmateria,
@fechamodificacionmateria
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='03005' BEGIN  
EXEC [db_inventario].[sp_materiaprima_insert] 
@id_materia,
@cod_materia,
@descripcionmateria,
@unidad,
@fechacreacionmateria,
@fechamodificacionmateria
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='03006' BEGIN  
EXEC [db_inventario].[sp_materiaprima_update] 
@id_materia,
@cod_materia,
@descripcionmateria,
@unidad,
@fechacreacionmateria,
@fechamodificacionmateria
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_manufactura].[sp_datallegfprima_select] ;
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima_select](
@id_datelleordengf INT,
@id_cabecera INT,
@id_gatosf INT,
@horas INT,
@costo FLOAT,
@porcentaje FLOAT,
@total FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_datelleordengf,id_cabecera,id_gatosf,horas,costo,porcentaje,total
From [db_manufactura].[datallegfprima]
Where (id_datelleordengf= @id_datelleordengf or @id_datelleordengf = NULL) and
(id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(id_gatosf= @id_gatosf or @id_gatosf = NULL) and
(horas= @horas or @horas = NULL) and
(costo= @costo or @costo = NULL) and
(porcentaje= @porcentaje or @porcentaje = NULL) and
(total= @total or @total = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_datallegfprima_insert] ;
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima_insert](
@id_datelleordengf INT,
@id_cabecera INT,
@id_gatosf INT,
@horas INT,
@costo FLOAT,
@porcentaje FLOAT,
@total FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[datallegfprima] Where id_datelleordengf=@id_datelleordengf);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[datallegfprima](id_datelleordengf,id_cabecera,id_gatosf,horas,costo,porcentaje,total) Values(@id_datelleordengf,
@id_cabecera,
@id_gatosf,
@horas,
@costo,
@porcentaje,
@total);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_manufactura].[sp_datallegfprima_update] ;
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima_update](
@id_datelleordengf INT,
@id_cabecera INT,
@id_gatosf INT,
@horas INT,
@costo FLOAT,
@porcentaje FLOAT,
@total FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_manufactura].[datallegfprima] set id_datelleordengf=(Case When  @id_datelleordengf IS NULL  then id_datelleordengf else id_datelleordengf end ),id_cabecera=(Case When  @id_cabecera IS NULL  then id_cabecera else id_cabecera end ),id_gatosf=(Case When  @id_gatosf IS NULL  then id_gatosf else id_gatosf end ),horas=(Case When  @horas IS NULL  then horas else horas end ),costo=(Case When  @costo IS NULL  then costo else costo end ),porcentaje=(Case When  @porcentaje IS NULL  then porcentaje else porcentaje end ),total=(Case When  @total IS NULL  then total else total end )
Where (id_datelleordengf= @id_datelleordengf or @id_datelleordengf = NULL) and
(id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(id_gatosf= @id_gatosf or @id_gatosf = NULL) and
(horas= @horas or @horas = NULL) and
(costo= @costo or @costo = NULL) and
(porcentaje= @porcentaje or @porcentaje = NULL) and
(total= @total or @total = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_datallegfprima];
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima] (
@id_datelleordengf INT,
@id_cabecera INT,
@id_gatosf INT,
@horas INT,
@costo FLOAT,
@porcentaje FLOAT,
@total FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='04007' BEGIN  
EXEC [db_manufactura].[sp_datallegfprima_select] 
 @id_datelleordengf,
@id_cabecera,
@id_gatosf,
@horas,
@costo,
@porcentaje,
@total
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04008' BEGIN  
EXEC [db_manufactura].[sp_datallegfprima_insert] 
@id_datelleordengf,
@id_cabecera,
@id_gatosf,
@horas,
@costo,
@porcentaje,
@total
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04009' BEGIN  
EXEC [db_manufactura].[sp_datallegfprima_update] 
@id_datelleordengf,
@id_cabecera,
@id_gatosf,
@horas,
@costo,
@porcentaje,
@total
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_manufactura].[sp_cabeceraorden_select] ;
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden_select](
@id_cabecera INT,
@fechainiciocabecera DATETIME,
@operador VARCHAR(200),
@fechafin DATETIME,
@fechaempaque DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_cabecera,fechainiciocabecera,operador,fechafin,fechaempaque
From [db_manufactura].[tb_cabeceraorden]
Where (id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(fechainiciocabecera= @fechainiciocabecera or @fechainiciocabecera = NULL) and
(operador= @operador or @operador = NULL) and
(fechafin= @fechafin or @fechafin = NULL) and
(fechaempaque= @fechaempaque or @fechaempaque = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_cabeceraorden_insert] ;
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden_insert](
@id_cabecera INT,
@fechainiciocabecera DATETIME,
@operador VARCHAR(200),
@fechafin DATETIME,
@fechaempaque DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[tb_cabeceraorden] Where id_cabecera=@id_cabecera);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[tb_cabeceraorden](id_cabecera,fechainiciocabecera,operador,fechafin,fechaempaque) Values(@id_cabecera,
@fechainiciocabecera,
@operador,
@fechafin,
@fechaempaque);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_manufactura].[sp_cabeceraorden_update] ;
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden_update](
@id_cabecera INT,
@fechainiciocabecera DATETIME,
@operador VARCHAR(200),
@fechafin DATETIME,
@fechaempaque DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_manufactura].[tb_cabeceraorden] set id_cabecera=(Case When  @id_cabecera IS NULL  then id_cabecera else id_cabecera end ),fechainiciocabecera=(Case When  @fechainiciocabecera IS NULL  then fechainiciocabecera else fechainiciocabecera end ),operador=(Case When  @operador IS NULL  then operador else operador end ),fechafin=(Case When  @fechafin IS NULL  then fechafin else fechafin end ),fechaempaque=(Case When  @fechaempaque IS NULL  then fechaempaque else fechaempaque end )
Where (id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(fechainiciocabecera= @fechainiciocabecera or @fechainiciocabecera = NULL) and
(operador= @operador or @operador = NULL) and
(fechafin= @fechafin or @fechafin = NULL) and
(fechaempaque= @fechaempaque or @fechaempaque = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_cabeceraorden];
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden] (
@id_cabecera INT,
@fechainiciocabecera DATETIME,
@operador VARCHAR(200),
@fechafin DATETIME,
@fechaempaque DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='04010' BEGIN  
EXEC [db_manufactura].[sp_cabeceraorden_select] 
 @id_cabecera,
@fechainiciocabecera,
@operador,
@fechafin,
@fechaempaque
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04011' BEGIN  
EXEC [db_manufactura].[sp_cabeceraorden_insert] 
@id_cabecera,
@fechainiciocabecera,
@operador,
@fechafin,
@fechaempaque
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04012' BEGIN  
EXEC [db_manufactura].[sp_cabeceraorden_update] 
@id_cabecera,
@fechainiciocabecera,
@operador,
@fechafin,
@fechaempaque
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_manufactura].[sp_datalleordenmprima_select] ;
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima_select](
@id_datelleorden INT,
@id_cabecera INT,
@cod_materiaprima VARCHAR(10),
@cantidad FLOAT,
@costounit FLOAT,
@porcentaje FLOAT,
@costototal FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_datelleorden,id_cabecera,cod_materiaprima,cantidad,costounit,porcentaje,costototal
From [db_manufactura].[tb_datalleordenmprima]
Where (id_datelleorden= @id_datelleorden or @id_datelleorden = NULL) and
(id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(cod_materiaprima= @cod_materiaprima or @cod_materiaprima = NULL) and
(cantidad= @cantidad or @cantidad = NULL) and
(costounit= @costounit or @costounit = NULL) and
(porcentaje= @porcentaje or @porcentaje = NULL) and
(costototal= @costototal or @costototal = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_datalleordenmprima_insert] ;
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima_insert](
@id_datelleorden INT,
@id_cabecera INT,
@cod_materiaprima VARCHAR(10),
@cantidad FLOAT,
@costounit FLOAT,
@porcentaje FLOAT,
@costototal FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[tb_datalleordenmprima] Where id_datelleorden=@id_datelleorden);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[tb_datalleordenmprima](id_datelleorden,id_cabecera,cod_materiaprima,cantidad,costounit,porcentaje,costototal) Values(@id_datelleorden,
@id_cabecera,
@cod_materiaprima,
@cantidad,
@costounit,
@porcentaje,
@costototal);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_manufactura].[sp_datalleordenmprima_update] ;
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima_update](
@id_datelleorden INT,
@id_cabecera INT,
@cod_materiaprima VARCHAR(10),
@cantidad FLOAT,
@costounit FLOAT,
@porcentaje FLOAT,
@costototal FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_manufactura].[tb_datalleordenmprima] set id_datelleorden=(Case When  @id_datelleorden IS NULL  then id_datelleorden else id_datelleorden end ),id_cabecera=(Case When  @id_cabecera IS NULL  then id_cabecera else id_cabecera end ),cod_materiaprima=(Case When  @cod_materiaprima IS NULL  then cod_materiaprima else cod_materiaprima end ),cantidad=(Case When  @cantidad IS NULL  then cantidad else cantidad end ),costounit=(Case When  @costounit IS NULL  then costounit else costounit end ),porcentaje=(Case When  @porcentaje IS NULL  then porcentaje else porcentaje end ),costototal=(Case When  @costototal IS NULL  then costototal else costototal end )
Where (id_datelleorden= @id_datelleorden or @id_datelleorden = NULL) and
(id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(cod_materiaprima= @cod_materiaprima or @cod_materiaprima = NULL) and
(cantidad= @cantidad or @cantidad = NULL) and
(costounit= @costounit or @costounit = NULL) and
(porcentaje= @porcentaje or @porcentaje = NULL) and
(costototal= @costototal or @costototal = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_datalleordenmprima];
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima] (
@id_datelleorden INT,
@id_cabecera INT,
@cod_materiaprima VARCHAR(10),
@cantidad FLOAT,
@costounit FLOAT,
@porcentaje FLOAT,
@costototal FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='04013' BEGIN  
EXEC [db_manufactura].[sp_datalleordenmprima_select] 
 @id_datelleorden,
@id_cabecera,
@cod_materiaprima,
@cantidad,
@costounit,
@porcentaje,
@costototal
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04014' BEGIN  
EXEC [db_manufactura].[sp_datalleordenmprima_insert] 
@id_datelleorden,
@id_cabecera,
@cod_materiaprima,
@cantidad,
@costounit,
@porcentaje,
@costototal
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04015' BEGIN  
EXEC [db_manufactura].[sp_datalleordenmprima_update] 
@id_datelleorden,
@id_cabecera,
@cod_materiaprima,
@cantidad,
@costounit,
@porcentaje,
@costototal
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_manufactura].[sp_gastosg_select] ;
CREATE PROCEDURE [db_manufactura].[sp_gastosg_select](
@id_gastosg INT,
@descripciongastosg VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_gastosg,descripciongastosg,estado
From [db_manufactura].[tb_gastosg]
Where (id_gastosg= @id_gastosg or @id_gastosg = NULL) and
(descripciongastosg= @descripciongastosg or @descripciongastosg = NULL) and
(estado= @estado or @estado = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_gastosg_insert] ;
CREATE PROCEDURE [db_manufactura].[sp_gastosg_insert](
@id_gastosg INT,
@descripciongastosg VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[tb_gastosg] Where id_gastosg=@id_gastosg);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[tb_gastosg](id_gastosg,descripciongastosg,estado) Values(@id_gastosg,
@descripciongastosg,
@estado);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_manufactura].[sp_gastosg_update] ;
CREATE PROCEDURE [db_manufactura].[sp_gastosg_update](
@id_gastosg INT,
@descripciongastosg VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_manufactura].[tb_gastosg] set id_gastosg=(Case When  @id_gastosg IS NULL  then id_gastosg else id_gastosg end ),descripciongastosg=(Case When  @descripciongastosg IS NULL  then descripciongastosg else descripciongastosg end ),estado=(Case When  @estado IS NULL  then estado else estado end )
Where (id_gastosg= @id_gastosg or @id_gastosg = NULL) and
(descripciongastosg= @descripciongastosg or @descripciongastosg = NULL) and
(estado= @estado or @estado = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_gastosg];
CREATE PROCEDURE [db_manufactura].[sp_gastosg] (
@id_gastosg INT,
@descripciongastosg VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='04016' BEGIN  
EXEC [db_manufactura].[sp_gastosg_select] 
 @id_gastosg,
@descripciongastosg,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04017' BEGIN  
EXEC [db_manufactura].[sp_gastosg_insert] 
@id_gastosg,
@descripciongastosg,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04018' BEGIN  
EXEC [db_manufactura].[sp_gastosg_update] 
@id_gastosg,
@descripciongastosg,
@estado
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_manufactura].[sp_manoobra_select] ;
CREATE PROCEDURE [db_manufactura].[sp_manoobra_select](
@id_manoobra INT,
@descripcionmanoobra VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_manoobra,descripcionmanoobra,estado
From [db_manufactura].[tb_manoobra]
Where (id_manoobra= @id_manoobra or @id_manoobra = NULL) and
(descripcionmanoobra= @descripcionmanoobra or @descripcionmanoobra = NULL) and
(estado= @estado or @estado = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_manoobra_insert] ;
CREATE PROCEDURE [db_manufactura].[sp_manoobra_insert](
@id_manoobra INT,
@descripcionmanoobra VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[tb_manoobra] Where id_manoobra=@id_manoobra);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[tb_manoobra](id_manoobra,descripcionmanoobra,estado) Values(@id_manoobra,
@descripcionmanoobra,
@estado);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_manufactura].[sp_manoobra_update] ;
CREATE PROCEDURE [db_manufactura].[sp_manoobra_update](
@id_manoobra INT,
@descripcionmanoobra VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_manufactura].[tb_manoobra] set id_manoobra=(Case When  @id_manoobra IS NULL  then id_manoobra else id_manoobra end ),descripcionmanoobra=(Case When  @descripcionmanoobra IS NULL  then descripcionmanoobra else descripcionmanoobra end ),estado=(Case When  @estado IS NULL  then estado else estado end )
Where (id_manoobra= @id_manoobra or @id_manoobra = NULL) and
(descripcionmanoobra= @descripcionmanoobra or @descripcionmanoobra = NULL) and
(estado= @estado or @estado = NULL)  
  END 

DROP PROCEDURE [db_manufactura].[sp_manoobra];
CREATE PROCEDURE [db_manufactura].[sp_manoobra] (
@id_manoobra INT,
@descripcionmanoobra VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='04019' BEGIN  
EXEC [db_manufactura].[sp_manoobra_select] 
 @id_manoobra,
@descripcionmanoobra,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04020' BEGIN  
EXEC [db_manufactura].[sp_manoobra_insert] 
@id_manoobra,
@descripcionmanoobra,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04021' BEGIN  
EXEC [db_manufactura].[sp_manoobra_update] 
@id_manoobra,
@descripcionmanoobra,
@estado
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_seguridad].[sp_login_select] ;
CREATE PROCEDURE [db_seguridad].[sp_login_select](
@id_login INT,
@usuario VARCHAR(8),
@clave VARCHAR(20),
@fechacreacionlogin DATE,
@fechamodificacion DATE,
@fechaexpiracion DATE,
@estado BIT,
@expira BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_login,usuario,clave,fechacreacionlogin,fechamodificacion,fechaexpiracion,estado,expira
From [db_seguridad].[tb_login]
Where (id_login= @id_login or @id_login = NULL) and
(usuario= @usuario or @usuario = NULL) and
(clave= @clave or @clave = NULL) and
(fechacreacionlogin= @fechacreacionlogin or @fechacreacionlogin = NULL) and
(fechamodificacion= @fechamodificacion or @fechamodificacion = NULL) and
(fechaexpiracion= @fechaexpiracion or @fechaexpiracion = NULL) and
(estado= @estado or @estado = NULL) and
(expira= @expira or @expira = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_login_insert] ;
CREATE PROCEDURE [db_seguridad].[sp_login_insert](
@id_login INT,
@usuario VARCHAR(8),
@clave VARCHAR(20),
@fechacreacionlogin DATE,
@fechamodificacion DATE,
@fechaexpiracion DATE,
@estado BIT,
@expira BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_seguridad].[tb_login] Where id_login=@id_login);IF @CONT=0 BEGIN
Insert Into  [db_seguridad].[tb_login](id_login,usuario,clave,fechacreacionlogin,fechamodificacion,fechaexpiracion,estado,expira) Values(@id_login,
@usuario,
@clave,
@fechacreacionlogin,
@fechamodificacion,
@fechaexpiracion,
@estado,
@expira);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_seguridad].[sp_login_update] ;
CREATE PROCEDURE [db_seguridad].[sp_login_update](
@id_login INT,
@usuario VARCHAR(8),
@clave VARCHAR(20),
@fechacreacionlogin DATE,
@fechamodificacion DATE,
@fechaexpiracion DATE,
@estado BIT,
@expira BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_seguridad].[tb_login] set id_login=(Case When  @id_login IS NULL  then id_login else id_login end ),usuario=(Case When  @usuario IS NULL  then usuario else usuario end ),clave=(Case When  @clave IS NULL  then clave else clave end ),fechacreacionlogin=(Case When  @fechacreacionlogin IS NULL  then fechacreacionlogin else fechacreacionlogin end ),fechamodificacion=(Case When  @fechamodificacion IS NULL  then fechamodificacion else fechamodificacion end ),fechaexpiracion=(Case When  @fechaexpiracion IS NULL  then fechaexpiracion else fechaexpiracion end ),estado=(Case When  @estado IS NULL  then estado else estado end ),expira=(Case When  @expira IS NULL  then expira else expira end )
Where (id_login= @id_login or @id_login = NULL) and
(usuario= @usuario or @usuario = NULL) and
(clave= @clave or @clave = NULL) and
(fechacreacionlogin= @fechacreacionlogin or @fechacreacionlogin = NULL) and
(fechamodificacion= @fechamodificacion or @fechamodificacion = NULL) and
(fechaexpiracion= @fechaexpiracion or @fechaexpiracion = NULL) and
(estado= @estado or @estado = NULL) and
(expira= @expira or @expira = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_login];
CREATE PROCEDURE [db_seguridad].[sp_login] (
@id_login INT,
@usuario VARCHAR(8),
@clave VARCHAR(20),
@fechacreacionlogin DATE,
@fechamodificacion DATE,
@fechaexpiracion DATE,
@estado BIT,
@expira BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='01022' BEGIN  
EXEC [db_seguridad].[sp_login_select] 
 @id_login,
@usuario,
@clave,
@fechacreacionlogin,
@fechamodificacion,
@fechaexpiracion,
@estado,
@expira
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01023' BEGIN  
EXEC [db_seguridad].[sp_login_insert] 
@id_login,
@usuario,
@clave,
@fechacreacionlogin,
@fechamodificacion,
@fechaexpiracion,
@estado,
@expira
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01024' BEGIN  
EXEC [db_seguridad].[sp_login_update] 
@id_login,
@usuario,
@clave,
@fechacreacionlogin,
@fechamodificacion,
@fechaexpiracion,
@estado,
@expira
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_seguridad].[sp_permisosroltrx_select] ;
CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx_select](
@id_permiso VARCHAR(8),
@id_roltrx VARCHAR(8),
@id_login VARCHAR(8),
@fechacreacionpermisosroltrx DATE,
@fechamodificacionpermisosroltrx DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_permiso,id_roltrx,id_login,fechacreacionpermisosroltrx,fechamodificacionpermisosroltrx
From [db_seguridad].[tb_permisosroltrx]
Where (id_permiso= @id_permiso or @id_permiso = NULL) and
(id_roltrx= @id_roltrx or @id_roltrx = NULL) and
(id_login= @id_login or @id_login = NULL) and
(fechacreacionpermisosroltrx= @fechacreacionpermisosroltrx or @fechacreacionpermisosroltrx = NULL) and
(fechamodificacionpermisosroltrx= @fechamodificacionpermisosroltrx or @fechamodificacionpermisosroltrx = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_permisosroltrx_insert] ;
CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx_insert](
@id_permiso VARCHAR(8),
@id_roltrx VARCHAR(8),
@id_login VARCHAR(8),
@fechacreacionpermisosroltrx DATE,
@fechamodificacionpermisosroltrx DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_seguridad].[tb_permisosroltrx] Where id_permiso=@id_permiso);IF @CONT=0 BEGIN
Insert Into  [db_seguridad].[tb_permisosroltrx](id_permiso,id_roltrx,id_login,fechacreacionpermisosroltrx,fechamodificacionpermisosroltrx) Values(@id_permiso,
@id_roltrx,
@id_login,
@fechacreacionpermisosroltrx,
@fechamodificacionpermisosroltrx);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_seguridad].[sp_permisosroltrx_update] ;
CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx_update](
@id_permiso VARCHAR(8),
@id_roltrx VARCHAR(8),
@id_login VARCHAR(8),
@fechacreacionpermisosroltrx DATE,
@fechamodificacionpermisosroltrx DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_seguridad].[tb_permisosroltrx] set id_permiso=(Case When  @id_permiso IS NULL  then id_permiso else id_permiso end ),id_roltrx=(Case When  @id_roltrx IS NULL  then id_roltrx else id_roltrx end ),id_login=(Case When  @id_login IS NULL  then id_login else id_login end ),fechacreacionpermisosroltrx=(Case When  @fechacreacionpermisosroltrx IS NULL  then fechacreacionpermisosroltrx else fechacreacionpermisosroltrx end ),fechamodificacionpermisosroltrx=(Case When  @fechamodificacionpermisosroltrx IS NULL  then fechamodificacionpermisosroltrx else fechamodificacionpermisosroltrx end )
Where (id_permiso= @id_permiso or @id_permiso = NULL) and
(id_roltrx= @id_roltrx or @id_roltrx = NULL) and
(id_login= @id_login or @id_login = NULL) and
(fechacreacionpermisosroltrx= @fechacreacionpermisosroltrx or @fechacreacionpermisosroltrx = NULL) and
(fechamodificacionpermisosroltrx= @fechamodificacionpermisosroltrx or @fechamodificacionpermisosroltrx = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_permisosroltrx];
CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx] (
@id_permiso VARCHAR(8),
@id_roltrx VARCHAR(8),
@id_login VARCHAR(8),
@fechacreacionpermisosroltrx DATE,
@fechamodificacionpermisosroltrx DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='01025' BEGIN  
EXEC [db_seguridad].[sp_permisosroltrx_select] 
 @id_permiso,
@id_roltrx,
@id_login,
@fechacreacionpermisosroltrx,
@fechamodificacionpermisosroltrx
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01026' BEGIN  
EXEC [db_seguridad].[sp_permisosroltrx_insert] 
@id_permiso,
@id_roltrx,
@id_login,
@fechacreacionpermisosroltrx,
@fechamodificacionpermisosroltrx
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01027' BEGIN  
EXEC [db_seguridad].[sp_permisosroltrx_update] 
@id_permiso,
@id_roltrx,
@id_login,
@fechacreacionpermisosroltrx,
@fechamodificacionpermisosroltrx
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_seguridad].[sp_rol_select] ;
CREATE PROCEDURE [db_seguridad].[sp_rol_select](
@id_rol VARCHAR(8),
@cod_rol VARCHAR(20),
@nombrerol VARCHAR(20),
@descripcionrol VARCHAR(500),
@fechacreacionrol DATE,
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_rol,cod_rol,nombrerol,descripcionrol,fechacreacionrol,estado
From [db_seguridad].[tb_rol]
Where (id_rol= @id_rol or @id_rol = NULL) and
(cod_rol= @cod_rol or @cod_rol = NULL) and
(nombrerol= @nombrerol or @nombrerol = NULL) and
(descripcionrol= @descripcionrol or @descripcionrol = NULL) and
(fechacreacionrol= @fechacreacionrol or @fechacreacionrol = NULL) and
(estado= @estado or @estado = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_rol_insert] ;
CREATE PROCEDURE [db_seguridad].[sp_rol_insert](
@id_rol VARCHAR(8),
@cod_rol VARCHAR(20),
@nombrerol VARCHAR(20),
@descripcionrol VARCHAR(500),
@fechacreacionrol DATE,
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_seguridad].[tb_rol] Where id_rol=@id_rol);IF @CONT=0 BEGIN
Insert Into  [db_seguridad].[tb_rol](id_rol,cod_rol,nombrerol,descripcionrol,fechacreacionrol,estado) Values(@id_rol,
@cod_rol,
@nombrerol,
@descripcionrol,
@fechacreacionrol,
@estado);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_seguridad].[sp_rol_update] ;
CREATE PROCEDURE [db_seguridad].[sp_rol_update](
@id_rol VARCHAR(8),
@cod_rol VARCHAR(20),
@nombrerol VARCHAR(20),
@descripcionrol VARCHAR(500),
@fechacreacionrol DATE,
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_seguridad].[tb_rol] set id_rol=(Case When  @id_rol IS NULL  then id_rol else id_rol end ),cod_rol=(Case When  @cod_rol IS NULL  then cod_rol else cod_rol end ),nombrerol=(Case When  @nombrerol IS NULL  then nombrerol else nombrerol end ),descripcionrol=(Case When  @descripcionrol IS NULL  then descripcionrol else descripcionrol end ),fechacreacionrol=(Case When  @fechacreacionrol IS NULL  then fechacreacionrol else fechacreacionrol end ),estado=(Case When  @estado IS NULL  then estado else estado end )
Where (id_rol= @id_rol or @id_rol = NULL) and
(cod_rol= @cod_rol or @cod_rol = NULL) and
(nombrerol= @nombrerol or @nombrerol = NULL) and
(descripcionrol= @descripcionrol or @descripcionrol = NULL) and
(fechacreacionrol= @fechacreacionrol or @fechacreacionrol = NULL) and
(estado= @estado or @estado = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_rol];
CREATE PROCEDURE [db_seguridad].[sp_rol] (
@id_rol VARCHAR(8),
@cod_rol VARCHAR(20),
@nombrerol VARCHAR(20),
@descripcionrol VARCHAR(500),
@fechacreacionrol DATE,
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='01028' BEGIN  
EXEC [db_seguridad].[sp_rol_select] 
 @id_rol,
@cod_rol,
@nombrerol,
@descripcionrol,
@fechacreacionrol,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01029' BEGIN  
EXEC [db_seguridad].[sp_rol_insert] 
@id_rol,
@cod_rol,
@nombrerol,
@descripcionrol,
@fechacreacionrol,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01030' BEGIN  
EXEC [db_seguridad].[sp_rol_update] 
@id_rol,
@cod_rol,
@nombrerol,
@descripcionrol,
@fechacreacionrol,
@estado
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_seguridad].[sp_roltrx_select] ;
CREATE PROCEDURE [db_seguridad].[sp_roltrx_select](
@id_roltrx VARCHAR(8),
@cod_rol VARCHAR(20),
@cod_trx VARCHAR(20),
@fechacreacionroltrx DATE,
@fechamodificacion DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_roltrx,cod_rol,cod_trx,fechacreacionroltrx,fechamodificacion
From [db_seguridad].[tb_roltrx]
Where (id_roltrx= @id_roltrx or @id_roltrx = NULL) and
(cod_rol= @cod_rol or @cod_rol = NULL) and
(cod_trx= @cod_trx or @cod_trx = NULL) and
(fechacreacionroltrx= @fechacreacionroltrx or @fechacreacionroltrx = NULL) and
(fechamodificacion= @fechamodificacion or @fechamodificacion = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_roltrx_insert] ;
CREATE PROCEDURE [db_seguridad].[sp_roltrx_insert](
@id_roltrx VARCHAR(8),
@cod_rol VARCHAR(20),
@cod_trx VARCHAR(20),
@fechacreacionroltrx DATE,
@fechamodificacion DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_seguridad].[tb_roltrx] Where id_roltrx=@id_roltrx);IF @CONT=0 BEGIN
Insert Into  [db_seguridad].[tb_roltrx](id_roltrx,cod_rol,cod_trx,fechacreacionroltrx,fechamodificacion) Values(@id_roltrx,
@cod_rol,
@cod_trx,
@fechacreacionroltrx,
@fechamodificacion);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_seguridad].[sp_roltrx_update] ;
CREATE PROCEDURE [db_seguridad].[sp_roltrx_update](
@id_roltrx VARCHAR(8),
@cod_rol VARCHAR(20),
@cod_trx VARCHAR(20),
@fechacreacionroltrx DATE,
@fechamodificacion DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_seguridad].[tb_roltrx] set id_roltrx=(Case When  @id_roltrx IS NULL  then id_roltrx else id_roltrx end ),cod_rol=(Case When  @cod_rol IS NULL  then cod_rol else cod_rol end ),cod_trx=(Case When  @cod_trx IS NULL  then cod_trx else cod_trx end ),fechacreacionroltrx=(Case When  @fechacreacionroltrx IS NULL  then fechacreacionroltrx else fechacreacionroltrx end ),fechamodificacion=(Case When  @fechamodificacion IS NULL  then fechamodificacion else fechamodificacion end )
Where (id_roltrx= @id_roltrx or @id_roltrx = NULL) and
(cod_rol= @cod_rol or @cod_rol = NULL) and
(cod_trx= @cod_trx or @cod_trx = NULL) and
(fechacreacionroltrx= @fechacreacionroltrx or @fechacreacionroltrx = NULL) and
(fechamodificacion= @fechamodificacion or @fechamodificacion = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_roltrx];
CREATE PROCEDURE [db_seguridad].[sp_roltrx] (
@id_roltrx VARCHAR(8),
@cod_rol VARCHAR(20),
@cod_trx VARCHAR(20),
@fechacreacionroltrx DATE,
@fechamodificacion DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='01031' BEGIN  
EXEC [db_seguridad].[sp_roltrx_select] 
 @id_roltrx,
@cod_rol,
@cod_trx,
@fechacreacionroltrx,
@fechamodificacion
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01032' BEGIN  
EXEC [db_seguridad].[sp_roltrx_insert] 
@id_roltrx,
@cod_rol,
@cod_trx,
@fechacreacionroltrx,
@fechamodificacion
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01033' BEGIN  
EXEC [db_seguridad].[sp_roltrx_update] 
@id_roltrx,
@cod_rol,
@cod_trx,
@fechacreacionroltrx,
@fechamodificacion
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_seguridad].[sp_trx_select] ;
CREATE PROCEDURE [db_seguridad].[sp_trx_select](
@id_trx VARCHAR(8),
@cod_trx VARCHAR(20),
@nombre_trx VARCHAR(20),
@descripciontrx VARCHAR(500),
@fechadecreaciontrx DATE,
@estadotrx BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_trx,cod_trx,nombre_trx,descripciontrx,fechadecreaciontrx,estadotrx
From [db_seguridad].[tb_trx]
Where (id_trx= @id_trx or @id_trx = NULL) and
(cod_trx= @cod_trx or @cod_trx = NULL) and
(nombre_trx= @nombre_trx or @nombre_trx = NULL) and
(descripciontrx= @descripciontrx or @descripciontrx = NULL) and
(fechadecreaciontrx= @fechadecreaciontrx or @fechadecreaciontrx = NULL) and
(estadotrx= @estadotrx or @estadotrx = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_trx_insert] ;
CREATE PROCEDURE [db_seguridad].[sp_trx_insert](
@id_trx VARCHAR(8),
@cod_trx VARCHAR(20),
@nombre_trx VARCHAR(20),
@descripciontrx VARCHAR(500),
@fechadecreaciontrx DATE,
@estadotrx BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_seguridad].[tb_trx] Where id_trx=@id_trx);IF @CONT=0 BEGIN
Insert Into  [db_seguridad].[tb_trx](id_trx,cod_trx,nombre_trx,descripciontrx,fechadecreaciontrx,estadotrx) Values(@id_trx,
@cod_trx,
@nombre_trx,
@descripciontrx,
@fechadecreaciontrx,
@estadotrx);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_seguridad].[sp_trx_update] ;
CREATE PROCEDURE [db_seguridad].[sp_trx_update](
@id_trx VARCHAR(8),
@cod_trx VARCHAR(20),
@nombre_trx VARCHAR(20),
@descripciontrx VARCHAR(500),
@fechadecreaciontrx DATE,
@estadotrx BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_seguridad].[tb_trx] set id_trx=(Case When  @id_trx IS NULL  then id_trx else id_trx end ),cod_trx=(Case When  @cod_trx IS NULL  then cod_trx else cod_trx end ),nombre_trx=(Case When  @nombre_trx IS NULL  then nombre_trx else nombre_trx end ),descripciontrx=(Case When  @descripciontrx IS NULL  then descripciontrx else descripciontrx end ),fechadecreaciontrx=(Case When  @fechadecreaciontrx IS NULL  then fechadecreaciontrx else fechadecreaciontrx end ),estadotrx=(Case When  @estadotrx IS NULL  then estadotrx else estadotrx end )
Where (id_trx= @id_trx or @id_trx = NULL) and
(cod_trx= @cod_trx or @cod_trx = NULL) and
(nombre_trx= @nombre_trx or @nombre_trx = NULL) and
(descripciontrx= @descripciontrx or @descripciontrx = NULL) and
(fechadecreaciontrx= @fechadecreaciontrx or @fechadecreaciontrx = NULL) and
(estadotrx= @estadotrx or @estadotrx = NULL)  
  END 

DROP PROCEDURE [db_seguridad].[sp_trx];
CREATE PROCEDURE [db_seguridad].[sp_trx] (
@id_trx VARCHAR(8),
@cod_trx VARCHAR(20),
@nombre_trx VARCHAR(20),
@descripciontrx VARCHAR(500),
@fechadecreaciontrx DATE,
@estadotrx BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='01034' BEGIN  
EXEC [db_seguridad].[sp_trx_select] 
 @id_trx,
@cod_trx,
@nombre_trx,
@descripciontrx,
@fechadecreaciontrx,
@estadotrx
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01035' BEGIN  
EXEC [db_seguridad].[sp_trx_insert] 
@id_trx,
@cod_trx,
@nombre_trx,
@descripciontrx,
@fechadecreaciontrx,
@estadotrx
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01036' BEGIN  
EXEC [db_seguridad].[sp_trx_update] 
@id_trx,
@cod_trx,
@nombre_trx,
@descripciontrx,
@fechadecreaciontrx,
@estadotrx
,@trx,
@resultado OUT;
  END 
END

DROP PROCEDURE [db_traza].[sp_traza_select] ;
CREATE PROCEDURE [db_traza].[sp_traza_select](
@id_traza INT,
@id_trx INT,
@id_login INT,
@accion VARCHAR(20),
@log DATE,
@fechalog DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_traza,id_trx,id_login,accion,log,fechalog
From [db_traza].[tb_traza]
Where (id_traza= @id_traza or @id_traza = NULL) and
(id_trx= @id_trx or @id_trx = NULL) and
(id_login= @id_login or @id_login = NULL) and
(accion= @accion or @accion = NULL) and
(log= @log or @log = NULL) and
(fechalog= @fechalog or @fechalog = NULL)  
  END 

DROP PROCEDURE [db_traza].[sp_traza_insert] ;
CREATE PROCEDURE [db_traza].[sp_traza_insert](
@id_traza INT,
@id_trx INT,
@id_login INT,
@accion VARCHAR(20),
@log DATE,
@fechalog DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_traza].[tb_traza] Where id_traza=@id_traza);IF @CONT=0 BEGIN
Insert Into  [db_traza].[tb_traza](id_traza,id_trx,id_login,accion,log,fechalog) Values(@id_traza,
@id_trx,
@id_login,
@accion,
@log,
@fechalog);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

DROP PROCEDURE [db_traza].[sp_traza_update] ;
CREATE PROCEDURE [db_traza].[sp_traza_update](
@id_traza INT,
@id_trx INT,
@id_login INT,
@accion VARCHAR(20),
@log DATE,
@fechalog DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_traza].[tb_traza] set id_traza=(Case When  @id_traza IS NULL  then id_traza else id_traza end ),id_trx=(Case When  @id_trx IS NULL  then id_trx else id_trx end ),id_login=(Case When  @id_login IS NULL  then id_login else id_login end ),accion=(Case When  @accion IS NULL  then accion else accion end ),log=(Case When  @log IS NULL  then log else log end ),fechalog=(Case When  @fechalog IS NULL  then fechalog else fechalog end )
Where (id_traza= @id_traza or @id_traza = NULL) and
(id_trx= @id_trx or @id_trx = NULL) and
(id_login= @id_login or @id_login = NULL) and
(accion= @accion or @accion = NULL) and
(log= @log or @log = NULL) and
(fechalog= @fechalog or @fechalog = NULL)  
  END 

DROP PROCEDURE [db_traza].[sp_traza];
CREATE PROCEDURE [db_traza].[sp_traza] (
@id_traza INT,
@id_trx INT,
@id_login INT,
@accion VARCHAR(20),
@log DATE,
@fechalog DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='02037' BEGIN  
EXEC [db_traza].[sp_traza_select] 
 @id_traza,
@id_trx,
@id_login,
@accion,
@log,
@fechalog
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='02038' BEGIN  
EXEC [db_traza].[sp_traza_insert] 
@id_traza,
@id_trx,
@id_login,
@accion,
@log,
@fechalog
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='02039' BEGIN  
EXEC [db_traza].[sp_traza_update] 
@id_traza,
@id_trx,
@id_login,
@accion,
@log,
@fechalog
,@trx,
@resultado OUT;
  END 
END



