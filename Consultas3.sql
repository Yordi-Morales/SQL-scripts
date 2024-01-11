CREATE VIEW Consulta_Educacion AS

SELECT 
cl.Name_Education_Type as Educacion,
ic.Income_Total_AMT as Ingreso_total,
ic.AMT_Credit as Credito,
ic.AMT_Annuality as Anualidades,
ic.Name_Income_Type as trabajo


FROM 
  Aplication_Train_Test att,
  Cliente cl, 
   Ingreso_Cliente ic


WHERE att.id_Cliente=cl.ID  and cl.Id_Ingresos=ic.ID 


select * from Consulta_Educacion where Educacion like 'Academic degree'


  select * from Consulta_Genero

 
  select Name_Education_Type,COUNT(1) from Cliente group by Name_Education_Type --
  select * from Bureau
   select * from Detalle_Bureau
   select * from Ingreso_Cliente
   --devuelve la educacion del cliente junto a sus ingresos y en que trabaja


   select * from Aplication_Train_Test 

   select * from Info_datos_prestamo
    select * from Previus_aplication
	select * from Datos_Contrato

	CREATE VIEW Consulta_Mes AS

SELECT 
ip.Weekday_app_process_start as Dia_inicio,
ip.Hour_app_process as Hora_inicio,
dc.Name_Contract_status as Estado,
dc.Name_paymet_type as Tipo_Pago,
dc.Name_portafolio as Nombre_Portafolio,
ic.Income_Total_AMT as Ingreo_Total_Cliente




FROM 
  Aplication_Train_Test att,
   Info_datos_prestamo ip,
   Datos_Contrato dc,
   Previus_aplication pa,
   Cliente cl,
    Ingreso_Cliente ic

WHERE  att.id_info_prestamo=ip.ID and att.SK_ID_CURR=pa.Id_curr and pa.id_datos_contrato=dc.ID and ic.ID=att.id_Cliente and ic.ID=cl.Id_Ingresos and 
ip.Weekday_app_process_start !='1' and ip.Weekday_app_process_start != '2'  and ip.Weekday_app_process_start != '3'



select * from Consulta_Mes where Dia_inicio like 'WEDNESDAY'

 select Weekday_app_process_start from Info_datos_prestamo  group by Weekday_app_process_start

--devuelve los contratos segun su dia y hora e ingreso del cliente



----ultima consulta
 select Name_Client_Type from Previus_aplication group by Name_Client_Type
   select * from Aplication_Train_Test 

   select * from Info_datos_prestamo
    select * from Previus_aplication
	select * from Datos_Contrato
	select * from Cliente

	select * from  Pos_cash_balance
	select * from Detalle_cash_balance

	CREATE VIEW Consulta_Tipo_Cliente AS

SELECT 
pa.Name_Client_Type as Tipo_cliente,
pa.Name_goods_category as Categoria_Bienes,
pa.name_product_type as Tipo_producto,
cl.ID as Id_Cliente,
dpcb.Months_Balance as Balance_mes






FROM 
  Aplication_Train_Test att,
   Previus_aplication pa,
   Cliente cl,
   Pos_cash_balance pcb,
   Detalle_cash_balance dpcb
    

WHERE  att.id_Cliente=cl.ID and att.SK_ID_CURR =pa.Id_curr and pcb.id_prev=pa.Id_previus_aplication and dpcb.ID=pcb.id_detalle_cash_balance

--devuelve el tipo cliete el tipo de bien y el tipo de producto juento al id del cliente devuelve balance del la persona


select * from Consulta_Tipo_Cliente where Tipo_cliente like 'Cash through the bank'