-- 1)
SELECT 
   p.id,
   p.status,
   p.cliente_id,
   pr.id,
   pr.nome,
   pr.tipo,
   pr.preco,
   pr.pts_de_lealdade pontos_de_lealdade_do_produto
   
FROM
   produtos_pedidos pd

JOIN
	pedidos p ON p.id = pd.pedido_id
JOIN 
    produtos pr ON pr.id = pd.produto_id;



-- 2)
SELECT
	p.id
FROM
	produtos_pedidos pd
JOIN
	pedidos p ON p.id = pd.pedido_id
JOIN 
    produtos pr ON pr.id = pd.produto_id
WHERE 
    pr.nome = 'Fritas';



-- 3)
SELECT
	c.nome gostam_de_fritas
FROM
	produtos_pedidos pd
JOIN
	clientes c ON c.id = pd.pedido_id
JOIN 
    produtos pr ON pr.id = pd.produto_id
WHERE 
    pr.nome = 'Fritas';



-- 4)
SELECT 
    SUM(pr.preco)
FROM
	produtos_pedidos pd
JOIN
	clientes c ON c.id = pd.pedido_id
JOIN 
    produtos pr ON pr.id = pd.produto_id
WHERE 
    c.nome = 'Laura';


-- 5)
SELECT
	pr.nome, COUNT(*)
FROM
	produtos_pedidos pd
JOIN
	pedidos p ON p.id = pd.pedido_id
JOIN 
    produtos pr ON pr.id = pd.produto_id
GROUP BY 
    pr.nome
ORDER BY pr.nome;