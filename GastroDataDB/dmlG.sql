-- CLIENTES
INSERT INTO Cliente (id_cliente, Nombre, Apellido, Observaciones) VALUES
(1, 'Manuel', 'Pedroza Gonzalez', NULL),
(2, 'Lucía', 'Ramírez', NULL),
(3, 'Andrea', 'Martínez', NULL),
(4, 'Luis', 'González', NULL);

-- MESEROS
INSERT INTO Mesero (id_mesero, Nombre, Apellido1, Apellido2) VALUES
(1, 'Carlos', 'Méndez', 'Pérez'),
(2, 'Ana', 'Lopez', 'Jimenez');

-- MESAS
INSERT INTO Mesa (id_mesa, num_Comensales, Ubicacion) VALUES
(10, 4, 'Segundo piso'),
(5, 2, 'Primer piso'),
(20, 6, 'Terraza'),
(30, 3, 'Segundo piso');

-- PLATILLOS
INSERT INTO Platillo (id_platillo, Nombre, Importe) VALUES
(1, 'Arroz a la marinera', 350000),
(2, 'Ensalada César', 150000),
(3, 'Spaghetti Bolognese', 200000),
(4, 'Tacos al Pastor', 120000);

-- BEBIDAS
INSERT INTO Bebida (id_bebida, Nombre, Importe) VALUES
(1, 'Jugo de naranja', 10000),
(2, 'Cerveza artesanal', 20000),
(3, 'Coca Cola', 8000),
(4, 'Agua Mineral', 6000);

-- FACTURAS
INSERT INTO Factura (id_factura, Fecha_factura, id_cliente, id_mesero, id_mesa) VALUES
(1, '2024-05-01', 1, 1, 10),
(2, '2024-05-02', 2, 1, 5),
(3, '2024-05-03', 3, 2, 30),
(4, '2024-05-04', 4, 2, 20),
(5, '2024-05-05', 1, 1, 10);

-- DETALLE PLATILLO
INSERT INTO DetallePlatillo (id_factura, id_platillo) VALUES
(1, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 4),
(5, 1);

-- DETALLE BEBIDA
INSERT INTO DetalleBebida (id_factura, id_bebida) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(4, 4),
(5, 1);