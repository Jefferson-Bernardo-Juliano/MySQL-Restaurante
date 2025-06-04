/* Criação Banco de Dados Restaurante */

create database Restaurante;

use Restaurante;

create table funcionarios(
	id_funcionario int auto_increment primary key, -- Identificador único para cada funcionário
    nome varchar(255), -- Nome completo do funcionário
    cpf varchar(14), -- CPF do funcionário
    data_nascimento date, -- Data de nascimento do funcionário
    endereco varchar(255), -- Endereço residencial do funcionário
    telefone varchar(15), -- Número de telefone do funcionário
    email varchar(100), -- E-mail do funcionário
    cargo varchar(100), -- Cargo do funcionário no restaurante
    salario decimal(10 ,2), -- Salário do funcionário
    data_admissao date, -- Data de admissão do funcionário no restaurante
    unique (email) -- unico email
) comment='criação tabela funcionarios';
    
create table clientes(
	id_cliente int auto_increment primary key, -- Identificador único para cada cliente
    nome varchar(255), -- Nome completo do cliente
    cpf varchar(14), -- CPF do cliente
    data_nascimento date, -- Data de nascimento do cliente
    endereco varchar(255), -- Endereço residencial do cliente
    telefone varchar(15), -- Número de telefone do cliente
    email varchar(100), -- E-mail do cliente
    data_cadastro date, -- Data em que o cliente foi cadastrado no sistema
    unique (email) -- unico email
) comment='criação tabela clientes';

create table produtos(
	id_produto int auto_increment primary key, -- Identificador único para cada produto
	nome varchar(255), -- Nome do produto
	descricao text, -- Descrição detalhada do produto
	preco decimal(10 ,2), -- Preço do produto
	categoria varchar(100) -- Categoria do produto (ex: bebida, entrada, prato principal, sobremesa)
) comment='criação tabela produtos';

create table pedidos(
	id_pedido int primary key auto_increment, -- Identificador único para cada pedido
	id_cliente int, -- Referência ao cliente que fez o pedido
	id_funcionario int, -- Referência ao funcionário que atendeu o pedido
	id_produto int, -- Referência ao produto pedido
	quantidade int, -- Quantidade do produto pedido
	preco decimal(10 ,2), -- Preço do produto no momento do pedido
	date_pedido date, -- Data em que o pedido foi realizado
	status_pedido varchar(50), -- Status do pedido (ex: pendente, concluído, cancelado)
	foreign key (id_cliente) references clientes(id_cliente), -- Chave estrangeira id_cliente
	foreign key (id_funcionario) references funcionarios(id_funcionario), -- Chave estrangeira id_funcionario
	foreign key (id_produto) references produtos(id_produto) -- Chave estrangeira id_produto
) comment='criação tabela pedidos';

alter table pedidos change date_pedido data_pedido date;

create table info_produtos(
	id_info int primary key auto_increment, -- Identificador único para cada informação
	id_produto int, -- Referência ao produto
	ingredientes text, -- Lista de ingredientes do produto
	fornecedor varchar(255), -- Nome do fornecedor do produto
	foreign key (id_produto) references produtos(id_produto)  -- Chave estrangeira id_produto
) comment='criação tabela info_produtos';