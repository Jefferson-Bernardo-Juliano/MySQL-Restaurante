/* 
Consultas avançadas
*/

use restaurante;
 
 -- View entre as tabelas pedidos, clientes, funcionarios e produtos
create view resumo_pedido as
select c.nome as cliente_nome, c.email,
pe.id_pedido, pe.quantidade, pe.data_pedido,
f.nome as funcionario_nome,
pr.nome as produto_nome, pr.preco
from clientes c
join pedidos pe on c.id_cliente = pe.id_cliente
join funcionarios f on pe.id_funcionario = f.id_funcionario
join produtos pr on pe.id_produto = pr.id_produto
order by c.nome;


-- Total de cada pedido
select id_pedido, cliente_nome, quantidade * preco as total
from resumo_pedido;

-- Atualizando view resumo_pedido, adicionando campo TOTAL
create or replace view resumo_pedido as
select c.nome as cliente_nome, c.email,
pe.id_pedido, pe.quantidade, pe.data_pedido,
f.nome as funcionario_nome,
pr.nome as produto_nome, pr.preco,
pe.quantidade * pr.preco as total -- Campo TOTAL
from clientes c
join pedidos pe on c.id_cliente = pe.id_cliente
join funcionarios f on pe.id_funcionario = f.id_funcionario
join produtos pr on pe.id_produto = pr.id_produto
order by c.nome;

-- Total de cada pedido com o campo total adicionado
select id_pedido, cliente_nome, total
from resumo_pedido;

-- Uso do explain para verificar join oculto
explain
select id_pedido, cliente_nome, total
from resumo_pedido;

-- Função para retornar ingredientes
DELIMITER //
create function BuscaIngredientesProduto(produtoID int)
returns varchar(200)
reads sql data
begin
	declare ingredientesProdutos varchar(200);
    select ingredientes into ingredientesProdutos from info_produtos where id_produto = produtoID;
    return ingredientesProdutos;
end //
DELIMITER ;

-- Executando a função
select BuscaIngredientesProduto(10);

-- Função para retornar se o pedido está acima, média ou baixo
DELIMITER //
create function mediaPedido(pedidoID int)
returns varchar(200)
reads sql data
begin
    declare totalPedido decimal(10,2);
    declare valor varchar(200);

    select coalesce(sum(p.quantidade * pr.preco), 0) into totalPedido
    FROM pedidos p
    join produtos pr on p.id_produto = pr.id_produto
    where p.id_pedido = pedidoID;

    set valor =
        case
            when totalPedido = 0 then 'Sem Pedido'
            when totalPedido <= 20 then 'Baixo'
            when totalPedido <= 50 then 'Média'
            else 'Acima'
        end;

    return valor;
end //
DELIMITER ;

-- Executando a função
select mediaPedido(5);
select mediaPedido(6);
