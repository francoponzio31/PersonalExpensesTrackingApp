use personal_expenses_tracking;

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
call sp_update_transaction_amount(1, 2, 4000);

