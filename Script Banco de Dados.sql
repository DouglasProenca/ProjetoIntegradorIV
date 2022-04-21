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
    avaliacao FLOAT,
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
    nascimento DATE NOT NULL,
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
                          
insert into produto values(null,'Samsung Galaxy S21',10,5,40000.00,1,'O Galaxy S21 Ultra 5G é extraordinário em cada detalhe.'),
						  (null,'Samsung Galaxy S22',10,5,40000.00,1,'O Samsung Galaxy S22 5G é um smartphone Android de bom nível, ótimo para fotos, que pode satisfazer até o mais exigente dos usuários.'),
						  (null,'Samsung Galaxy S22 Ultra',10,5,40000.00,1,'Smartphone Samsung Galaxy S22 Ultra com 256GB, 12GB ram e Tela Infinita de 6,8".'),
						  (null,'Apple Iphone 11',10,5,40000.00,1,'É o IPhone com preço mais baixo da décima terceira geração, sucedendo ao IPhone XR.'),
                          (null,'Apple Iphone 13',10,5,40000.00,1,'IPhone 13. O sistema de câmera dupla mais avançado em um iPhone.'),
						  (null,'Apple Iphone 12',10,5,40000.00,1,'A14 Bionic, o chip mais rápido em um smartphone. Tela OLED de ponta a ponta.');

insert into imagem values(1,'s21-rosa.jpg','Resources/s21-rosa.jpg'),
						 (1,'s21-violeta.jpg','Resources/s21-violeta.jpg'),
                         (1,'s21-cinza.jpg','Resources/s21-cinza.jpg'),
                         (1,'s21-branco.jpg','Resources/s21-branco.jpg'),
                         (2,'s22-preto.jpg','Resources/s22-preto.jpg'),
                         (2,'s22-branco.jpg','Resources/s22-branco.jpg'),
                         (2,'s22-rose.jpg','Resources/s22-rose.jpg'),
                         (2,'s22-verde.jpg','Resources/s22-verde.jpg'),
                         (3,'s22-ultra-branco.jpg','Resources/s22-ultra-branco.jpg'),
                         (3,'s22-ultra-preto.jpg','Resources/s22-ultra-preto.jpg'),
                         (3,'s22-ultra-verde.jpg','Resources/s22-ultra-verde.jpg'),
                         (3,'s22-ultra-vinho.jpg','Resources/s22-ultra-vinho.jpg'),
                         (4,'iphone11-black-select-2019.png','Resources/iphone11-black-select-2019.png'),
                         (4,'iphone11-green-select-2019.png','Resources/iphone11-green-select-2019.png'),
                         (4,'iphone11-purple-select-2019','Resources/iphone11-purple-select-2019.png'),
                         (4,'iphone11-red-select-2019.png','Resources/iphone11-red-select-2019.png'),
                         (4,'iphone11-white-select-2019.png','Resources/iphone11-white-select-2019.png'),
                         (4,'iphone11-yellow-select-2019.png','Resources/iphone11-yellow-select-2019.png'),
                         (5,'iphone-13-blue-select-2021.png','Resources/iphone-13-blue-select-2021.png'),
                         (5,'iphone-13-green-select.png','Resources/iphone-13-green-select.png'),
                         (5,'iphone-13-midnight-select-2021.png','Resources/iphone-13-midnight-select-2021.png'),
                         (5,'iphone-13-pink-select-2021.png','Resources/iphone-13-pink-select-2021.png'),
                         (5,'iphone-13-product-red-select-2021.png','Resources/iphone-13-product-red-select-2021.png'),
                         (6,'iphone-12-black-select-2020.png','Resources/iphone-12-black-select-2020.png'),
                         (6,'iphone-12-blue-select-2020.png','Resources/iphone-12-blue-select-2020.png'),
                         (6,'iphone-12-green-select-2020.png','Resources/iphone-12-green-select-2020.png'),
                         (6,'iphone-12-purple-select-2021.png','Resources/iphone-12-purple-select-2021.png'),
                         (6,'iphone-12-red-select-2020.png','Resources/iphone-12-red-select-2020.png'),
                         (6,'iphone-12-white-select-2020.png','Resources/iphone-12-white-select-2020.png');

