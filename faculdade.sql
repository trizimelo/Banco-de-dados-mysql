use db_faculdade;

create table tbl_aluno(
	RA smallint auto_increment primary key,
	nome_aluno varchar(50) not null,
	data_nasc date not null,
	rg varchar(12) not null,
	cpf varchar(14) not null,
	logradouro varchar(150) not null,
	numero tinyint not null,
	bairro varchar(100) not null,
	cidade varchar(100) not null,
	uf varchar(2) not null,
	situacao_matricula varchar(50),
	ID_TURMA smallint not null,
    ID_telefone mediumint not null,
    constraint fk_tele foreign key (id_telefone) references tbl_telefone (id_telefone),
    constraint fk_turma foreign key (id_turma) references tbl_turma (id_turma)
);

create table tbl_professor(
	id_professor smallint auto_increment primary key,
	nome_professor varchar(200) not null,
	data_nasc date not null,
	rg varchar(12) not null,
	cpf varchar(14) not null,
	logradouro varchar(150) not null,
	numero tinyint not null,
	bairro varchar(100) not null,
	cidade varchar(100) not null,
	uf varchar(2) not null,
	situacao_lecionar varchar(50),
    id_telefone mediumint not null,
    constraint fk_tel foreign key (id_telefone) references tbl_telefone (id_telefone)
);

create table tbl_telefone(
id_telefone mediumint auto_increment primary key,
ddd_tel1 char(2) not null,
telefone1 varchar(10) not null,
ddd_tel2 char(2) ,
telefone2 varchar(10)
);

create table tbl_disciplina(
	id_disciplina tinyint auto_increment primary key,
	nome_disciplina varchar(50) not null,
	numero_alunos tinyint
);

create table tbl_prof_disciplina(
	id_prof_disciplina smallint auto_increment primary key,
	id_professor smallint not null,
	id_disciplina tinyint not null,
	constraint fk_prof foreign key (id_professor) references tbl_professor (id_professor),
	constraint fk_disc foreign key (id_disciplina) references tbl_disciplina (id_disciplina)
);



create table tbl_cursos(
	id_curso smallint auto_increment primary key,
	nome_curso varchar(150) not null,
	id_disciplina smallint not null,
	id_departamento smallint not null
    );
    
    alter table tbl_cursos add foreign key (id_disciplina) references tbl_disciplina (id_disciplina);
    
    alter table tbl_cursos add constraint fk_departamento_curso foreign key (id_departamento) references tbl_departamento (id_departamento);

alter table tbl_cursos add column id_disciplina tinyint not null; 

create table tbl_departamento(
	id_departamento smallint auto_increment primary key,
	nome_departamento varchar(150) not null,
	id_disciplina tinyint not null,
	constraint fk_discip foreign key (id_disciplina) references tbl_disciplina (id_disciplina)
);

create table tbl_turma_professor(
	id_turma_professor smallint auto_increment primary key,
	id_professor smallint not null,
	id_turma smallint not null,
	constraint fk_proff foreign key (id_professor) references tbl_professor (id_professor),
	constraint fk_turr foreign key (id_turma) references tbl_turma (id_turma)
);

create table tbl_historico_escolar(
	id_historico smallint auto_increment primary key,
	inicio_turma date not null,
	termino_turma date,
	notas decimal,
	frequencia varchar(13),
	ra smallint not null,
	constraint fk_aluno foreign key (ra) references tbl_aluno (ra)
);

alter table tbl_historico_escolar add constraint fk_ID_DISCIPLINA foreign key (id_disciplina) references tbl_disciplina (id_disciplina); 

create table tbl_historico_disciplina(
	id_hist_disc smallint auto_increment primary key,
	id_historico smallint not null,
	id_disciplina tinyint not null,
	constraint fk_discipl foreign key (id_disciplina) references tbl_disciplina (id_disciplina),
	constraint fk_hist foreign key (id_historico) references tbl_historico_escolar (id_historico)
);

create table tbl_turma(
id_turma smallint auto_increment primary key,
nome_turma varchar(25) not null,
inicio_turma date not null,
termino_turma date,
numero_alunos tinyint,
id_curso smallint not null,
id_professor smallint not null,
constraint fk_curso foreign key (id_curso) references tbl_cursos (id_curso),
constraint fk_profess foreign key (id_professor) references tbl_professor (id_professor)
);


