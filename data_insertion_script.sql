use personal_expenses_tracking;

/* ------------- INSERCIÓN DE DATOS ------------- */

# Usuario 1:
INSERT INTO user (first_name, last_name, email, password) VALUES 
	('Franco', 'Ponzio', 'franco@gmail.com', '123');
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
	('Daniel', 'Gonzalez', 'daniel@gmail.com', 'abc');
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
	('Lucas', 'Gomez', 'lucas@gmail.com', 'xyz');
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
	('Pepe', 'Diaz', 'pepe@gmail.com', 'xyz');
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
	('Carlos', 'Martinez', 'carlitos@gmail.com', 'xyz');
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
    
