select  * from dbo.Info_datos_prestamo

SELECT * FROM Aplication_Train_Test

ALTER TABLE Aplication_Train_Test ADD CONSTRAINT FK_ATRAIN_IFOPRESTAMO  FOREIGN KEY (id_info_prestamo) REFERENCES Info_datos_prestamo(ID)

DROP PROCEDURE InsertarInfo_prestamo;

CREATE PROCEDURE InsertarInfo_prestamo
@Weekday_app_Pro_start VARCHAR(MAX),
@Hour_app_proces VARCHAR(MAX)
AS
	BEGIN
 
    INSERT INTO dbo.Info_datos_prestamo
        (
			Weekday_app_process_start,
			Hour_app_process
		)
         VALUES
               (
				 @Weekday_app_Pro_start
				 ,@Hour_app_proces		    
			   )
END;

delete Info_datos_prestamo

EXEC InsertarInfo_prestamo '1','2';

CREATE PROCEDURE Insert_contrato
@Descripcion VARCHAR(MAX)

AS
	BEGIN
 
    INSERT INTO dbo.Contrato
        (
		Descripcion
		)
         VALUES
               (
				 @Descripcion				     
			   )
END;
select * from Contrato
EXEC Insert_contrato 'Revolving loans';



select * from Cliente

CREATE PROCEDURE Insert_cliente
@car VARCHAR(MAX),
@genero VARCHAR(MAX),
@hijos VARCHAR(MAX),
@edu VARCHAR(MAX),
@fstatus VARCHAR(MAX),
@housing VARCHAR(MAX),
@Ocupacion VARCHAR(MAX),
@ingreso int

AS
	BEGIN
 
    INSERT INTO dbo.Cliente
        (
		Flag_Own_car,
		Cod_Genero,
		Cant_Hijos,
		Name_Education_Type,
		Name_Family_Status,
		Name_Housing_Type,
		Occupation_Type,
		Id_Ingresos
		)
         VALUES
               (
				 @car
				 ,@genero
				 	,@hijos	
					,@edu	
					,@fstatus	
					, @housing  
					 , @Ocupacion
					, @ingreso
			   )
END;


exec Insert_cliente '','','','','','','',1;