create database projetointegrador4;

use projetointegrador4;

create table categoria(
id int primary key auto_increment,
categoria char(13) not null
);

insert into categoria values(null,'administrador'),
							(null,'estoquista');

create table usuario(
id int primary key auto_increment,
nome varchar(50) not null,
telefone varchar(50) not null,
email varchar(30) unique not null,
nascimento Date not null,
id_categoria int not null,
cpf varchar(30) unique not null,
senha varchar(80) not null,
ativo bit not null
);

Alter table usuario add constraint fk_usuario_categoria foreign key usuario(id_categoria) references categoria(id);

insert into usuario values(null,'Douglas Proença Rolim de Souza','(11)95436-0397','Douglasp.r.desouza@gmail.com','1998-04-04',1,'488.654.963-78','$2a$08$fH2uvGnb70vzY7jS.vSn4OLEjjRE6u7J.Zpwh7Oa8FfQjyVCz6Qoq',1),
						  (null,'Rafael Gomes Camilo','(11)94002-8922','Rafa.gomes@gmail.com','1986-04-04',2,'488.654.963-70','$2a$08$1BdA7ANRBwhdnpWeE4UBM.38Iej0g8SAGCJALeEoOwTDFshQJlo8W',1);

select * from usuario;

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativos' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome;

update usuario set ativo = 1 where id = 3;

select * from usuario;

call sp_al

delimiter $

create procedure sp_altStatus (cpf_aux varchar(50))
begin

declare _status int;

set _status = (select ativo from usuario where cpf = cpf_aux);

update usuario set ativo = (select case when _status = 1 then 0 else 1 end);


end $
delimiter ;

create table produto(
código int primary key auto_increment,
 nome varchar(200) not null,
 quantidade int not null, 
 valor double(24,2) not null,
 ativo bit not null 
);