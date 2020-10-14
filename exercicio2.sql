create  database db_universidade;

use db_universidade;

create table if not exists tbl_aluno(
MAT MEDIUMINT AUTO_INCREMENT PRIMARY KEY, 
NOME VARCHAR(150) NOT NULL,
ENDERECO VARCHAR(200) NOT NULL,
CIDADE VARCHAR(70) NOT NULL
);
create table tbl_Disciplinas(
COD_DISC
 nome_disc
 carga_hor
 );
 
create table tbl_Professores(
COD_PROF,
 nome,
 endereço,
 cidade
 );
 
create table tbl_Turma (
cod_turma,
 ANO,
 horário
 COD_DISC,
 COD_PROF,
 COD_DISC referencia Disciplinas
COD_PROF referencia Professores
 );
 
 create table tbl_Histórico (
 MAT,
 COD_DISC,
 COD_TURMA,
 COD_PROF,
 ANO,
 frequência,
 nota
 MAT referencia Alunos
COD_DISC, COD_TURMA, COD_PROF, ANO referencia Turma
 );