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