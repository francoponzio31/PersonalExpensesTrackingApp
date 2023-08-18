use personal_expenses_tracking;

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

