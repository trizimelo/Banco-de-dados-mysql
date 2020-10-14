use db_jogador;

select * from tbl_jogador;

-- stored procedure = procedimento armazenado


delimiter //
create procedure sp_lista_jogador(matricula_jogador int)
begin 
	select nome, cod_time from tbl_jogador where matricula = matricula_jogador;
end //
DELIMITER ;

-- excluindo a stored 

drop procedure sp_lista_jogador;

-- chamando a sp

call sp_lista_jogador(1);
call sp_lista_jogador(4);

-- ---------------------------------------------------------------------------------

-- criar uma historia de procedure p listar o time de acordo com o codigo

delimiter @
create procedure sp_lista_time(var_codtime int)
begin
	select * from tbl_time where cod_time=var_codtime;
end @
delimiter ;

call sp_lista_time(1);

-- crie uma sp para mostrar o jogador escolhido e o nome do seu time

delimiter // 
create procedure sp_lista_jogador_time(var_matricula int)
begin
	 select tbl_jogador.nome as Jogador, tbl_time.nome_time as 'Time'
     from tbl_time inner join tbl_jogador 
     on tbl_jogador.cod_time=tbl_time.cod_time where tbl_jogador.matricula=var_matricula;
end //
delimiter ; 

call sp_lista_jogador_time(1);

-- inserir dados 

delimiter @
create procedure sp_insere_time(var_nome varchar(40), var_num_socios int)
begin
	insert into tbl_time(nome_time, numero_de_socios)
    values (var_nome, var_num_socios);
    select * from tbl_time;
end @
delimiter ;

call sp_insere_time('Corinthians', 780);

delimiter //
create procedure sp_insere_jogador(var_nome_jogador varchar(40), cpf char(14), cod_time int)
begin
	 insert into tbl_jogador (nome, cpf, cod_time) 
     values (var_nome_jogador, cpf, cod_time);
end // 
delimiter ;

call sp_insere_jogador('Gui','977.456.111-09',4);

delimiter @
create procedure sp_insere_telefone(var_numero char(9), var_matricula int)
begin
	insert into tbl_telefone (numero, matricula)
    values (var_numero, var_matricula);
end @
delimiter ;

call sp_insere_telefone('963615233',9);





