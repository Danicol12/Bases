-- 1. Vehículos disponibles en una ciudad específica (ej. Pereira)
SELECT v.fabricante, v.matricula, s.localidad
FROM vehiculo v
JOIN sucursal s ON s.id_sucursal = v.id_sucursal
LEFT JOIN alquiler a ON v.matricula = a.placa_auto 
  AND CURRENT_DATE BETWEEN a.fecha_inicio AND a.fecha_fin
WHERE a.id_alquiler IS NULL AND s.localidad = 'Pereira';

-- 2. Alquileres activos hoy con datos del cliente y vehículo
SELECT c.nombres, c.apellidos, c.documento, v.fabricante, v.matricula
FROM cliente c
JOIN alquiler a ON c.documento = a.doc_cliente
JOIN vehiculo v ON v.matricula = a.placa_auto
WHERE CURRENT_DATE BETWEEN a.fecha_inicio AND a.fecha_fin;

-- 3. Ingresos totales por sucursal (vehículos con más de 3 alquileres)
SELECT s.localidad, SUM(p.monto) AS ingresos_totales
FROM pago p
JOIN alquiler a ON p.id_renta_ref = a.id_alquiler
JOIN vehiculo v ON v.matricula = a.placa_auto
JOIN sucursal s ON v.id_sucursal = s.id_sucursal
WHERE v.matricula IN (
    SELECT placa_auto
    FROM alquiler
    GROUP BY placa_auto
    HAVING COUNT(*) > 3
)
GROUP BY s.localidad;

-- 4. Vehículos alquilados más de 5 veces
SELECT *
FROM vehiculo
WHERE matricula IN (
    SELECT placa_auto
    FROM alquiler
    GROUP BY placa_auto
    HAVING COUNT(*) > 5
);

-- 5. Total de pagos recibidos
SELECT SUM(monto) AS total_pagado
FROM pago;