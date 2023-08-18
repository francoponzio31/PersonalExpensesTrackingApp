use personal_expenses_tracking;

/* ------------- USUARIOS DE LA DB ------------- */
# Creación de usuario con permisos de solo lectura
CREATE USER 'user_lectura'@'localhost' IDENTIFIED BY 'contraseña_usuario_lectura';
# Se asigna permisos de solo lectura a todas las tablas en la base de datos
GRANT SELECT ON personal_expenses_tracking.* TO 'user_lectura'@'localhost';


# Creación de usuario con permisos de lectura, inserción y modificación
CREATE USER 'user_modificacion'@'localhost' IDENTIFIED BY 'contraseña_usuario_modificacion';
# Asignar permisos de lectura, inserción y modificación a todas las tablas en la base de datos 'personal_expenses_tracking'
GRANT SELECT, INSERT, UPDATE ON personal_expenses_tracking.* TO 'user_modificacion'@'localhost';
