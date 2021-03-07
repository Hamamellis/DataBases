
/**************** FUNCIONARIO ****************/
CREATE TABLE FUNCIONARIO (
    func_matricula INTEGER PRIMARY KEY,
    func_nome VARCHAR (50) NOT NULL,
    func_sexo CHAR (1),
    func_datanascimento DATE NOT NULL,
    func_cpf CHAR(11) UNIQUE NOT NULL,
    func_salario SMALLMONEY,
    func_email VARCHAR (25),
    func_telefone VARCHAR(15),
    func_dataadmissao DATE DEFAULT (SYSDATETIME()),
    func_datademissao DATE,
    func_status BIT DEFAULT (1),
	func_cargo VARCHAR (20),
    func_codigosupervisor INTEGER, FOREIGN KEY REFERENCES FUNCIONARIO(func_matricula),
    dt_insert_linha SMALLDATETIME DEFAULT (SYSDATETIME())
);
GO;

INSERT INTO FUNCIONARIO (func_nome, func_sexo, func_datanascimento, func_cpf, func_salario, func_email, func_telefone, func_dataadmissao, func_datademissao, func_status, func_cargo, func_codigosupervisor )
VALUES ('JOSELITO F. M.', 'M', '1980-05-15', '11122244401', 4560, 'JOSELITOFM@LOJAXYZ.COM','81988880000', '2000-04-11', NULL, 1, 'SUPERVISOR', NULL)

INSERT INTO FUNCIONARIO (func_nome, func_sexo, func_datanascimento, func_cpf, func_salario, func_email, func_telefone, func_dataadmissao, func_datademissao, func_status, func_cargo, func_codigosupervisor )
VALUES   ('DIANA S. S.', 'F', '1990-12-02', '11122244402', 1800, 'DIANASS@LOJAXYZ.COM','21988880001', '2010-06-06', NULL, 1, 'VENDEDOR', 1)
		,('LUCAS L. S.', 'M', '1995-09-15', '11122244403', 1900, 'LUCASLS@LOJAXYZ.COM','83988880002', '2019-07-01', DATEADD(DAY,1,GETDATE()), 0, 'VENDEDOR', 1)

INSERT INTO FUNCIONARIO (func_nome, func_sexo, func_datanascimento, func_cpf, func_salario, func_email, func_telefone, func_cargo, func_codigosupervisor )
VALUES ('LUCIANA G. R.', 'F', '2000-05-09', '11122244404', 1600, 'LUCIANAGR@LOJAXYZ.COM','21988880003', 'VENDEDOR', 1)


/**************** TRANSPORTADORA ****************/
CREATE TABLE TRANSPORTADORA (
    transp_codigo INTEGER PRIMARY KEY IDENTITY,
    transp_nome VARCHAR (40) NOT NULL,
    transp_telefone VARCHAR (15),
    transp_cnpj VARCHAR (14) UNIQUE NOT NULL,
    transp_status BIT DEFAULT (1),
	dt_insert_linha SMALLDATETIME DEFAULT (SYSDATETIME())
);
GO

INSERT INTO TRANSPORTADORA(transp_nome, transp_telefone, transp_cnpj, transp_status )
VALUES ('TRANSP ENTREGAS' , '11988887777' , '1122233344455' , 1), ('SPEED ENTREGAS' , '81999991111' , '2233344455566' , 1),
		('RAPIDINHO ENTREGAS' , '31911112222' , '3344455566677' , 1),('LTS DEVILERY' , '51933336666' , '4455566677788' , 1),
		('SUPER RAPIDO ENTREGAS' , '21933334444' , '5566677788899' , 0),('GO ENTREGAS LTDA' , '82922221111' , '6677788899911' , 1),
		('RUNNING DELIVERY' ,  '83955556666', '7788899911122' , 1),('BK FASTER DELIVERY' , '61955557777' , '8899911122233' , 0)
GO


/**************** FORNECEDOR ****************/
CREATE TABLE FORNECEDOR (
    forn_codigo INTEGER PRIMARY KEY IDENTITY,
    forn_nome VARCHAR (40) NOT NULL,
    forn_telefone VARCHAR (15),
    forn_cnpj VARCHAR(14) UNIQUE NOT NULL,
    forn_status BIT DEFAULT (1),
	dt_insert_linha SMALLDATETIME DEFAULT (SYSDATETIME())
);
GO

INSERT INTO FORNECEDOR(forn_nome, forn_telefone, forn_cnpj, forn_status )
VALUES ('SAMSUNG' , '11977778888' , '5511222333444' , 1), ('ABC MATERIAIS ESPORTIVOS' , '81111199999' , '6622333444555' , 0),
		('LG' , '31922221111' , '7733444555666' , 1),('DELL' , '51966663333' , '8844555666777' , 1),
		('JBL' , '21944443333' , '9955666777888' , 1),('PIRELLI' , '82911112222' , '1166777888999' , 1),
		('PET PRODUTOS LTDA' ,  '83966665555', '2277888999111' , 1),('FITNESS EQUIPAMENTOS LTDA' , '61977775555' , '3388999111222' , 0),
		('BRASTEMP' , '64977775555' , '3388999111333' , 1), ('MONDIAL' , '69977775555' , '3388999111444' , 1)
GO

/**************** CATEGORIA ****************/
CREATE TABLE CATEGORIA (
    categ_codigo INTEGER PRIMARY KEY IDENTITY,
    categ_descricao VARCHAR (20) NOT NULL,
	dt_insert_linha SMALLDATETIME DEFAULT (SYSDATETIME())
);
GO

INSERT INTO CATEGORIA(categ_descricao)
VALUES ('INFORMATICA'),('CELULAR'),
	   ('ELETRONICO'),('MOVEL'),
	   ('PRODUTOS IMPORTADOS'),('ELETRODOMESTICOS'),
	   ('BRINQUEDOS'),('VESTUARIO'),
	   ('AUTOMOTIVO'),('LAZER'),
	   ('SAÚDE'),('PET')

GO

/**************** CLIENTE ****************/
CREATE TABLE CLIENTE (
    cli_codigo INTEGER PRIMARY KEY IDENTITY,
    cli_nome VARCHAR (30),
	cli_sexo CHAR (1),
    cli_cpf CHAR(11) UNIQUE NOT NULL,
    cli_datanascimento DATE NOT NULL,
    cli_endereco VARCHAR (100) NOT NULL,
    cli_telefone VARCHAR (15),
    cli_email VARCHAR (30),
    cli_status BIT DEFAULT (1),
	dt_insert_linha SMALLDATETIME DEFAULT (SYSDATETIME())
);
GO

INSERT INTO CLIENTE(cli_nome , cli_sexo, cli_cpf ,cli_datanascimento ,cli_endereco ,cli_telefone ,cli_email ,cli_status)
VALUES ('MARIA J. S.', 'F','11122233311','1990-10-10','RUA DAS FLORES, N 50, RECIFE/PE','81999998811','MARIAJS@EMAIL.COM',1 ),
	   ('FABIO M. F.', 'M','11122233322','1986-02-25','RUA DOS OPERARIOS, N 44, PAULISTA/PE','81999998822','FABIOMF@EMAIL.COM',0 ),
	   ('MARI S. R.', 'F','11122233333','1979-04-15','RUA DOS ENCANTOS, N 1456, SÃO PAULO/SP','11999998833','MARISR@EMAIL.COM',1 ),
	   ('JEAN N. F.', 'M','11122233344','1987-06-06','AVENIDA DOS AMIGOS , N 9985, RIO DE JANEIRO/RJ','21999998844','JEANNF@EMAIL.COM',1 ),
	   ('EDUARDO G. T.', 'M','11122233355','1995-08-22','RUA DOS MILAGRES, N 04, CABO BRANCO/PB','83999998855','EDUARDOGT@EMAIL.COM',0 ),
	   ('LUIZ T. S.', 'M','11122233366','1991-11-23','RUA DAS ARVORES, N 775, RECIFE/PE','81999998866','LUIZTS@EMAIL.COM',1 ),
	   ('CAMILA M. T.', 'F','11122233377','1992-12-12','RUA DAS MARGARIDAS, N 3333, PORTO ALEGRE/RS','51999998877','CAMILAMT@EMAIL.COM',1 ),
	   ('JULIANA B. C.', 'F','11122233388','1993-03-10','RUA DOS PINHAIS, N 9987, SÃO JOSÉ DOS PINHAIS/PR','41999998888','JULIANABC@EMAIL.COM',1 ),
	   ('DEBORA G. S.', 'F','11122233399','1992-07-13','RUA DAS MARIAS, N 7784, ITAJAI/SC','47999998899','DEBORAGS@EMAIL.COM',0 ),
	   ('ROGER T. F.', 'M','11122233310','1999-09-29','RUA DA FEIRA, N 4410, BRASILIA/DF','61999998810','ROGERTF@EMAIL.COM',1 )
GO

/**************** PEDIDO ****************/
CREATE TABLE PEDIDO (
    ped_numero INTEGER PRIMARY KEY IDENTITY,
    ped_datahora SMALLDATETIME DEFAULT (SYSDATETIME()),
    ped_datahorasaida SMALLDATETIME,
    ped_datahoraentrega SMALLDATETIME,
    ped_valorfrete SMALLMONEY,
	ped_status BIT DEFAULT (1),
    fk_cli_codigo INTEGER FOREIGN KEY REFERENCES CLIENTE(cli_codigo),
    fk_func_matricula INTEGER FOREIGN KEY REFERENCES FUNCIONARIO(func_matricula),
    fk_transp_codigo INTEGER FOREIGN KEY REFERENCES TRANSPORTADORA(transp_codigo),
	dt_insert_linha SMALLDATETIME DEFAULT (SYSDATETIME())
);
GO


INSERT INTO PEDIDO (ped_datahora , ped_datahorasaida, ped_datahoraentrega ,ped_valorfrete ,ped_status ,fk_cli_codigo,fk_func_matricula, fk_transp_codigo)
VALUES  ('2020-10-10', '2020-10-11', '2020-10-21', 45.5, 1, 3, 2, 2)
		,('2020-05-05', '2020-05-06', '2020-05-26', 5.50, 1, 3, 2, 3)
		,('2020-01-20', '2020-01-21', '2020-02-04', 0.00, 1, 3, 2, 2)

INSERT INTO PEDIDO (ped_datahorasaida, ped_datahoraentrega ,ped_valorfrete ,ped_status ,fk_cli_codigo,fk_func_matricula, fk_transp_codigo)
VALUES	 (DATEADD(day,1,getdate()), NULL, 12.88, NULL, 4, 2, 7)
		,(DATEADD(day,1,getdate()), NULL, 77.5, 0, 5, 3, 5)
		,(DATEADD(day,1,getdate()), DATEADD(DAY,10,DATEADD(day,1,getdate())), 4.45, 1, 2, 4, 6)
		,(DATEADD(day,1,getdate()), DATEADD(DAY,10,DATEADD(day,1,getdate())), 0.00, 1, 8, 4, 2)


/**************** PRODUTO ****************/
CREATE TABLE PRODUTO (
    prod_codigo INTEGER PRIMARY KEY IDENTITY,
    prod_nome VARCHAR (100) NOT NULL,
    prod_precounitario SMALLMONEY NOT NULL,
    prod_quantidadeestoque SMALLINT,
    prod_status BIT DEFAULT (1),
    fk_categ_codigo INTEGER FOREIGN KEY REFERENCES CATEGORIA (categ_codigo),
    fk_forn_codigo INTEGER FOREIGN KEY REFERENCES FORNECEDOR(forn_codigo),
	dt_insert_linha SMALLDATETIME DEFAULT (SYSDATETIME())
);
GO

INSERT INTO PRODUTO(prod_nome , prod_precounitario, prod_quantidadeestoque ,prod_status ,fk_categ_codigo ,fk_forn_codigo)
VALUES ('MONITOR CURVADO 24 POLEGADAS', 980.00, 15, 1, 1, 1),
	   ('FONE BLUETOOTH JBL', 320.00, 6, 1, 1, 5),
	   ('NOTEBOOK DELL I7 8GB RAM 128 SSD 1TB HDD', 4000.00, 50, 1, 1, 4),
	   ('PNEU ARO 14', 200.00, 20, 1, 9, 6),
	   ('PNEU ARO 17', 300.00, 12, 0, 9, 6),
	   ('COLEIRA PEITORAL PARA CÃES', 99.50, 35, 1, null, 7),
	   ('KIT 10 PLACAS DE TATAME', 142.70, 700, 1, 10, 2),
	   ('SMARTPHONE LG K61', 1399, 4, 1, 4, 3),
	   ('SMART TV LG 55" 4K UHD WIFI HDR INTELIGÊNCIA ARTIFICIAL THINQ', 3099.00, 7, 1, 3, 3),
	   ('FRITADEIRA ELÉTRICA SEM ÓLEO – AIR FRYER MONDIAL AF-34 3,2L 1270W PRETA 127V', 389.99, 11, 1, 6, 10),
	   ('ASPIRADOR ROBÔ MONDIAL RB-01 FAST CLEAN BIVOLT', 520.00, 10, 1, 6, 10),
	   ('LAVADORA DE ROUPAS BRASTEMP 12KG BWK12 BRANCA', 1699.99, 3, 1, 6, 9),
	   ('GELADEIRA/REFRIGERADOR BRASTEMP FROST FREE BRM44 375 LITROS - EVOX', 2399.89, 9, 1, 6, 9)



/**************** PEDIDO_PRODUTO ****************/
CREATE TABLE PEDIDO_PRODUTO (
	pedprod_codigo INTEGER PRIMARY KEY IDENTITY,
	pedprod_precovenda SMALLMONEY NOT NULL,
    pedprod_quantidadeitensvendidos SMALLINT DEFAULT (1),
    fk_ped_numero INTEGER FOREIGN KEY REFERENCES PEDIDO (ped_numero),
    fk_prod_codigo INTEGER FOREIGN KEY REFERENCES PRODUTO (prod_codigo),
	dt_insert_linha SMALLDATETIME DEFAULT (SYSDATETIME())
);
GO

INSERT INTO PEDIDO_PRODUTO (pedprod_precovenda, pedprod_quantidadeitensvendidos, fk_ped_numero, fk_prod_codigo)
VALUES (3500.00, 1, 3, 3),
	   (950.00, 1, 2, 1),
	   (300.00, 2, 1, 2),

	   (2000.00, 1, 4, 13),

	   (1699.99, 1, 5, 12),

	   (420.99, 3, 6, 11),
	   (300.00, 3, 6, 10),

	   (1000.00, 1, 7, 8),
	   (3000.00, 1, 7, 9),
	   (140.00, 2, 7, 7)
