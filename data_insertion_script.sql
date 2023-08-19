use personal_expenses_tracking;

/* ------------- INSERCIÓN DE DATOS ------------- */

# Usuario 1:
INSERT INTO user (first_name, last_name, email, password) VALUES 
	('Franco', 'Ponzio', 'franco@example.com', '123');
INSERT INTO transaction_category (id_user, description, color) VALUES
	(1, 'Comida', 'red'),
	(1, 'Ropa', 'blue'),
	(1, 'Salidas', 'green'),
	(1, 'Servicios', 'yellow');
INSERT INTO payment_method (id_user, description) VALUES
	(1, 'Efectivo/Débito'), (1, 'Crédito');
INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES
	(1, 1, 1, 10, current_timestamp(), 'Mi primera transacción'),
	(1, 2, 2, 9.25, current_timestamp(), 'Mi segunda transacción'),
	(1, 4, 1, 2.75, current_timestamp(), 'Mi tercera transacción'),
	(1, 3, 1, 22.50, current_timestamp(), 'Mi cuarta transacción');

# Usuario 2:
INSERT INTO user (first_name, last_name, email, password) VALUES 
	('Daniel', 'Gonzalez', 'daniel@example.com', 'abc');
INSERT INTO transaction_category (id_user, description, color) VALUES
	(2, 'Gastos varios', 'red'),
	(2, 'Comida', 'blue'),
	(2, 'Viajes', 'green');
INSERT INTO payment_method (id_user, description) VALUES
	(2, 'Efectivo/Débito'), (2, 'Crédito');
INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES 
	(2, 5, 3, 20.50, '2023-07-15 09:00:00', 'Compra de ropa'),
	(2, 6, 4, 40.75, '2023-07-15 13:30:00', 'Compra de comida'),
	(2, 5, 3, 100.00, '2023-07-15 16:45:00', 'Pago de internet');

# Usuario 3:
INSERT INTO user (first_name, last_name, email, password) VALUES 
	('Lucas', 'Gomez', 'lucas@example.com', 'xyz');
INSERT INTO transaction_category (id_user, description, color) VALUES
	(3, 'Cursos', 'yellow'),
    (3, 'Articulos para la casa', 'blue'),
    (3, 'Comida', 'gray'),
    (3, 'Servicios', 'green'),
    (3, 'Varios', 'green');
INSERT INTO payment_method (id_user, description) VALUES
	(3, 'Efectivo/Débito'), (3, 'Crédito');
INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES
	(3, 11, 5, 50.00, '2023-07-15 12:00:00', 'Pago de gas'),
	(3, 10, 6, 10.20, '2023-07-15 14:30:00', 'Compra de comida'),
	(3, 9, 5, 35.75, '2023-07-15 16:30:00', 'Articulos de limpieza');

# Usuario 4:
INSERT INTO user (first_name, last_name, email, password) VALUES 
	('Pepe', 'Diaz', 'pepe@example.com', 'xyz');
INSERT INTO transaction_category (id_user, description, color) VALUES
	(4, 'Ropa', 'yellow'),
    (4, 'Tecnologia', 'blue'),
    (4, 'Comida', 'gray'),
    (4, 'Servicios', 'green'),
    (4, 'Varios', 'green');
INSERT INTO payment_method (id_user, description) VALUES
	(4, 'Efectivo/Débito'), (4, 'Crédito');
INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES
	(4, 15, 7, 50.00, '2023-07-15 12:10:30', 'Computadora'),
	(4, 16, 8, 10.20, '2023-07-15 14:34:50', 'Compra de comida'),
	(4, 18, 7, 35.75, '2023-07-13 16:20:01', 'Salida al parque');
    
# Usuario 5:
INSERT INTO user (first_name, last_name, email, password) VALUES 
	('Carlos', 'Martinez', 'carlitos@example.com', 'xyz');
INSERT INTO transaction_category (id_user, description, color) VALUES
    (5, 'Comida', 'gray'),
    (5, 'Servicios', 'green'),
    (5, 'Varios', 'green');
INSERT INTO payment_method (id_user, description) VALUES
	(5, 'Efectivo/Débito'), (5, 'Crédito');
INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES
	(4, 21, 8, 400.75, '2023-07-22 12:10:30', 'Computadora'),
	(4, 20, 8, 10.50, '2023-07-25 14:34:50', 'Servicio de agua'),
	(4, 21, 9, 325.75, '2023-07-23 16:20:01', 'Celular');
    

# Usuario 6:
INSERT INTO user (first_name, last_name, email, password) VALUES 
    ('Ana', 'García', 'ana@example.com', 'password');

INSERT INTO transaction_category (id_user, description, color) VALUES
    (6, 'Compras', 'blue'),
    (6, 'Entretenimiento', 'green'),
    (6, 'Transporte', 'yellow');

INSERT INTO payment_method (id_user, description) VALUES
    (6, 'Efectivo/Débito'), 
    (6, 'Crédito');

INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES
    (6, 22, 10, 30.50, '2023-07-15 09:30:00', 'Compra en tienda'),
    (6, 23, 11, 15.75, '2023-07-15 14:00:00', 'Boletos de cine'),
    (6, 24, 10, 5.25, '2023-07-15 18:15:00', 'Viaje en autobús');

# Usuario 7:
INSERT INTO user (first_name, last_name, email, password) VALUES 
    ('Luis', 'Martínez', 'luis@example.com', 'password');

INSERT INTO transaction_category (id_user, description, color) VALUES
    (7, 'Comida', 'red'),
    (7, 'Ropa', 'blue'),
    (7, 'Entretenimiento', 'green');

INSERT INTO payment_method (id_user, description) VALUES
    (7, 'Efectivo/Débito'), 
    (7, 'Crédito');

INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES
    (7, 25, 12, 12.00, '2023-07-15 10:45:00', 'Almuerzo'),
    (7, 26, 13, 50.50, '2023-07-15 15:30:00', 'Compra de ropa'),
    (7, 27, 12, 8.75, '2023-07-15 19:45:00', 'Boletos de concierto');

# Usuario 8:
INSERT INTO user (first_name, last_name, email, password) VALUES 
    ('María', 'López', 'maria@example.com', 'password');

INSERT INTO transaction_category (id_user, description, color) VALUES
    (8, 'Comida', 'red'),
    (8, 'Transporte', 'yellow'),
    (8, 'Salud', 'green');

INSERT INTO payment_method (id_user, description) VALUES
    (8, 'Efectivo/Débito'), 
    (8, 'Crédito');

INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES
    (8, 28, 14, 8.00, '2023-07-15 11:20:00', 'Desayuno'),
    (8, 29, 15, 25.25, '2023-07-15 16:15:00', 'Viaje en taxi'),
    (8, 30, 14, 15.50, '2023-07-15 20:30:00', 'Compra de medicamentos');

# Usuario 9:
INSERT INTO user (first_name, last_name, email, password) VALUES 
    ('Javier', 'Rodríguez', 'javier@example.com', 'password');

INSERT INTO transaction_category (id_user, description, color) VALUES
    (9, 'Compras', 'blue'),
    (9, 'Hogar', 'green'),
    (9, 'Transporte', 'yellow');

INSERT INTO payment_method (id_user, description) VALUES
    (9, 'Efectivo/Débito'), 
    (9, 'Crédito');

INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES
    (9, 31, 16, 50.00, '2023-07-15 12:45:00', 'Compra en línea'),
    (9, 32, 17, 35.75, '2023-07-15 17:30:00', 'Artículos para el hogar'),
    (9, 33, 16, 10.25, '2023-07-15 21:15:00', 'Viaje en metro');

# Usuario 10:
INSERT INTO user (first_name, last_name, email, password) VALUES 
    ('Laura', 'Hernández', 'laura@example.com', 'password');

INSERT INTO transaction_category (id_user, description, color) VALUES
    (10, 'Comida', 'red'),
    (10, 'Entretenimiento', 'green'),
    (10, 'Salud', 'blue');

INSERT INTO payment_method (id_user, description) VALUES
    (10, 'Efectivo/Débito'), 
    (10, 'Crédito');

INSERT INTO transaction (id_user, id_transaction_category, id_payment_method, amount, datetime, description) VALUES
    (10, 34, 18, 15.00, '2023-07-15 14:00:00', 'Almuerzo'),
    (10, 35, 19, 20.50, '2023-07-15 18:45:00', 'Boletos de cine'),
    (10, 36, 18, 5.75, '2023-07-15 22:30:00', 'Compra de vitaminas');
