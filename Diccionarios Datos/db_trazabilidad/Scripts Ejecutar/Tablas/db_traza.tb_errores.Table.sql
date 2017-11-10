drop table db_traza.tb_errores
CREATE TABLE db_traza.tb_errores(
uiderror nvarchar(36) not null default(newid()),
codigo nvarchar(20) not null,
mensaje NVARCHAR(MAX) NOT NULL,
referencia NVARCHAR(100) NOT NULL,
estadoexistencia VARCHAR(1) NOT NULL DEFAULT('A'),
);

insert into db_traza.tb_errores(codigo,mensaje,referencia)VALUES ('00001','Se ha creado con éxito el registro.','');
insert into db_traza.tb_errores(codigo,mensaje,referencia)VALUES ('00002','Se han guardado los cambios.','');
insert into db_traza.tb_errores(codigo,mensaje,referencia)VALUES ('00003','Se ha eliminado el registro.','');
insert into db_traza.tb_errores(codigo,mensaje,referencia)VALUES ('00004','No se pudo crear el registro.','');
insert into db_traza.tb_errores(codigo,mensaje,referencia)VALUES ('00005','No se pudo guardar los cambios.','');
insert into db_traza.tb_errores(codigo,mensaje,referencia)VALUES ('00006','Error desconocido.','');

select * from db_traza.tb_errores;


