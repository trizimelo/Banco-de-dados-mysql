create database db_universidade;

use db_universidade;

create table if not exists tbl_aluno(
 matricula varchar(10) primary key,
 nome varchar(100) not null,
 endereço varchar(100) not null,
 cidade varchar(50) not null);
 
 insert into tbl_aluno (matricula, nome, endereço, cidade)
values 
('2015010101', 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
('2015010102', 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
('2015010103', 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
('2015010104', 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
('2015010105', 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
('2015010106', 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

select * from tbl_historico;

create table if not exists tbl_disciplina(
cod_disc varchar(3) primary key,
nome_disc varchar(100) not null,
carga_hor varchar(10) not null);

insert into tbl_disciplina (cod_disc, nome_disc, carga_hor)
values ('BD', 'BANCO DE DADOS', '100'),
('POO', 'PROGRAMAÇÃO COM ACESSO Ahistoricodisciplina BANCO DE DADOS', '100'),
('WEB', 'AUTORIA WEB', '50'),
('ENG', 'ENGENHARIA DE SOFTWARE', '80');
 
create table if not exists tbl_professor(
 cod_prof varchar(7) primary key,
 nome varchar(100) not null,
 endereco varchar(100) not null,
 cidade varchar(50) not null);
 
 insert into tbl_disciplina (cod_disc, nome_disc, carga_hor)
values ('BD', 'BANCO DE DADOS', '100'),
('POO', 'PROGRAMAÇÃO COM ACESSO Ahistoricodisciplina BANCO DE DADOS', '100'),
('WEB', 'AUTORIA WEB', '50'),
('ENG', 'ENGENHARIA DE SOFTWARE', '80');
 
create table if not exists tbl_turma(
cod_disc varchar(3) not null,
cod_turma varchar(3) not null,
cod_prof varchar(7) not null,
ano year not null,
horário varchar(20) not null,
primary key(cod_disc, cod_turma, cod_prof, ano),
constraint fk_turma_disc foreign key (cod_disc) references tbl_disciplina (cod_disc), 
constraint fk_turma_prof foreign key (cod_prof) references tbl_professor (cod_prof));

insert into tbl_turma values ('BD', '1', '212131', '2015', '11H-12H'),
('BD', '2', '212131', '2015', '13H-14H'),
('POO', '1', '192011', '2015', '08H-09H'),
('WEB', '1', '192011', '2015', '07H-08H'),
('ENG', '1', '122135', '2015', '10H-11H');

insert into tbl_disciplina (cod_disc, nome_disc, carga_hor)
values ('BD', 'BANCO DE DADOS', '100'),
('POO', 'PROGRAMAÇÃO COM ACESSO Ahistoricodisciplina BANCO DE DADOS', '100'),
('WEB', 'AUTORIA WEB', '50'),
('ENG', 'ENGENHARIA DE SOFTWARE', '80');

create table tbl_historico(
matricula varchar(10) not null,
cod_disc varchar(3) not null,
cod_turma varchar(3) not null,
cod_prof varchar(7) not null,
ano year not null,
frequencia varchar(10) not null,
nota float not null,
primary key(matricula, cod_disc, cod_turma, cod_prof, ano),
constraint fk_hist_matricula foreign key (matricula) references tbl_aluno (matricula),
constraint fk_historico_turma foreign key (cod_disc, cod_turma, cod_prof, ano)
references tbl_turma(cod_disc, cod_turma, cod_prof, ano));

insert into tbl_historico (matricula, cod_disc, cod_turma, cod_prof, ano, frequencia, nota) 
values
('2015010101','BD','1', '212131',2015, '80',9.0),
('2015010102','BD','1', '212131',2015, '70',4.0),
('2015010103','BD','1', '212131',2015, '90',8.5),
('2015010104','BD','2', '212131',2015, '85',9.5),
('2015010105','BD','2', '212131',2015, '75',7.5),
('2015010106','BD','2', '212131',2015, '95',8.0);


insert into tbl_historico (matricula, cod_disc, cod_turma, cod_prof, ano, frequencia, nota) 
values
('2015010101','POO','1','192011',2015,'70',7.5),
('2015010102','POO','1','192011',2015,'75',9.0),
('2015010103','POO','1','192011',2015,'80',7.5),
('2015010104','POO','1','192011',2015,'95',8.0),
('2015010105','POO','1','192011',2015,'85',8.0),
('2015010106','POO','1','192011',2015,'90',8.5);


insert into tbl_historico (matricula, cod_disc, cod_turma, cod_prof, ano, frequencia, nota) 
values
('2015010101','WEB','1','192011',2015,'90',9.0),
('2015010102','WEB','1','192011',2015,'80',8.5),
('2015010103','WEB','1','192011',2015,'95',9.5),
('2015010104','WEB','1','192011',2015,'85',8.0),
('2015010105','WEB','1','192011',2015,'95',8.5),
('2015010106','WEB','1','192011',2015,'90',9.0);


insert into tbl_historico (matricula, cod_disc, cod_turma, cod_prof, ano, frequencia, nota) 
values
('2015010101','ENG','1','122135',2015,'85',8.5),
('2015010102','ENG','1','122135',2015,'90',9.0),
('2015010103','ENG','1','122135',2015,'95',9.0),
('2015010104','ENG','1','122135',2015,'75',7.0),
('2015010105','ENG','1','122135',2015,'80',8.5),
('2015010106','ENG','1','122135',2015,'90',8.0);

-- a) Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD =
-- código da disciplinas).

select matricula from tbl_historico where cod_disc = 'BD' and nota = '2015' and nota<5;

-- b) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO
-- em 2015. 

select matricula, avg(nota) from tbl_historico where cod_disc = 'POO' and ano = '2015'; 

-- c) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO
-- em 2015 e que esta média seja superior a 6.

select matricula, avg(nota) as media from tbl_historico 
where cod_disc='POO' and ano='2015' having media > 6;

-- d) Encontre quantos alunos não são de Natal.

select matricula, nome, count(matricula) as numero_de_alunos from tbl_aluno group by where cidade <> 'Natal';

-- aaaaaa

select 
tbl_turma.cod_disc,
 tbl_disciplina.nome_disc,
tbl_turma.cod_prof,
 tbl_professor.nome, 
 tbl_turma.ano, 
 tbl_turma.horário 
 from tbl_professor 
 inner join tbl_turma 
 on tbl_professor.cod_prof = tbl_turma.cod_prof
inner join tbl_disciplina 
on tbl_disciplina.cod_disc = tbl_turma.cod_disc 
order by tbl_professor.nome asc;
 
select 
tbl_historico.matricula, 
tbl_aluno.nome, 
tbl_historico.cod_disc,
tbl_disciplina.nome_disc, 
tbl_historico.cod_turma, 
tbl_historico.ano, 
tbl_historico.cod_prof, 
tbl_professor.nome 
from tbl_professor 
inner join tbl_historico
on tbl_professor.cod_prof = tbl_historico.cod_prof
inner join tbl_aluno 
on tbl_historico.matricula = tbl_aluno.matricula 
inner join tbl_disciplina
on tbl_historico.cod_disc = tbl_disciplina.cod_disc;
 
alter table tbl_historico add constraint fk_historico_professor foreign key (cod_prof)
references tbl_professor(cod_prof);
 
 
 
 
 
 
 
 
 
 