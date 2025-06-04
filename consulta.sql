/* Consultando dados em restaurante */

use restaurante;

-- Nome e a categoria dos produtos que tem o preço superior a 30
select nome, categoria from produtos where preco > 30;

-- Nome, telefone e data de nascimento dos clientes que nasceram antes do ano de 1985
select nome, telefone, data_nascimento from clientes where data_nascimento < '1985-01-01';

-- id do produto e os ingredientes de informações de produto para os ingredientes que contenham a palavra “carne”
select id_produto, ingredientes from info_produtos where ingredientes like 'car%';

-- Nome e a categoria dos produtos ordenados em ordem alfabética por categoria
select nome, categoria from produtos order by categoria asc, nome asc;

-- 5 produtos mais caros do restaurante
select nome, preco from produtos order by preco desc limit 5;

-- Selecionar 2 produtos da categoria ‘Prato Principal’ e pular 6 registros
select nome, categoria from produtos where categoria = 'prato principal' limit 2 offset 6;

-- Criar tabela a partir da seleção de dados (Backup*)
create table backup_pedidos as select * from pedidos;

select * from backup_pedidos;
