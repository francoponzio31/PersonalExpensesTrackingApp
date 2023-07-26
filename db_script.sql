use personal_expenses_tracking;

/* ------------- CREACIÓN DE TABLAS ------------- */
CREATE TABLE user(
	id int not null auto_increment primary key,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	email varchar(45) not null,
	password varchar(45) not null
);

CREATE TABLE transaction_category(
	id int not null auto_increment primary key,
	id_user int not null,
    description varchar(45) not null,
    color varchar(10) not null
);

CREATE TABLE payment_method(
	id int not null auto_increment primary key,
	id_user int not null,
    description varchar(45) not null
);

CREATE TABLE transaction(
	id int not null auto_increment primary key,
	id_user int not null,
	id_transaction_category int not null,
	id_payment_method int not null,
	amount decimal(20,2) not null,
    datetime datetime not null,
    description varchar(45) not null
);

/* Seteo de claves foraneas */
alter table transaction
add foreign key (id_user) references user(id),
add foreign key (id_transaction_category) references transaction_category(id),
add foreign key (id_payment_method) references payment_method(id);

alter table transaction_category
add foreign key (id_user) references user(id);

alter table payment_method
add foreign key (id_user) references user(id);


/* Seteo de indices */
create index ix_user ON transaction(id_user);
create index ix_transaction_category ON transaction(id_transaction_category);
create index ix_transaction_payment_method ON transaction(id_payment_method);
create index ix_transaction_amount ON transaction(amount);
create index ix_transaction_datetime ON transaction(datetime);

create index ix_transaction_category_user ON transaction_category(id_user);

create index ix_payment_method_user ON payment_method(id_user);


/*	------------- QUERYS ------------- */
select * from user;
select * from transaction_category;
select * from payment_method;
select * from transaction;


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
	(2, 1, 1, 20.50, '2023-07-15 09:00:00', 'Compra de ropa'),
	(2, 2, 2, 40.75, '2023-07-15 13:30:00', 'Compra de comida'),
	(2, 1, 1, 100.00, '2023-07-15 16:45:00', 'Pago de internet');


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
	(3, 4, 1, 50.00, '2023-07-15 12:00:00', 'Pago de gas'),
	(3, 3, 2, 10.20, '2023-07-15 14:30:00', 'Compra de comida'),
	(3, 5, 1, 35.75, '2023-07-15 16:30:00', 'Salida al parque');


/* MODIFICACIÓN DE DATOS */
UPDATE transaction SET amount=11.50 where id=1;


/* ------------- VISTAS ------------- */

# Top 10 transacciones mas costosas:
CREATE OR REPLACE VIEW vw_top_transactions AS(
	SELECT u.first_name AS username, tc.description AS category, pm.description AS payment_method, t.amount, t.datetime, t.description
    FROM TRANSACTION AS t
    JOIN user as u ON t.id_user = u.id
    JOIN transaction_category as tc ON t.id_transaction_category = tc.id
    JOIN payment_method as pm ON t.id_payment_method = pm.id
    ORDER BY amount DESC 
    LIMIT 10
);
select * from vw_top_transactions;

# Categoria con mayor gasto:
CREATE OR REPLACE VIEW vw_higher_spending_category AS(
	SELECT t.id_user AS user_id, tc.description AS category, SUM(t.amount) AS total_cost
	FROM transaction as t
	JOIN transaction_category as tc ON t.id_transaction_category = tc.id
	GROUP BY t.id_user, t.id_transaction_category
	ORDER BY total_cost DESC
	LIMIT 1
);
SELECT * FROM vw_higher_spending_category;

# Gastos totales por categoria:
CREATE OR REPLACE VIEW vw_total_expenses_by_category AS(
	SELECT t.id_user, tc.description AS category, SUM(t.amount) AS total_expenses
	FROM transaction t
	JOIN transaction_category tc ON t.id_transaction_category = tc.id
	GROUP BY t.id_user, t.id_transaction_category
);
SELECT * FROM vw_total_expenses_by_category;

# Transacción más recientes por cada usuario:
CREATE OR REPLACE VIEW vw_latest_transaction_by_user AS (
	SELECT u.id AS user_id, u.first_name, u.last_name, t.id AS transaction_id, t.datetime, t.description, t.amount
	FROM user u
	JOIN transaction t ON u.id = t.id_user
	WHERE t.datetime = (
		SELECT MAX(datetime) FROM transaction WHERE id_user = u.id
	)
	ORDER BY t.datetime DESC
);
SELECT * FROM vw_latest_transaction_by_user;

# Gastos totales por usuario:
CREATE OR REPLACE VIEW vw_total_expenses_by_user AS(
	SELECT u.id AS user_id, u.first_name, u.last_name, SUM(t.amount) AS total_expenses
	FROM user u
	JOIN transaction t ON u.id = t.id_user
	GROUP BY u.id
);
SELECT * FROM vw_total_expenses_by_user;

# Categorías de transacciones por usuario:
CREATE OR REPLACE VIEW vw_transaction_categories_by_user AS(
	SELECT u.id AS user_id, u.first_name, u.last_name, tc.id AS category_id, tc.description AS category_description
	FROM user u
	JOIN transaction_category tc ON u.id = tc.id_user
);
SELECT * FROM vw_transaction_categories_by_user;


/* ------------- FUNCIONES ------------- */
# Función para obtener el total de gastos por usuario:
DELIMITER //
CREATE FUNCTION fn_get_total_expenses_by_user(user_id INT) RETURNS DECIMAL(20, 2)
READS SQL DATA
BEGIN
	DECLARE total DECIMAL(20, 2);
	SELECT SUM(amount) INTO total
	FROM transaction
	WHERE id_user = user_id;
	RETURN total;
END//
DELIMITER ;
SELECT fn_get_total_expenses_by_user(1);

# Función para obtener el promedio de gastos por transacción de un usuario:
DELIMITER //
CREATE FUNCTION fn_get_average_expenses_per_transaction(user_id INT) RETURNS DECIMAL(20, 2)
READS SQL DATA
BEGIN
	DECLARE total_expenses DECIMAL(20, 2);
	DECLARE total_transactions INT;
	SELECT SUM(amount) INTO total_expenses
	FROM transaction
	WHERE id_user = user_id;
	SELECT COUNT(*) INTO total_transactions
	FROM transaction
	WHERE id_user = user_id;
	IF total_transactions > 0 THEN
		RETURN total_expenses / total_transactions;
	ELSE
		RETURN 0;
	END IF;
END//
DELIMITER ;
SELECT fn_get_average_expenses_per_transaction(1);

# Función para obtener el número total de transacciones por usuario:
DELIMITER //
CREATE FUNCTION fn_get_total_transactions_by_user(user_id INT) RETURNS INT
READS SQL DATA
BEGIN
	DECLARE total INT;
	SELECT COUNT(*) INTO total
	FROM transaction
	WHERE id_user = user_id;
	RETURN total;
END//
DELIMITER ;
SELECT fn_get_total_transactions_by_user(2);

/* ------------- STORED PROCEDURES ------------- */
# Stored Procedure para ordenar dinamicamente los resultados de hacer una query a una tabla:
DELIMITER //
CREATE PROCEDURE sp_dynamic_table_order(
    IN p_table_name VARCHAR(100),
    IN p_order_by_column VARCHAR(100),
    IN p_order_direction VARCHAR(4)
)
BEGIN
    SET @sql_query = CONCAT(
        'SELECT * FROM ', p_table_name, 
        ' ORDER BY ', p_order_by_column, ' ', p_order_direction
    );
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END//
DELIMITER ;
CALL sp_dynamic_table_order('transaction', 'amount', 'ASC');

# Stored Procedure para agregar una nueva categoría de transacción:
DELIMITER //
CREATE PROCEDURE sp_add_transaction_category(
	id_user INT,
	description VARCHAR(45),
	color VARCHAR(10)
)
BEGIN

	# Verificacón de si el usuario existe antes de insertar la nueva categoría de transacción
	IF (SELECT COUNT(*) FROM user WHERE id = id_user) = 0 THEN
		SELECT 'Error: El usuario con el ID especificado no existe.';
	ELSE
		INSERT INTO transaction_category (id_user, description, color)
		VALUES (id_user, description, color);
		SELECT 'Nueva categoría de transacción agregada correctamente.';
	END IF;

END//
DELIMITER ;
drop procedure sp_add_transaction_category;
call sp_add_transaction_category(1, 'Juegos', 'brown');

# Stored Procedure para actualizar el monto de una transacción:
DELIMITER //
CREATE PROCEDURE sp_update_transaction_amount(
	id_user INT,
	transaction_id INT,
	new_amount DECIMAL(20, 2)
)
BEGIN
	# Verificacón de si el usuario existe antes de insertar la nueva categoría de transacción
	IF (SELECT COUNT(*) FROM user WHERE id = id_user) = 0 THEN
		SELECT 'Error: El usuario con el ID especificado no existe.';
	ELSE
		UPDATE transaction
		SET amount = new_amount
		WHERE id = transaction_id and id_user = id_user;
		SELECT 'Transacción actualizada correctamente.';
	END IF;
END//
DELIMITER ;
drop procedure sp_update_transaction_amount;
call sp_update_transaction_amount(1, 2, 4000);


/* ------------- TRIGGERS ------------- */

# Tabla log:
CREATE TABLE users_log (
    log_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    operation VARCHAR(20) NOT NULL,
    operation_datetime DATETIME NOT NULL,
    operation_by_user VARCHAR(100) NOT NULL
);

# Tabla log:
CREATE TABLE transaction_log (
    log_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    transaction_id INT NOT NULL,
    operation VARCHAR(20) NOT NULL,
    operation_datetime DATETIME NOT NULL,
    operation_by_user VARCHAR(100) NOT NULL
);

# Trigger para registrar los cambios en los datos de los usuarios:
DELIMITER //
CREATE TRIGGER before_users_update
BEFORE UPDATE ON user
FOR EACH ROW
BEGIN
    INSERT INTO users_log (id_user, operation, operation_datetime, operation_by_user)
    VALUES (OLD.id, 'UPDATE', CURRENT_TIMESTAMP(), USER());
END;
//
DELIMITER ;

# Trigger para registrar las transacciones eliminadas:
DELIMITER //
CREATE TRIGGER after_transaction_delete
AFTER DELETE ON transaction
FOR EACH ROW
BEGIN
    INSERT INTO transaction_log (id_user, transaction_id, operation, operation_datetime, operation_by_user)
    VALUES (OLD.id_user, OLD.id, 'DELETE', CURRENT_TIMESTAMP(), USER());
END;
//
DELIMITER ;
