CREATE PROCEDURE Insert_Ingreso_cliente
@income_total VARCHAR(MAX),
@amt_credit VARCHAR(MAX),
@amtanualiti VARCHAR(MAX),
@amtgoodprice VARCHAR(MAX),
@nameincome VARCHAR(MAX)


AS
	BEGIN
 
    INSERT INTO dbo.Ingreso_Cliente
        (
		Income_Total_AMT
		,AMT_Credit
		,AMT_Annuality
		,AMT_Goods_Price
		,Name_Income_Type
		)
         VALUES
               (
				@income_total
				,@amt_credit
				,@amtanualiti
				,@amtgoodprice
				,@nameincome
			   )
END;


exec Insert_Ingreso_cliente '','','','','';

select * from Ingreso_Cliente;


ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_IngreCliente  FOREIGN KEY (Id_Ingresos) REFERENCES Ingreso_Cliente(ID)
