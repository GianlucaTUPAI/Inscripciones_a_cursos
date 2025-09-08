INSERT INTO clientes (nombre, direccion, telefono)
VALUES	("Kennett", "Calle Falsa 123", "12345678"),
		("Nicolas", "Galvarino 0424", "87654321"),
        ("Alfredo", "Ines de Bazan 8912", "12344321"),
		("Candela", "Luis Uribe Diaz 1234", "87655678"),
		("Francisca", "Ancud 8976", "90879807");
---------------------------------
INSERT INTO pedidos (fecha_pedido, total, clientes_ID)
VALUES	('2025-09-05', 28.0, 1),
		('2025-09-05', 16.0, 2),
		('2025-09-05', 30.0, 3),
		('2025-09-05', 17.0, 4),
		('2025-09-05', 24.0, 5),
		('2025-09-05', 37.0, 5),
		('2025-09-05', 28.0, 4),
		('2025-09-05', 16.0, 3),
		('2025-09-05', 100.0, 2),
		('2025-09-05', 50.0, 1);
---------------------------------
SELECT c.ID, c.nombre, p.fecha_pedido, p.total, p.clientes_ID
FROM clientes c JOIN pedidos p
ON c.ID = p.clientes_ID;
---------------------------------
SELECT *
FROM pedidos
WHERE clientes_ID = 1;
---------------------------------
SELECT c.ID, c.nombre, SUM(p.total) AS total_pedidos
FROM clientes c LEFT JOIN pedidos p ON c.ID = p.clientes_ID
GROUP BY c.ID, c.nombre;
---------------------------------
SELECT c.ID, c.nombre, SUM(p.total) AS 'total_pedidos'
FROM clientes c
LEFT JOIN pedidos p ON c.ID = p.clientes_ID
GROUP BY c.ID, c.nombre;
---------------------------------
DELETE FROM pedidos 
WHERE clientes_ID = 1;
DELETE FROM clientes 
WHERE ID = 1;
---------------------------------
SELECT c.ID, c.nombre, COUNT(p.clientes_ID) AS numero_pedidos
FROM clientes c LEFT JOIN pedidos p 
ON c.ID = p.clientes_ID
GROUP BY c.ID, c.nombre
ORDER BY numero_pedidos DESC
LIMIT 3;