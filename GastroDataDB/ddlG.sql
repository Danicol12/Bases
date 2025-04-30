CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Apellido VARCHAR(45),
    Observaciones VARCHAR(45)
);

CREATE TABLE Mesero (
    id_mesero INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Apellido1 VARCHAR(45),
    Apellido2 VARCHAR(45)
);

CREATE TABLE Mesa (
    id_mesa INT PRIMARY KEY,
    num_Comensales INT,
    Ubicacion VARCHAR(45)
);

CREATE TABLE Platillo (
    id_platillo INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Importe INT
);

CREATE TABLE Bebida (
    id_bebida INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Importe INT
);

CREATE TABLE Factura (
    id_factura INT PRIMARY KEY,
    Fecha_factura DATE,
    id_cliente INT,
    id_mesero INT,
    id_mesa INT,
    id_platillo INT,
    id_bebida INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_mesero) REFERENCES Mesero(id_mesero),
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa),
    FOREIGN KEY (id_platillo) REFERENCES Platillo(id_platillo),
    FOREIGN KEY (id_bebida) REFERENCES Bebida(id_bebida)
);