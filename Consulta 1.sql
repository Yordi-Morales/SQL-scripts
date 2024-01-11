--//vista//--
drop VIEW Consulta_Genero


CREATE VIEW Consulta_Genero AS

SELECT 
att.Name_Cont as Tipo_Prestamo,
dbu.Credit_active  as Estado_Credito,
dbu.amt_credit_sum  as Credito_Dado,
 cl.Cod_Genero AS Genero

FROM 
  Aplication_Train_Test att,
  Cliente cl,  
  Bureau b,
  Detalle_Bureau dbu


WHERE 
  att.id_Cliente=cl.ID and att.SK_ID_CURR = b.id_curr and b.id_detalle_bureau=dbu.ID 


  select * from Consulta_Genero

  select * from Aplication_Train_Test
  select * from Cliente cl--
  select * from Bureau
   select * from Detalle_Bureau
   select * from Ingreso_Cliente

  --devuelve como fue el prestamo de aplication train, El estado del credito // tambien credito dado y el limite de credito y datos del cliente


  delete from Info_datos_prestamo where Weekday_app_process_start='3'


  select * from Consulta_Genero where Genero like'F'


  SELECT 
--att.Name_Cont as Tipo_Prestamo,
--dbu.Credit_active  as Estado_Credito,
dbu.amt_credit_sum  as Credito_Dado,
 cl.ID as Id_Cliente,
 cl.Cod_Genero AS Genero
 

FROM 
  Aplication_Train_Test att
  Inner join Cliente cl on cl.ID like att.id_Cliente and cl.Cod_Genero like 'F'
  inner join Bureau b on b.id_curr like att.SK_ID_CURR
  inner join  Detalle_Bureau dbu on b.id_detalle_bureau like dbu.ID


