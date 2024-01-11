
CREATE TABLE Aplication_Train_Test
(
SK_ID_CURR INT PRIMARY KEY,
Targets varchar(255) ,
Name_Cont varchar(255) ,
id_Cliente int,
id_contrato int ,
id_info_prestamo int

)




CREATE TABLE Contrato
(
ID int IDENTITY(1,1) PRIMARY KEY,
Descripcion varchar(MAX) NOT NULL
)

CREATE TABLE Info_datos_prestamo
(
ID int IDENTITY(1,1) PRIMARY KEY,
Weekday_app_process_start varchar(255) ,
Hour_app_process varchar(255),
)


CREATE TABLE Ingreso_Cliente
(
ID int IDENTITY(1,1) PRIMARY KEY,
Income_Total_AMT varchar(255) ,
AMT_Credit varchar(255),
AMT_Annuality varchar(255),
AMT_Goods_Price varchar(255),
Name_Income_Type varchar(255)
)

CREATE TABLE Cliente
(
ID int IDENTITY(1,1) PRIMARY KEY,
Flag_Own_car varchar(255) ,
Cod_Genero varchar(255),
Cant_Hijos varchar(255),
Name_Education_Type varchar(255),
Name_Family_Status varchar(255),
Name_Housing_Type varchar(255),
Occupation_Type varchar(255),
Id_Ingresos int,
)
-------------------------previus

CREATE TABLE Previus_aplication
(
Id_previus_aplication INT PRIMARY KEY,
Id_curr int not null,
AMT_Aplication varchar(255) ,
Name_Client_Type varchar(255) ,
id_datos_contrato int,
id_contrato int ,
Name_goods_category varchar(255) ,
name_product_type varchar(255) ,
)
CREATE TABLE Datos_Contrato
(
ID int IDENTITY(1,1) PRIMARY KEY,
Name_Contract_status varchar(255) ,
Name_paymet_type varchar(255) ,
Code_reject_reason varchar(255) ,
Name_portafolio varchar(255) 
)
-----------------------------------Installments payments
CREATE TABLE Installments_payments
(
ID int IDENTITY(1,1) PRIMARY KEY,
id_prev int not null,
id_curr int not null,
id_datos_paymet int not null,
AMT_instalment varchar(255) ,
AMT_payment varchar(255) ,
)
CREATE TABLE Datos_Payment
(
ID int IDENTITY(1,1) PRIMARY KEY,
Num_instalmet_version varchar(255) ,
Num_instalmet_number varchar(255) ,
)
------------------------------Credit card balance
CREATE TABLE Credit_card_balance
(
ID int IDENTITY(1,1) PRIMARY KEY,
id_prev int not null,
id_curr int not null,
id_drawings int ,
id_detalle_monto_tarjeta int,
Name_contract_status varchar(255) ,
)
CREATE TABLE Drawings
(
ID int IDENTITY(1,1) PRIMARY KEY,
AMT_drawings_amt_current varchar(255) ,
AMT_drawing_current varchar(255) ,
AMT_drawing varchar(255) ,
AMT_drawing_other_currents varchar(255) ,
AMT_drawing_pos_current varchar(255) ,
)
CREATE TABLE Detalle_Monto_tarjeta
(
ID int IDENTITY(1,1) PRIMARY KEY,
AMT_inst_min_regularity varchar(255) ,
AMT_paymet_current varchar(255) ,
AMT_paymet_total_current varchar(255) ,
AMT_recivable_principal varchar(255) ,
AMT_recivable varchar(255) ,
ammont_total_recible varchar(255) ,
Monts_balance varchar(255) ,
AMT_balance varchar(255) ,
AMT_limit_actual varchar(255) 
)
-----------------------------Pos cash balance
CREATE TABLE Pos_cash_balance
(
ID int IDENTITY(1,1) PRIMARY KEY,
id_prev int not null,
id_curr int not null,
id_detalle_cash_balance int ,
Name_con1sk_dep varchar(255) 
)
CREATE TABLE Detalle_cash_balance
(
ID int IDENTITY(1,1) PRIMARY KEY,
Months_Balance varchar(255) ,
CNT_instalment varchar(255) ,
CNT_instalmets_future varchar(255) ,
SK_DPD_DEF varchar(255) 
)
----------------------------------------Bureau
CREATE TABLE Bureau
(
ID int IDENTITY(1,1) PRIMARY KEY,
id_curr int not null,
id_detalle_bureau int 
)
CREATE TABLE Detalle_Bureau
(
ID int IDENTITY(1,1) PRIMARY KEY,
Credit_active varchar(255) ,
credit_currence varchar(255) ,
Months_Balance varchar(255) ,
days_credit varchar(255) ,
credit_days_overdue varchar(255) ,
days_credit_endate varchar(255) ,
days_enddate_fact varchar(255) ,
Amt_credit_max_overdue varchar(255) ,
cnt_credit_prolong varchar(255) ,
amt_credit_sum varchar(255) ,
amt_credit_sum_debt varchar(255) ,
amt_credit_sum_limit varchar(255) ,
amt_credit_sum_overdue varchar(255) ,
credit_type varchar(255) ,
days_credit_update varchar(255) 
)

-----------------------------Bureau Balance
CREATE TABLE Bureau_Balance
(
ID int IDENTITY(1,1) PRIMARY KEY,
id_Bureau int not null,
Months_Balance varchar(255),
status varchar(255),

)


