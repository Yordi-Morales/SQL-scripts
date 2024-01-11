select Id_previus_aplication from Previus_aplication where id_datos_contrato=18
select * from Datos_Contrato
select * from Previus_aplication order by id_datos_contrato asc

select * from Aplication_Train_Test



create procedure Insert_Datos_contrato
@name_contract varchar(max),
@name_paymen varchar(max),
@code_rejec_reason varchar(max),
@name_portafolio varchar(max)
as
	begin
	insert into Datos_Contrato(Name_Contract_status,Name_paymet_type,Code_reject_reason,Name_portafolio)
	values(@name_contract,@name_paymen,@code_rejec_reason,@name_portafolio);
	end;

	exec Insert_Datos_contrato 'Name_Contract_status','Name_paymet_type','Code_reject_reason','Name_portafolio';

	
ALTER TABLE Previus_aplication ADD CONSTRAINT FK_iddcon_idcontra FOREIGN KEY (id_datos_contrato) REFERENCES Datos_Contrato(id)


drop table  Previus_aplication

CREATE TABLE Previus_aplication
(
Id_previus_aplication INT PRIMARY KEY,
Id_curr int not null,
AMT_Aplication varchar(255) ,
Name_Client_Type varchar(255) ,
id_datos_contrato int,
Name_goods_category varchar(255) ,
name_product_type varchar(255) ,
)
ALTER TABLE Previus_aplication ADD CONSTRAINT FK_Idtrain_idcurr FOREIGN KEY (Id_curr) REFERENCES Aplication_Train_Test(SK_ID_CURR)
ALTER TABLE Aplication_Train_Test ADD CONSTRAINT FK_cliente_idcliente FOREIGN KEY (id_Cliente) REFERENCES Cliente(ID)

----------INSTALMMENT PAYMET

create procedure Insert_Intalmet_paymet
@id_prev int ,
@id_curr int ,
@id_dat_pya int ,
@amt_instalmet varchar(100),
@amt_payment varchar(100)
as
	begin
	insert into Installments_payments(id_prev,id_curr,id_datos_paymet,AMT_instalment,AMT_payment)
	values(@id_prev,@id_curr,@id_dat_pya,@amt_instalmet,@amt_payment);
	end;

	exec Insert_Intalmet_paymet 1,2,3,'','';

	-------datos paymet
	create procedure Insert_datos_paymet
@instalmet_VERSION varchar(100),
@INSTALMET_NUMBER varchar(100)
as
	begin
	insert into Datos_Payment(Num_instalmet_version,Num_instalmet_number)
	values(@instalmet_VERSION,@INSTALMET_NUMBER);
	end;
	EXEC Insert_datos_paymet '','';

	SELECT * FROM Installments_payments ORDER BY id_datos_paymet;
	SELECT * FROM Datos_Payment;
	ALTER TABLE Installments_payments ADD CONSTRAINT FK_datosP_Datospayment FOREIGN KEY (id_datos_paymet) REFERENCES Datos_Payment(ID)
	ALTER TABLE Installments_payments ADD CONSTRAINT FK_IP_PE FOREIGN KEY (id_prev) REFERENCES Previus_aplication(Id_previus_aplication)
	ALTER TABLE Installments_payments ADD CONSTRAINT FK_IP_AT FOREIGN KEY (id_curr) REFERENCES Aplication_Train_Test(SK_ID_CURR)

	----------credit car
	create procedure Insert_creditcar_balance
	@id_pre int,
	@id_curr int,
	@id_drawing int ,
	@id_detalle_monto int,
	@name_contrac varchar(max)
	as
		begin
		insert into Credit_card_balance(id_prev,id_curr,id_drawings,id_detalle_monto_tarjeta,Name_contract_status)
		values(@id_pre,@id_curr,@id_drawing,@id_detalle_monto,@name_contrac);
		end;
		exec Insert_creditcar_balance 0,0,0,0,'';

--------------drawings
create procedure Insert_drawing
@amt_dra_amt_curent varchar(max),
@amt_dra_curent varchar(max),
@amt_dra varchar(max),
@amt_dra_other varchar(max),
@amt_dra_pos_curent varchar(max)
as
	begin 
	insert into Drawings(AMT_drawings_amt_current,AMT_drawing_current,AMT_drawing,AMT_drawing_other_currents,AMT_drawing_pos_current)
	values(@amt_dra_amt_curent,@amt_dra_curent,@amt_dra,@amt_dra_other,@amt_dra_pos_curent)
	end;

exec Insert_drawing 'AMT_drawings_amt_current','AMT_drawing_current','AMT_drawing','AMT_drawing_other_currents','AMT_drawing_pos_current';

--------- detalle monto tarjeta
create procedure Insert_Detalle_monto_tarjeta
@amt_inst_min_regu varchar(max),
@amt_paymet_current varchar(max),
@amt_pay_total_cu varchar(max),
@amt_recivable_principal varchar(max),
@amt_recivable varchar(max),
@amt_total_recivible varchar(max),
@monts_balance varchar(max),
@amt_balance varchar(max),
@amt_limit_actual varchar(max)
as
	begin 
	insert into Detalle_Monto_tarjeta(AMT_inst_min_regularity,AMT_paymet_current,AMT_paymet_total_current,
	AMT_recivable_principal,AMT_recivable,ammont_total_recible, Monts_balance,AMT_balance,AMT_limit_actual)
	values(@amt_inst_min_regu,@amt_paymet_current,@amt_pay_total_cu,@amt_recivable_principal,@amt_recivable,
	@amt_total_recivible,@monts_balance,@amt_balance,@amt_limit_actual)
	end;

	select * from Detalle_Monto_tarjeta
	exec Insert_Detalle_monto_tarjeta '','','','','','','','','';

	select * from Credit_card_balance;
	select * from Drawings;
	select * from Detalle_Monto_tarjeta;

	
	ALTER TABLE Credit_card_balance ADD CONSTRAINT FK_CCB_PE FOREIGN KEY (id_prev) REFERENCES Previus_aplication(Id_previus_aplication)
	ALTER TABLE Credit_card_balance ADD CONSTRAINT FK_ccb_AT FOREIGN KEY (id_curr) REFERENCES Aplication_Train_Test(SK_ID_CURR)
	ALTER TABLE Credit_card_balance ADD CONSTRAINT FK_id_drawings FOREIGN KEY (id_drawings) REFERENCES Drawings(ID)
	ALTER TABLE Credit_card_balance ADD CONSTRAINT FK_id_detalle_monto FOREIGN KEY (id_drawings) REFERENCES Detalle_Monto_tarjeta(ID)

	-----------pos cash balance
	create procedure Insert_pos_cash_balance
	@id_prev int,
	@id_curr int,
	@id_detalle_cash int,
	@name_con1sk varchar(max)
	as
		begin
		insert into Pos_cash_balance(id_prev,id_curr,id_detalle_cash_balance,Name_con1sk_dep)
		values(@id_prev,@id_curr,@id_detalle_cash,@name_con1sk);
		end;
		exec Insert_pos_cash_balance '','','','';

	-------------detalle cash balance
	create procedure Insert_detalle_cash_balance
	@months_balance varchar(max),
	@cnt_instalment varchar(max),
	@cnt_instalment_f varchar(max),
	@sk_dpd varchar(300)
	as
		begin
		insert into Detalle_cash_balance(Months_Balance,CNT_instalment,CNT_instalmets_future,SK_DPD_DEF)
		values(@months_balance,@cnt_instalment,@cnt_instalment_f,@sk_dpd);
		end;

		exec Insert_detalle_cash_balance '','','','';
		SELECT * FROM Detalle_cash_balance;
		SELECT * FROM Pos_cash_balance;
ALTER TABLE Pos_cash_balance ADD CONSTRAINT FK_pcb_PE FOREIGN KEY (id_prev) REFERENCES Previus_aplication(Id_previus_aplication)
	ALTER TABLE Pos_cash_balance ADD CONSTRAINT FK_Poschas_AT FOREIGN KEY (id_curr) REFERENCES Aplication_Train_Test(SK_ID_CURR)
	ALTER TABLE Pos_cash_balance ADD CONSTRAINT FK_Poschas_detalle FOREIGN KEY (id_detalle_cash_balance) REFERENCES Detalle_cash_balance(ID)

	----------Bureau
	drop procedure Insert_bureau;
		create procedure Insert_bureau

		@id int,
		@id_curr int,
		@id_detalle_bu int
		as
			begin
			insert into Bureau(ID,id_curr,id_detalle_bureau)
			values(@id,@id_curr,@id_detalle_bu);
			end;

			exec Insert_bureau '','';

			select * from Bureau;

----------datelle bureau
create procedure Insert_Detalle_Bureau
			@Credit_active varchar(max)--
           ,@credit_currence varchar(max)--
           ,@Months_Balance varchar(max)--
           ,@days_credit varchar(max)--
           ,@credit_days_overdue varchar(max)--
           ,@days_credit_endate varchar(max)--
           ,@days_enddate_fact varchar(max)--
           ,@Amt_credit_max_overdue varchar(max)--
           ,@cnt_credit_prolong varchar(max)--
           ,@amt_credit_sum varchar(max)--
           ,@amt_credit_sum_debt varchar(max)--
           ,@amt_credit_sum_limit varchar(max)--
           ,@amt_credit_sum_overdue varchar(max)--
           ,@credit_type varchar(max)--
           ,@days_credit_update varchar(max)--
		   as
					begin
					INSERT INTO Detalle_Bureau
           (Credit_active
           ,credit_currence
           ,Months_Balance
           ,days_credit
           ,credit_days_overdue
           ,days_credit_endate
           ,days_enddate_fact
           ,Amt_credit_max_overdue
           ,cnt_credit_prolong
           ,amt_credit_sum
           ,amt_credit_sum_debt
           ,amt_credit_sum_limit
           ,amt_credit_sum_overdue
           ,credit_type
           ,days_credit_update)
     VALUES(@Credit_active,@credit_currence,@Months_Balance,@days_credit,@credit_days_overdue,
	 @days_credit_endate,@days_enddate_fact,@Amt_credit_max_overdue,@cnt_credit_prolong,@amt_credit_sum,
	 @amt_credit_sum_debt,@amt_credit_sum_limit,@amt_credit_sum_overdue,@credit_type,@days_credit_update);
	 end;

	 exec Insert_Detalle_Bureau 'Credit_active','credit_currence','Months_Balance','days_credit','credit_days_overdue','days_credit_endate','days_enddate_fact','Amt_credit_max_overdue','cnt_credit_prolong','amt_credit_sum','amt_credit_sum_debt','amt_credit_sum_limit','amt_credit_sum_overdue','credit_type','days_credit_update';

			select * from Bureau;
			select * from Detalle_Bureau;

			ALTER TABLE Bureau ADD CONSTRAINT FK_bureau_AT FOREIGN KEY (id_curr) REFERENCES Aplication_Train_Test(SK_ID_CURR)
			ALTER TABLE Bureau ADD CONSTRAINT FK_bureau_Detalle FOREIGN KEY (id_detalle_bureau) REFERENCES Detalle_Bureau(ID)

			select * from Bureau

			--------------bureau balance
			create procedure Insert_Bureau_Balance
			@id_bureau varchar(max),
			@Months_balance varchar(max),
			@status varchar(max)
			as
				begin
				insert into Bureau_Balance(id_Bureau,Months_Balance,status)
				values(@id_bureau,@Months_balance,@status);
				end;



				exec Insert_Bureau_Balance '','','';
				SELECT * FROM Bureau_Balance;

			ALTER TABLE Bureau_Balance ADD CONSTRAINT FK_Balancebureau_Bureau FOREIGN KEY (id_Bureau) REFERENCES Bureau(ID)