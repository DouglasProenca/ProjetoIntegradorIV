-- ----------------------------------- Criação da Database ---------------------------------------------

create database projetointegrador4;

use projetointegrador4;

-- ----------------------------------- Criação das Tabelas ----------------------------------------------

CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria CHAR(13) NOT NULL
);

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(50) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    nascimento DATE NOT NULL,
    id_categoria INT NOT NULL,
    cpf VARCHAR(30) UNIQUE NOT NULL,
    senha VARCHAR(80) NOT NULL,
    ativo BIT NOT NULL
);

Alter table usuario add constraint fk_usuario_categoria foreign key usuario(id_categoria) references categoria(id);

CREATE TABLE produto (
    código INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    quantidade INT NOT NULL,
    avalicao FLOAT,
    valor DOUBLE NOT NULL,
    ativo BIT NOT NULL,
    descricao VARCHAR(500)
);

CREATE TABLE imagem (
    codigo_produto INT,
    nome_imagem VARCHAR(100),
    caminho VARCHAR(100)
);

alter table imagem add constraint fk_codigo_produto foreign key imagem(codigo_produto) references produto(código);

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(150) UNIQUE,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(30) UNIQUE NOT NULL,
    nascimente DATE NOT NULL,
    genero VARCHAR(100) NOT NULL,
    senha VARCHAR(80) NOT NULL
);

CREATE TABLE endereco_cliente (
    id_cliente INT,
    CEP VARCHAR(100),
    logradouro VARCHAR(200),
    Número BIGINT,
    complemento VARCHAR(200),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2)
);

alter table endereco_cliente add constraint fk_cliente_endereco foreign key endereco_cliente(id_cliente) references cliente(id);

-- ----------------------------------- Criação das Procedures ----------------------------------------------

delimiter $

CREATE PROCEDURE sp_altStatus (cpf_aux varchar(50))
begin

declare _status int;

set _status = (select ativo from usuario where cpf = cpf_aux);

update usuario set ativo = (select case when _status = 1 then 0 else 1 end) where cpf = cpf_aux;


end

delimiter ;

delimiter $

CREATE PROCEDURE sp_altStatusProduto (id int)
begin

declare _status int;

set _status = (select ativo from produto where código = id);

update produto set ativo = (select case when _status = 1 then 0 else 1 end)
where código = id;

end

delimiter ;

delimiter $

CREATE PROCEDURE sp_getProdutos (contador int)
begin

if contador = 0
then

select p.código codigo
       ,p.nome
       ,p.quantidade
       ,p.avaliacao
       ,p.valor
       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from produto p
order by p.código desc
LIMIT 10;

end if;

if contador = 1
then

select p.código codigo
       ,p.nome
       ,p.quantidade
       ,p.avaliacao
       ,p.valor
       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from produto p
order by p.código desc
LIMIT 10,10;

end if;

if contador = 2
then

select p.código codigo
       ,p.nome
       ,p.quantidade
       ,p.avaliacao
       ,p.valor
       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from produto p
order by p.código desc
LIMIT 20,10;

end if;

if contador = 3
then

select p.código codigo
       ,p.nome
       ,p.quantidade
       ,p.avaliacao
       ,p.valor
       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from produto p
order by p.código desc
LIMIT 30,10;

end if;

end

delimiter ;

delimiter $

CREATE PROCEDURE sp_getUsuario (contador int)
begin

if contador = 0
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.cpf
       ,u.email
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 10;

end if;

if contador = 1
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 10,10;

end if;

if contador = 2
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 20,10;

end if;

if contador = 3
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 30,10;

end if;

end

delimiter ;

-- ----------------------------------- Criação dos Inserts ----------------------------------------------

insert into categoria values(null,'administrador'),
							(null,'estoquista');
                            
insert into usuario values(null,'Douglas Proença Rolim de Souza','(11)95436-0397','Douglasp.r.desouza@gmail.com','1998-04-04',1,'488.654.963-78','$2a$08$fH2uvGnb70vzY7jS.vSn4OLEjjRE6u7J.Zpwh7Oa8FfQjyVCz6Qoq',1),
						  (null,'Rafael Gomes Camilo','(11)94002-8922','Rafa.gomes@gmail.com','1986-04-04',2,'488.654.963-70','$2a$08$1BdA7ANRBwhdnpWeE4UBM.38Iej0g8SAGCJALeEoOwTDFshQJlo8W',1);                            