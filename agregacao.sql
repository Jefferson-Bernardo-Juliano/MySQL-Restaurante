/* Utilizando função agregação */

use restaurante;

select sum(quantidade) from pedidos; -- Somatoria quantidade total de pedidos

select count(distinct id_cliente) from pedidos; -- Quantidade de clientes únicos que realizaram pedidos
select id_cliente, count(*) from pedidos group by id_cliente; -- Total de pedidos realizados por cliente

select round(avg(preco),2) from produtos; -- Média de preço dos produtos

select max(preco) from produtos; -- Preço maximo produto
select min(preco) from produtos; -- Preço minimo produto

select nome, preco, rank() over (order by preco desc) as ranking_preco 
from produtos limit 5; -- Nome e o preço do produto, rank dos 5 produtos mais caros

select categoria, round(avg(preco),2) as media_preco 
from produtos group by categoria; -- Média dos preços dos produtos agrupados por categoria

select fornecedor, count(distinct id_produto) as total_produtos 
from info_produtos group by fornecedor; -- Quantidade de produtos que vieram de cada fornecedor

select fornecedor, count(distinct id_produto) as total_produtos 
from info_produtos group by fornecedor having count(distinct id_produto) > 1; -- Fornecedor com mais de 1 produto cadastrado

select id_cliente, count(distinct id_pedido) as total_pedido 
from pedidos group by id_cliente having count(distinct id_pedido) = 1; -- Clientes que realizaram 1 pedido

