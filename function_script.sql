use personal_expenses_tracking;

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
