
SELECT DISTINCT c.Nombre, c.Apellido
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN DetallePlatillo dp ON f.id_factura = dp.id_factura;

SELECT DISTINCT c.Nombre, c.Apellido
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN DetallePlatillo dp ON f.id_factura = dp.id_factura
JOIN Platillo p ON dp.id_platillo = p.id_platillo
WHERE p.Nombre = 'Arroz a la marinera';

SELECT m.Nombre, f.Fecha_factura
FROM Factura f
JOIN Mesero m ON f.id_mesero = m.id_mesero
JOIN Mesa ms ON f.id_mesa = ms.id_mesa
WHERE ms.id_mesa = 10 AND ms.Ubicacion = 'Segundo piso';


SELECT c.Nombre AS Cliente, b.Nombre AS Bebida
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN DetalleBebida db ON f.id_factura = db.id_factura
JOIN Bebida b ON db.id_bebida = b.id_bebida;


SELECT f.id_factura, c.Nombre AS Cliente, p.Nombre AS Platillo, p.Importe
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
JOIN DetallePlatillo dp ON f.id_factura = dp.id_factura
JOIN Platillo p ON dp.id_platillo = p.id_platillo
WHERE p.Importe > 300000;

SELECT c.Nombre, c.Apellido,
       SUM(p.Importe) + SUM(b.Importe) AS Total_Consumo
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
LEFT JOIN DetallePlatillo dp ON f.id_factura = dp.id_factura
LEFT JOIN Platillo p ON dp.id_platillo = p.id_platillo
LEFT JOIN DetalleBebida db ON f.id_factura = db.id_factura
LEFT JOIN Bebida b ON db.id_bebida = b.id_bebida
WHERE c.Nombre = 'Manuel' AND c.Apellido = 'Pedroza Gonzalez'
GROUP BY c.Nombre, c.Apellido;

SELECT DISTINCT m.id_mesa, m.Ubicacion, m.num_Comensales
FROM Mesa m
JOIN Factura f ON m.id_mesa = f.id_mesa;

--Crear Views

CREATE VIEW VistaConsumoCliente AS
SELECT 
    c.Nombre AS NombreCliente,
    b.Nombre AS Bebida,
    p.Nombre AS Platillo,
    f.Fecha_factura,
    b.Importe AS ImporteBebida,
    p.Importe AS ImportePlatillo
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
JOIN Bebida b ON f.id_bebida = b.id_bebida
JOIN Platillo p ON f.id_platillo = p.id_platillo;

CREATE VIEW VistaMeseroFacturas AS
SELECT 
    m.Nombre AS NombreMesero,
    m.Apellido1,m.Apellido2,f.id_factura,f.Fecha_factura,
    me.id_mesa
FROM Factura f
JOIN Mesero m ON f.id_mesero = m.id_mesero
JOIN Mesa me ON f.id_mesa = me.id_mesa;

CREATE VIEW VistaTotalCompraCliente AS
SELECT 
    c.Nombre AS NombreCliente, c.Apellido,
    SUM(p.Importe + b.Importe) AS TotalGastado
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida
GROUP BY c.id_cliente, c.Nombre, c.Apellido;