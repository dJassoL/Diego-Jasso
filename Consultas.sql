-- Consultas acerca de la base de datos

-- Cambiamos a la base rapidos_furiosos

USE rapidos_furiosos;

-- Primer Consulta
-- Resumen del Total de Ventas y el Monto Total Recaudado en 2022 por sucursal

SELECT 
    s.nombre_sucursal AS "Sucursal",
    COUNT(v.id_venta) AS "Total de Ventas",
    FORMAT(SUM(a.precio), 2) AS "Monto Total"
FROM 
    ventas v
INNER JOIN empleado e ON v.id_empleado = e.id_empleado
INNER JOIN sucursal s ON e.id_sucursal = s.id_sucursal
INNER JOIN auto a ON v.id_venta = a.id_auto
WHERE 
    YEAR(v.fecha) = 2022
GROUP BY 
    s.nombre_sucursal
ORDER BY 
    SUM(a.precio) DESC;


-- Segunda Consulta
-- ¿Qué empleados realizaron más ventas y cuál fue el ingreso generado por cada uno en 2022?

SELECT 
    e.id_empleado AS "id Empleado",
    COUNT(v.id_venta) AS "Total de Ventas",
    FORMAT(SUM(a.precio), 2) AS "Ingreso Generado"
FROM 
    ventas v
INNER JOIN empleado e ON v.id_empleado = e.id_empleado
INNER JOIN auto a ON v.id_venta = a.id_auto
WHERE 
    YEAR(v.fecha) = 2022
GROUP BY 
    e.id_empleado
ORDER BY 
    SUM(a.precio) DESC;

-- Tercer Consulta
-- ¿Cuáles son las marcas más vendidas y cuál fue el ingreso total generado por cada una en 2022?

SELECT 
    m.marca AS "Marca",
    COUNT(v.id_venta) AS "Total de Ventas",
    FORMAT(SUM(a.precio), 2) AS "Ingreso Generado"
FROM 
    ventas v
INNER JOIN auto a ON v.id_venta = a.id_auto
INNER JOIN marca m ON a.id_marca = m.id_marca
WHERE 
    YEAR(v.fecha) = 2022
GROUP BY 
    m.marca
ORDER BY 
    SUM(a.precio) DESC;

-- Cuarta Consulta
-- ¿Qué clientes realizaron la mayor cantidad de compras en 2022, cuánto gastaron en total y cuáles fueron los modelos que compraron?

SELECT 
    CONCAT(c.nombre, ' ', c.apellido_pa, ' ', c.apellido_ma) AS "Cliente",
    COUNT(v.id_venta) AS "Total de Compras",
    FORMAT(SUM(a.precio), 2) AS "Gasto Total",
    JSON_ARRAYAGG(m.marca) AS "Marcas Compradas"
FROM 
    ventas v
INNER JOIN cliente c ON v.id_cliente = c.id_cliente
INNER JOIN auto a ON v.id_venta = a.id_auto
INNER JOIN (
    SELECT DISTINCT id_auto, marca
    FROM auto a
    INNER JOIN marca m ON a.id_marca = m.id_marca
) AS m ON a.id_auto = m.id_auto
WHERE 
    YEAR(v.fecha) = 2022
GROUP BY 
    c.id_cliente, c.nombre, c.apellido_pa, c.apellido_ma
ORDER BY 
    SUM(a.precio) DESC;

-- Quinta Consulta 
-- ¿Cuál es el promedio de gasto por cliente en las ventas realizadas en 2022?

SELECT 
    FORMAT(AVG(gasto_total), 2) AS "Promedio de Gasto por Cliente"
FROM (
    SELECT 
        c.id_cliente,
        SUM(a.precio) AS gasto_total
    FROM 
        ventas v
    INNER JOIN cliente c ON v.id_cliente = c.id_cliente
    INNER JOIN auto a ON v.id_venta = a.id_auto
    WHERE 
        YEAR(v.fecha) = 2022
    GROUP BY 
        c.id_cliente
) AS gasto_por_cliente;

-- Sexta Consulta 
-- ¿Cuáles fueron los 5 autos más caros vendidos en 2022 y sus clientes respectivos?

SELECT 
    top_autos.id_auto AS "ID Auto",
    FORMAT(top_autos.precio, 2) AS "Precio",
    m.marca AS "Marca",
    mo.modelo AS "Modelo",
    a.color AS "Color",
    CONCAT(c.nombre, ' ', c.apellido_pa, ' ', c.apellido_ma) AS "Cliente"
FROM 
    (SELECT id_auto, precio 
     FROM auto 
     ORDER BY precio DESC 
     LIMIT 5) AS top_autos
INNER JOIN auto a ON top_autos.id_auto = a.id_auto
INNER JOIN marca m ON a.id_marca = m.id_marca
INNER JOIN modelo mo ON a.id_modelo = mo.id_modelo
INNER JOIN ventas v ON top_autos.id_auto = v.id_venta
INNER JOIN cliente c ON v.id_cliente = c.id_cliente
WHERE 
    YEAR(v.fecha) = 2022;

-- Septima Consulta
-- ¿Cuáles fueron los 5 autos más baratos vendidos en 2022 y sus clientes respectivos?

SELECT 
    bottom_autos.id_auto AS "ID Auto",
    FORMAT(bottom_autos.precio, 2) AS "Precio",
    m.marca AS "Marca",
    mo.modelo AS "Modelo",
    a.color AS "Color",
    CONCAT(c.nombre, ' ', c.apellido_pa, ' ', c.apellido_ma) AS "Cliente"
FROM 
    (SELECT id_auto, precio 
     FROM auto 
     ORDER BY precio ASC 
     LIMIT 5) AS bottom_autos
INNER JOIN auto a ON bottom_autos.id_auto = a.id_auto
INNER JOIN marca m ON a.id_marca = m.id_marca
INNER JOIN modelo mo ON a.id_modelo = mo.id_modelo
INNER JOIN ventas v ON bottom_autos.id_auto = v.id_venta
INNER JOIN cliente c ON v.id_cliente = c.id_cliente
WHERE 
    YEAR(v.fecha) = 2022;

-- Octava Consulta
-- ¿Qué empleados recibieron los premios más altos en 2022 y cuál es el monto?
SELECT 
    p.id_empleado AS "ID Empleado",
    FORMAT(p.monto, 2) AS "Monto del Premio",
    CASE 
        WHEN MONTH(p.fecha) BETWEEN 1 AND 3 THEN '1er Trimestre'
        WHEN MONTH(p.fecha) BETWEEN 4 AND 6 THEN '2do Trimestre'
        WHEN MONTH(p.fecha) BETWEEN 7 AND 9 THEN '3er Trimestre'
        WHEN MONTH(p.fecha) BETWEEN 10 AND 12 THEN '4to Trimestre'
    END AS "Trimestre"
FROM 
    premio p
WHERE 
    YEAR(p.fecha) = 2022
ORDER BY 
    p.monto DESC
LIMIT 10;


-- Novena Consulta 
-- ¿Cuál ha sido el gasto destinado en Premios de los empleados?

SELECT 
    '1er Trimestre' AS "Trimestre",
    FORMAT(SUM(p.monto), 2) AS "Gasto en Premios"
FROM 
    premio p
WHERE 
    YEAR(p.fecha) = 2022 AND MONTH(p.fecha) BETWEEN 1 AND 3

UNION

SELECT 
    '2do Trimestre' AS "Trimestre",
    FORMAT(SUM(p.monto), 2) AS "Gasto en Premios"
FROM 
    premio p
WHERE 
    YEAR(p.fecha) = 2022 AND MONTH(p.fecha) BETWEEN 4 AND 6

UNION

SELECT 
    '3er Trimestre' AS "Trimestre",
    FORMAT(SUM(p.monto), 2) AS "Gasto en Premios"
FROM 
    premio p
WHERE 
    YEAR(p.fecha) = 2022 AND MONTH(p.fecha) BETWEEN 7 AND 9

UNION

SELECT 
    '4to Trimestre' AS "Trimestre",
    FORMAT(SUM(p.monto), 2) AS "Gasto en Premios"
FROM 
    premio p
WHERE 
    YEAR(p.fecha) = 2022 AND MONTH(p.fecha) BETWEEN 10 AND 12;

-- Decima Consulta
-- ¿Cuál es el Total de Clinetes por Estado?

SELECT 
    es.estado AS "Estado",
    COUNT(c.id_cliente) AS "Total de Clientes"
FROM 
    cliente c
INNER JOIN direccion d ON c.id_direccion = d.id_direccion
INNER JOIN municipio m ON d.id_municipio = m.id_municipio
INNER JOIN estado es ON m.id_estado = es.id_estado
GROUP BY 
    es.estado
ORDER BY 
    COUNT(c.id_cliente) DESC;


-- Decimo Primera Consulta
-- ¿Cuál es la edad Promedio de los Clientes?

SELECT 
    ROUND(AVG(YEAR(CURDATE()) - YEAR(fecha_nacimiento) - 
         (DATE_FORMAT(CURDATE(), '%m-%d') < DATE_FORMAT(fecha_nacimiento, '%m-%d'))), 2) AS "Edad Promedio"
FROM 
    cliente;

-- =====================================================================================
-- Procedimiento Almacenado
-- Registro de un Nuevo Cliente
DROP PROCEDURE IF EXISTS registrar_cliente;

DELIMITER $$
-- Crear el procedimiento si no existe
CREATE PROCEDURE registrar_cliente(
    IN nombre VARCHAR(30),
    IN apellido_pa VARCHAR(30),
    IN apellido_ma VARCHAR(30),
    IN fecha_nacimiento DATE,
    IN id_direccion INT
)
BEGIN
    INSERT INTO cliente (nombre, apellido_pa, apellido_ma, fecha_nacimiento, id_direccion)
    VALUES (nombre, apellido_pa, apellido_ma, fecha_nacimiento, id_direccion);

    SELECT LAST_INSERT_ID() AS "Nuevo ID Cliente";
END$$

DELIMITER ;

CALL registrar_cliente('Carlos', 'López', 'Hernández', '1990-05-15', 101);
-- =====================================================================================

-- =====================================================================================
-- Trigger
-- Si después de registrar una nueva venta, se detecta que el empleado realizo 10 ventas, 
-- se le otorgara un premio de $1500 y se resgistrara automaticamente en la tabla premio

DELIMITER $$

CREATE TRIGGER premio_por_ventas
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
 
    DECLARE total_ventas INT;

    SELECT COUNT(*) INTO total_ventas
    FROM ventas
    WHERE id_empleado = NEW.id_empleado;

    IF total_ventas = 10 THEN
        INSERT INTO premio (id_empleado, fecha, monto)
        VALUES (NEW.id_empleado, NEW.fecha, 1500.00);
    END IF;
END$$

DELIMITER ;

-- Insertamos un nuevo empleado --

INSERT INTO empleado (id_empleado,id_sucursal, fecha_ingreso)
VALUES (1000,1, '2024-11-01');

-- Buscamos si tiene premio --

SELECT * FROM premio WHERE id_empleado = 1000;

-- Insertamos 10 ventas a este nuevo empleado --

INSERT INTO ventas (id_cliente, id_empleado, fecha)
VALUES (31, 1000, '2024-11-20 10:00:00'),
(34, 1000, '2024-11-21 11:00:00'),
(35, 1000, '2024-11-22 12:00:00'),
(36, 1000, '2024-11-23 13:00:00'),
(37, 1000, '2024-11-24 14:00:00'),
(38, 1000, '2024-11-25 15:00:00'),
(39, 1000, '2024-11-26 16:00:00'),
(40, 1000, '2024-11-27 17:00:00'),
(41, 1000, '2024-11-28 18:00:00'),
(42, 1000, '2024-11-29 19:00:00');

-- Volvemos a buscar si tiene premio --

SELECT * FROM premio WHERE id_empleado = 1000;
-- =====================================================================================


-- =====================================================================================
-- Función  
-- Identifica al empleado del mes que ha vendido la mayor cantidad de autos en un mes específico. 

DROP FUNCTION IF EXISTS empleado_del_mes;
DELIMITER $$

CREATE FUNCTION empleado_del_mes(mes VARCHAR(7))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE empleado_info VARCHAR(255);
    DECLARE empleado_id INT;
    DECLARE ultimo_premio_fecha DATE;
    DECLARE ultimo_premio_monto DECIMAL(10,2);

    SELECT v.id_empleado
    INTO empleado_id
    FROM ventas v
    WHERE DATE_FORMAT(v.fecha, '%Y-%m') = mes
    GROUP BY v.id_empleado
    ORDER BY COUNT(v.id_venta) DESC
    LIMIT 1;

    SELECT MAX(p.fecha), MAX(p.monto)
    INTO ultimo_premio_fecha, ultimo_premio_monto
    FROM premio p
    WHERE p.id_empleado = empleado_id;

    SELECT 
        CONCAT(
            'Empleado ID: ', e.id_empleado, ', ',
            'Antigüedad: ', TIMESTAMPDIFF(YEAR, e.fecha_ingreso, CURDATE()), ' años, ',
            'Autos Vendidos: ', (SELECT COUNT(*) FROM ventas WHERE id_empleado = empleado_id AND DATE_FORMAT(fecha, '%Y-%m') = mes), ', ',
            'Último Premio: ', ultimo_premio_fecha, ', ',
            'Monto del Premio: ', ultimo_premio_monto, ' pesos')
    INTO empleado_info
    FROM empleado e
    WHERE e.id_empleado = empleado_id;

    RETURN empleado_info;
END$$

DELIMITER ;

SELECT empleado_del_mes('2022-07') AS empleado_mes;
-- =====================================================================================







