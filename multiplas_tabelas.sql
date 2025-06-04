/*

JOINS E SUBCONSULTAS

*/

use restaurante;

-- Selecionando com INNER JOIN
select produtos.id_produto, produtos.nome, produtos.descricao, info_produtos.ingredientes
from produtos 
inner join info_produtos on produtos.id_produto = info_produtos.id_produto;

-- Selecionando com LEFT JOIN
select produtos.id_produto, produtos.nome, produtos.descricao, info_produtos.ingredientes
from produtos 
left join info_produtos on produtos.id_produto = info_produtos.id_produto;


-- Selecionando com INNER JOIN
select pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, clientes.nome, clientes.email
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente;

-- Selecionando com LEFT JOIN
select pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, clientes.nome, clientes.email
from pedidos
left join clientes on pedidos.id_cliente = clientes.id_cliente;


-- Selecionando com 2 INNER JOIN
select pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, clientes.nome as cliente_nome, clientes.email, funcionarios.nome as funcionario_nome
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente
inner join funcionarios on pedidos.id_funcionario = funcionarios.id_funcionario;

-- Selecionando com 2 LEFT JOIN
select pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, clientes.nome as cliente_nome, clientes.email, funcionarios.nome as funcionario_nome
from pedidos
left join clientes on pedidos.id_cliente = clientes.id_cliente
left join funcionarios on pedidos.id_funcionario = funcionarios.id_funcionario;


-- Selecionando com 3 INNER JOIN
select pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, 
clientes.nome as cliente_nome, clientes.email, 
funcionarios.nome as funcionario_nome,
produtos.nome as produto_nome, produtos.preco
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente
inner join funcionarios on pedidos.id_funcionario = funcionarios.id_funcionario
inner join produtos on pedidos.id_produto = produtos.id_produto;

-- Selecionando com 3 LEFT JOIN
select pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, 
clientes.nome as cliente_nome, clientes.email, 
funcionarios.nome as funcionario_nome,
produtos.nome as produto_nome, produtos.preco
from pedidos
left join clientes on pedidos.id_cliente = clientes.id_cliente
left join funcionarios on pedidos.id_funcionario = funcionarios.id_funcionario
left join produtos on pedidos.id_produto = produtos.id_produto;

-- Mostra os clientes com pedidos Pendentes
select clientes.nome, pedidos.id_pedido, pedidos.status_pedido
from clientes
join pedidos on clientes.id_cliente = pedidos.id_cliente
where status_pedido = 'Pendente'
order by pedidos.id_pedido desc;


-- Clientes sem pedidos
select nome
from clientes
where id_cliente in (select id_cliente from pedidos where status_pedido is null);

-- Clientes sem pedidos
SELECT
  clientes.nome,
  pedidos.status_pedido
FROM clientes 
JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente
WHERE pedidos.status_pedido is null;

-- Total de pedido por cliente
select nome,
	(select count(*) from pedidos where pedidos.id_cliente = clientes.id_cliente) as total_pedidos
from clientes;

-- Total pedido por cliente juntando nomes repetidos
SELECT clientes.nome, COUNT(pedidos.id_pedido) AS total_pedidos
FROM clientes
LEFT JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente
GROUP BY clientes.nome
ORDER BY total_pedidos DESC;

-- Preço total de cada pedido
select nome,
  (
    select sum(pedidos.quantidade * produtos.preco)
    from pedidos
    join produtos on pedidos.id_produto = produtos.id_produto
    where pedidos.id_cliente = clientes.id_cliente
  ) as total_pedido
from clientes
order by total_pedido desc;