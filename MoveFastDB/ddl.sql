CREATE TABLE cliente (
    documento INTEGER PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL
);

CREATE TABLE sucursal (
    id_sucursal SERIAL,
    localidad VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    contacto VARCHAR(7) NOT NULL,
    CONSTRAINT pk_sucursal PRIMARY KEY (id_sucursal),
    CONSTRAINT contacto_longitud CHECK (LENGTH(contacto) = 7)
);

CREATE TABLE vehiculo (
    fabricante VARCHAR(100) NOT NULL,
    matricula VARCHAR(6) PRIMARY KEY CHECK(LENGTH(matricula) = 6),
    id_sucursal INT,
    anio INT CHECK(anio BETWEEN 2000 AND 2025),
    color VARCHAR(50),
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE alquiler (
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    id_alquiler SERIAL PRIMARY KEY,
    placa_auto VARCHAR(6),
    doc_cliente INTEGER,
    FOREIGN KEY (placa_auto) REFERENCES vehiculo(matricula)
        ON DELETE SET NULL,
    FOREIGN KEY (doc_cliente) REFERENCES cliente(documento)
        ON DELETE CASCADE
);

CREATE TABLE pago (
    id_transaccion SERIAL PRIMARY KEY,
    monto NUMERIC(10,2) NOT NULL,
    id_renta_ref INT,
    fecha_registro TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (id_renta_ref) REFERENCES alquiler(id_alquiler)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);