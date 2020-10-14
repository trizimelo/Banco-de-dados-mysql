	CREATE DATABASE db_loja2;

	USE DB_LOJA2;

	create table tbl_venda(
	ID_NF mediumint not null,
	ID_ITEM smallint not null,
	COD_PROD int not null,
	VALOR_UNIT float not null,
	QUANTIDADE smallint not null,
	DESCONTO tinyint,
	primary key (ID_NF, ID_ITEM, COD_PROD)
	);

	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (1,1,1,'25.00','10','5');
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (1,2,2,'13.5','3',null);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (1,3,3,'15','2',null);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (1,4,4,'10','1',null);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (1,5,5,'30','1',null);

	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (2,1,3,'15','2',null);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (2,2,4,'10','5',null);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (2,3,5,'30','7',null);

	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (3,1,1,'25','5',null);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (3,2,4,'10','4',null);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (3,3,5,'30','5',null);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (3,4,2,'13.5','7',null);

	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (4,1,5,'30','10',15);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (4,2,4,'10','12',5);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (4,3,1,'25','13',5);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (4,4,2,'13.5','15',5);

	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (5,1,3,'15','3',null);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (5,2,5,'30','6',null);

	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (6,1,1,'25','22',15);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (6,2,3,'15','25',20);

	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (7,1,1,'25','10',3);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (7,2,2,'13.5','10',4);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (7,3,3,'15','10',4);
	insert into tbl_venda (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values (7,4,4,'30','10',1);

	select * from tbl_venda;

	-- A 

	select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT from tbl_venda where DESCONTO = 0;

	-- b 

	select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, (VALOR_UNIT) - (VALOR_UNIT * (DESCONTO/100)) as valor_venda from tbl_venda where DESCONTO <> 0; 

	-- C 

	update tbl_venda set desconto = '0' where desconto is null;

	-- D 

	SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, DESCONTO, (VALOR_UNIT) - (VALOR_UNIT * (DESCONTO/100)) as valor_vendido, ((QUANTIDADE) * (VALOR_UNIT)) as valor_total from tbl_venda;

	-- E 

	select ID_NF, SUM(QUANTIDADE*VALOR_UNIT) as valor_total from tbl_venda order by id_nf asc, valor_total desc;

	-- f 

	select ID_NF, (VALOR_UNIT) - (VALOR_UNIT * (DESCONTO/100)) as valor_vendido from tbl_venda order by id_nf asc, valor_vendido desc;

	-- g

	select cod_prod, sum(quantidade) numero_vendido from tbl_venda group by cod_prod order by sum(quantidade) desc limit 1;

	-- h 

	select ID_NF, COD_PROD, QUANTIDADE from tbl_venda where quantidade >= 10 group by ID_NF, COD_PROD;

	-- i

	 select id_nf, sum(quantidade*valor_unit) as valor_total_das_nfs from tbl_venda group by id_nf
	 having valor_total_das_nfs > 500
	 order by valor_total_das_nfs desc;
	 
	 -- j
	 
	 select cod_PROD, avg(desconto) as valor_medio_de_desconto from tbl_venda group by cod_PROD;
	 
	 -- k 
	 
	 select cod_PROD, sum(desconto) as desconto, count(desconto) as num_de_descontos, min(desconto) as valor_min_de_desconto, max(desconto) as valor_max_de_desconto, avg(desconto) as media_de_desconto from tbl_venda group by cod_PROD;
	 
	 -- l
	 
	 select id_NF, count(quantidade) as quantidade_de_itens from tbl_venda group by id_NF having count(quantidade)>3 order by id_NF desc;