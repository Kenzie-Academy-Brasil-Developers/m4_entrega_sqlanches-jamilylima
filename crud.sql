-- Criação
-- 1)
INSERT INTO clientes
   (nome, lealdade)
VALUES
   ('Georgia',0);


-- 2)
INSERT INTO pedidos 
    (status, cliente_id)
VALUES
    ('Recebido', 6);


-- 3)
INSERT INTO produtos_pedidos
    (pedido_id, produto_id)
VALUES
    (6,1),
    (6,2),
    (6,6),
    (6,8),
    (6,8);
      

-- Leitura
-- 1)
SELECT 
   c.id,
   c.nome,
   c.lealdade,
   p.id,
   p.status,
   p.cliente_id,
   pr.id,
   pr.nome,
   pr.tipo,
   pr.preco,
   pr.pts_de_lealdade 
   
FROM
   produtos_pedidos pd

JOIN
	pedidos p ON p.id = pd.pedido_id
JOIN
	clientes c ON c.id = pd.pedido_id    
JOIN 
    produtos pr ON pr.id = pd.produto_id
WHERE c.nome = 'Georgia'; 


-- Atualização
-- 1)
UPDATE
    clientes
SET
	lealdade = (SELECT SUM(lealdade) FROM clientes)
WHERE 
    nome = 'Georgia'
RETURNING *;



-- Deleção
-- 1)
DELETE FROM 
    clientes 
WHERE id = 4;

