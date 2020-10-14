-- banco de dados jogador

create database db_jogador;

use db_jogador;

create table tbl_jogador(
matricula int auto_increment primary key,
nome varchar(40) not null,
cpf char(14) not null unique,
cod_time int not null,
constraint fk_time_jogador foreign key (cod_time) references tbl_time (cod_time)
);

create table tbl_time(
cod_time int auto_increment primary key,
nome_time varchar(40) not null,
numero_de_socios int
);

create table tbl_telefone(
cod_telefone int auto_increment primary key,
numero char(9) not null,
matricula int not null,
constraint fk_telefone_jogador foreign key (matricula) references tbl_jogador(matricula)
);

insert into tbl_time (nome_time, numero_de_socios) values ('Ziketas', 31), 
('São Paulo', 10000),
('Palmeiras', 2000);

insert into tbl_jogador (nome, cpf, cod_time) values ('Pedro Cobuci', '111.222.333-44', 1),
('Cristiano Ronaldo', '123.456.789-90', 2),
('Rony','456.789.123-45', 3),
('Gabriel Jesus', '234.678.234-99', 2),
('Lionel Messi','122.344.766-00',1);

insert into tbl_telefone (numero, matricula) values ('978230086', 5),
('947123451', 3), ('912320001',4), ('981812342',1), ('901123456',2);

insert into tbl_telefone (numero, matricula) values ('978786123',1);

select * from tbl_telefone;

# Exercício7
# a) imprima todos os dados dos jogadores do Palmeiras

select tbl_jogador.matricula, tbl_jogador.nome, tbl_time.cod_time, tbl_time.nome_time, tbl_jogador.cpf, tbl_telefone.cod_telefone, tbl_telefone.numero from tbl_telefone 
inner join tbl_jogador on tbl_jogador.matricula=tbl_telefone.matricula  inner join tbl_time on tbl_jogador.cod_time=tbl_time.cod_time where tbl_time.nome_time = 'Palmeiras';

# b) imprima todos os nomes dos jogadores com seus respectivos telefones

select tbl_jogador.matricula, tbl_jogador.nome, tbl_jogador.cpf, tbl_telefone.numero from tbl_telefone inner join tbl_jogador on tbl_jogador.matricula=tbl_telefone.matricula;

# c) Imprima os nomes dos times com seus respectivos jogadores

select tbl_time.nome_time, tbl_jogador.nome from tbl_jogador inner join tbl_time on tbl_jogador.cod_time=tbl_time.cod_time;

# d) imprima os nomes dos times com seus jogadores  e seus respectivos telefones

select tbl_time.nome_time, tbl_jogador.nome, tbl_telefone.numero from tbl_telefone inner join tbl_jogador on tbl_telefone.matricula=tbl_jogador.matricula
 inner join tbl_time on tbl_jogador.cod_time=tbl_time.cod_time;
  
# e) imprima os nomes dos jogadores do São Paulo

select  tbl_time.cod_time, tbl_jogador.nome, tbl_time.nome_time from tbl_time inner join tbl_jogador on tbl_jogador.cod_time=tbl_time.cod_time where tbl_time.nome_time = 'São Paulo';

# f) imprima os nomes dos jogadores do Ziketas ordenando pelo nome do jogador

select tbl_time.cod_time, tbl_jogador.nome, tbl_time.nome_time from tbl_time inner join tbl_jogador on tbl_jogador.cod_time=tbl_time.cod_time
 where tbl_time.nome_time = 'Ziketas' order by tbl_jogador.nome;

# g) imprimir o número de jogadores do Ziketas

select tbl_jogador.cod_time, tbl_time.nome_time, count(matricula) as numero_de_jogadores from tbl_jogador inner join tbl_time on tbl_jogador.cod_time=tbl_time.cod_time 
where tbl_time.nome_time = 'Ziketas';

# h) imprimir o nome do time e seus sócios

select nome_time, numero_de_socios from tbl_time;

# i) imprimir o nome dos jogadores com os números de sócios

select tbl_jogador.nome, tbl_time.numero_de_socios from tbl_time inner join tbl_jogador on tbl_jogador.cod_time=tbl_time.cod_time;



