use personal_expenses_tracking;

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
