use db_livros;

delimiter !
create procedure sp_inserir_assunto(var_nome_assunto varchar(100))
begin
	insert into tbl_assunto (nome_assunto) values (var_nome_assunto);
    
end!
delimiter ;

delimiter !
create procedure sp_inserir_autor(var_nome_autor varchar(70))
begin
	insert into tbl_autor (nome_autor) values (var_nome_autor);
end!
delimiter ;

delimiter !
create procedure sp_inserir_categoria(var_nome_categoria varchar(60))
begin
	insert into tbl_assunto (nome_categoria) values (var_nome_categoria);
end!
delimiter ;

delimiter !
create procedure sp_inserir_editora(var_nome_editora varchar(50))
begin
	insert into tbl_editora (nome_editora) values (var_nome_editora);
end!
delimiter ;

delimiter !
create procedure sp_inserir_livro(var_nome_livro varchar(50), var_isbn varchar(13), var_numero_pg smallint, var_preco float, 
var_data_pub date, var_id_categoria smallint, var_id_editora smallint, var_id_assunto tinyint, var_id_autor mediumint)
begin
	insert into tbl_livro (nome_livro, isbn, numero_pg, preco, data_pub, id_categoria, id_editora, id_assunto, id_autor) 
    values (var_nome_livro, var_isbn, var_numero_pg, var_preco, var_data_pub, var_id_categoria, var_id_editora, var_id_assunto, var_id_autor);
end!
delimiter ;

drop procedure sp_inserir_livro;

call sp_inserir_livro ('Buttlerflys', '978122395','34','12','2019-3-6','2','1','3','3');

delimiter !
create procedure sp_relacao_livro_autor (var_id_autor mediumint, var_id_livro mediumint)
begin
	insert into tbl_livro_autor(id_autor, id_livro) values (var_id_autor, var_id_livro);
end!
delimiter ;

use db_livros;

delimiter // 
create procedure sp_lista_livro (var_id_livro mediumint)
begin
	select tbl_livro.nome_livro, tbl_livro.isbn, tbl_livro.numero_pg, tbl_livro.preco,
    tbl_livro.data_pub, tbl_categoria.nome_categoria, tbl_autor.nome_autor, tbl_editora.nome_editora,
    tbl_assunto.nome_assunto from tbl_assunto
    inner join tbl_livro on tbl_livro.id_assunto=tbl_assunto.id_assunto 
    inner join tbl_categoria on tbl_livro.id_categoria=tbl_categoria.id_categoria
    inner join tbl_editora on tbl_livro.id_editora=tbl_editora.id_editora
    inner join tbl_autor on tbl_livro.id_autor=tbl_autor.id_autor
    where tbl_livro.id_livro=var_id_livro;
end //
delimiter ;

select * from tbl_livro;

drop procedure sp_lista_autor;

call sp_lista_livro(1);

delimiter !
create procedure sp_lista_autor (var_id_autor mediumint)
begin
	select nome_autor from tbl_autor where id_autor=var_id_autor;
end!
delimiter ;

call sp_lista_autor(7);

delimiter //
create procedure sp_lista_assunto(var_id_assunto tinyint)
begin
	select nome_assunto from tbl_assunto where id_assunto=var_id_assunto;
end //
delimiter ; 