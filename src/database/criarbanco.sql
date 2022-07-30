DO $$ BEGIN

	IF EXISTS(select 1 from information_schema.tables where table_name='item_do_pedido') THEN
     drop table item_do_pedido;
  END IF;

  IF EXISTS(select 1 from information_schema.tables where table_name='pedido') THEN
     drop table pedido;
  END IF;

  IF EXISTS(select 1 from information_schema.tables where table_name='produto') THEN
     drop table produto;
  END IF;

  IF EXISTS(select 1 from information_schema.tables where table_name='cliente') THEN
     drop table cliente;
  END IF;
END $$;

create table produto(
	id int not null primary key,
	descricao varchar(45) not null
);

create table cliente(
	id int not null primary key,
	nome varchar(50) not null,
	sobrenome varchar(50) not null
);

create table pedido(
	id int not null primary key,
	data date not null,
	id_cliente int not null,
	CONSTRAINT fk_pedido_id_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id)
);

create table item_do_pedido(
	id_pedido int not null,
	id_produto int not null,
	qtdade int not null,
	CONSTRAINT fk_itempedido_id_pedido FOREIGN KEY(id_pedido) REFERENCES pedido(id),
	CONSTRAINT fk_itempedido_id_produto FOREIGN KEY(id_produto) REFERENCES produto(id)
);

-- MASSA DE DADOS

insert into cliente (id, nome, sobrenome) values
(1, 'Marcos', 'Lima'),
(2, 'Ana', 'Massaneiro'),
(3, 'Giovana', 'Barreto'),
(4, 'Robson', 'Rodrigues'), 
(5, 'Pablya', 'Marchette');

insert into produto (id, descricao) values
(1, 'Açúcar'),
(2, 'Sal'),
(3, 'Arroz'),
(4, 'Feijão'),
(5, 'Farinha'),
(6, 'Macarrão'),
(7, 'Café'),
(8, 'Leite'),
(9, 'Óleo'),
(10, 'Temperos'),
(11, 'Molho de tomate'),
(12, 'Queijo ralado'),
(13, 'Ovos'),
(14, 'Fermento'),
(15, 'Pães'),
(16, 'Carnes'),
(17, 'Iogurte'),
(18, 'Margarina ou manteiga'),
(19, 'Maisena'),
(20, 'Biscoitos'),
(21, 'Hortaliças em geral'),
(22, 'Produtos de limpeza'),
(23, 'Sabão em pedra'),
(24, 'Sabão em pó'),
(25, 'Detergente'),
(26, 'Desinfetante'),
(27, 'Amaciante'),
(28, 'Lustra-móveis'),
(29, 'Álcool em gel'),
(30, 'Água sanitária'),
(31, 'Inseticida'),
(32, 'Esponja de pia'),
(33, 'Esponja de aço'),
(34, 'Sacos de lixo'),
(35, 'Luvas plásticas'),
(36, 'Flanelas'),
(37, 'Produtos de higiene e uso pessoal'),
(38, 'Sabonete'),
(39, 'Creme dental'),
(40, 'Escova de dente'),
(41, 'Fio dental'),
(42, 'Absorventes'),
(43, 'Barbeador descartável'),
(44, 'Creme de barbear'),
(45, 'Algodão'),
(46, 'Desodorante'),
(47, 'Shampoo e condicionador'),
(48, 'Papel higiênico'),
(49, 'Água oxigenada'),
(50, 'Gaze'),
(51, 'Hastes flexíveis'),
(52, 'Esparadrapo'),
(53, 'Curativos'),
(54, 'Produtos úteis para o dia a dia'),
(55, 'Papel alumínio'),
(56, 'Papel filme'),
(57, 'Papel toalha'),
(58, 'Guardanapo de papel'),
(59, 'Fósforo'),
(60, 'Velas'),
(61, 'Lâmpadas'),
(62, 'Fita isolante'),
(63, 'Fita crepe');

select 'CRIADO COM SUCESSO!'