/* Utilizando condicional no banco de dados restaurante */

use restaurante;

select * from pedidos -- Todos os pedidos que do id funcionário igual a 4 e status é igual a ‘Pendente’
where id_funcionario = 4 and status_pedido = 'Pendente';

select * from pedidos -- Todos os pedidos que o status não é igual a ‘Concluído’
where status_pedido <> 'Concluído';

select * from pedidos -- Pedidos que contenham os id produtos: 1, 3, 5, 7 ou 8
where id_produto in (1, 3, 5, 7, 8);

select * from clientes -- Clientes que começam com a letra c
where nome like 'C%';

select * from info_produtos -- Informações de produtos que contenham nos ingredientes ‘carne’ ou ‘frango’
where ingredientes like 'carne%' or ingredientes like 'frango%';

select * from produtos -- Produtos com o preço entre 20 a 30
where preco between 20 and 30;

UPDATE pedidos -- Atualizar id pedido 6 da tabela pedidos para status = NULL
SET status_pedido = NULL
WHERE id_pedido = 6;

SELECT id_pedido, status_pedido -- Testando atualização 
FROM pedidos
WHERE id_pedido = 6;

select * from pedidos where status_pedido is null; -- Pedidos com status nulos

-- id pedido e o status da tabela pedidos, porém para todos os status nulos, mostrar 'Cancelado'
select id_pedido, status_pedido, ifnull(status_pedido, 'Cancelado') as status_pedido_atualizado from pedidos;

select -- Campo chamado media_salario, que irá mostrar ‘Acima da média’, para o salário > 3000, senão 'Abaixo da média'
	nome,
    cargo,
    salario,
	case
		when salario > 3000 then 'Acima da Média'
        Else 'Abaixo da Média'
	end as media_salario
from funcionarios;