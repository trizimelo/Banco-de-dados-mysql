 create database db_livros;
 
 use db_livros;

create table tbl_editora(
ID_editora smallint auto_increment primary key,
nome_editora varchar(50) not null
);

create table tbl_categoria(
id_categoria smallint auto_increment primary key,
nome_categoria varchar(60)
);

create table tbl_autor(
id_autor mediumint auto_increment primary key,
nome_autor varchar(70) not null
);

create table tbl_livro_autor(
id_livro_autor mediumint auto_increment primary key,
id_autor mediumint not null,
id_livro mediumint not null,
constraint fk_livro_autor foreign key (id_autor) references tbl_autor (id_autor),
constraint fk_autor_livro foreign key (id_livro) references tbl_livro (id_livro)
);

create table tbl_livro (
	id_livro mediumint auto_increment primary key,
    nome_livro varchar(50) not null,
    isbn varchar(13) not null,
    numero_pg smallint not null,
    preco float not null,
    data_pub date not null,
    id_categoria smallint not null,
    id_editora smallint not null,
    id_assunto tinyint not null,
    constraint fk_categoria_livro foreign key (id_categoria) references tbl_categoria (id_categoria),
    constraint fk_editora_livro foreign key (id_editora) references tbl_editora (id_editora),
    constraint fk_assunto_livro foreign key (id_assunto) references tbl_assunto (id_assunto)
    );
    
    create table tbl_assunto(
    id_assunto tinyint auto_increment primary key,
    nome_assunto varchar(100) not null
    );
    
    alter table tbl_livro auto_increment=100;
    
    insert into tbl_livro(nome_livro, isbn, numero_pg, preco, data_pub, id_categoria, id_editora, id_assunto) values('Buttlerflys', '978122395','34','12','2019-3-6','2','1','3'); 
    
    select * from tbl_livro_autor;
    
    insert into tbl_livro_autor values (default,'2', '1');
    