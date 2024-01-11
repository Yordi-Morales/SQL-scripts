--//vista//--
drop VIEW Consulta_Genero


CREATE VIEW Consulta_Contrato AS

SELECT 
 cl.Name_Education_Type as Educacion,
 cl.Cant_Hijos ,
 cl.Flag_Own_car as Tiene_Carro,
 pa.AMT_Aplication as Saldo_aplicacion,
 dc.Name_Contract_status as Estado_contrato,
 dc.Name_portafolio as Nombre_Portafolio




FROM 
  Aplication_Train_Test att,
  Cliente cl, 
  Previus_aplication pa,
  Datos_Contrato dc

WHERE 
  att.id_Cliente=cl.ID and att.SK_ID_CURR= pa.Id_curr and dc.ID=pa.id_datos_contrato

  --consulta
  select * FROM Consulta_Contrato where Estado_contrato like  'Approved'
  ------FIN  
  select * from Consulta_Genero

  select * from Aplication_Train_Test
  select * from Cliente cl--
  select * from Bureau
   select * from Detalle_Bureau

   select * from Previus_aplication
   select * from Datos_Contrato
   select  * from 


   --//devuelve datos de cliente, junto al tipo de cliente,junto al monto de la aplicacion la forma de pago  y el tipo de bien.
   --devuelve tambien el estado y nombre del portafolio... consulta sobre contrato


   -- select * from Consulta_Genero where Genero like'F'