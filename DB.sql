--parte1

create table countries(
  
  id_country serial primary key,
  name varchar(50) not null  
);

create table users(
  
 id_users serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country)   
);


--parte2

 
 insert into countries (name) values ('argentina') , ('colombia'),('chile');
 select * from countries;

 insert into users (id_country, email, name) 
 values (2, 'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman'); 
 select * from users;

 
 delete from users where email = 'bar@bar.com';

 
 update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;
 select * from users;

 
 select * from users inner join  countries on users.id_country = countries.id_country;

 select u.id_users as id, u.email, u.name as fullname, c.name 
 from users u inner join  countries c on u.id_country = c.id_country;
 
 --parte 3
 
 create table priorities(
 
 id_country serial primary key,
 name varchar(50) NOT NULL
 );
 
 
  create table priorities(
    id_country serial primary key,
    type_name varchar(50) NOT NULL   
 );
 
 table contact_request(
    id_email serial primary key,
    name varchar(50),
    detail TEXT,
    id_country  INTEGER NOT NULL
    id_priority INTEGER NOT NULL
    foreign key (id_country) references countries (id_country),
    foreign key (id_priority) references priorities (id_priority)
 );
 
 
 --parte 4
 
 insert into countries(name) VALUES
 ('China'),
 ('Puerrto rico'),
 ('Francia'),
 ('Venezuela'),
 ('Estados Unidos');
 
 INSERT INTO priorities(type_name) VALUES
 ('Pabellon'),('Empanada'),('Arepa');
 
 
 insert into contact_request(id_email,details,physical_address,id_country,name,id_priority)
 VALUES
 
 ('Elprimo404024@gmail.com', 'Es flaco', 'Venezuela Caracas Av Panteon', 5,4),
 ('ElJosue777829@gmail.com', ' Mide 1,70', 'Santiago de Chile La Legua', 2,2),
 ('larositaprimavera@gmail.com', 'Es flaca y mide 1,68', 'Argentina calle princial', 3,3);
 
 select * from contact_request inner join countries on contact_request.id_country = countries.id_country;
 
 delete from contact_request where id_email = 'larositaprimavera@gmail.com';
 
 update contact_request set id_email = 'ramirezguerraisaac@gmail.com', name = 'Isaac Ramirez' where id_country = 1;
 
 -- Parte 5
 
 CREATE TABLE discounts(
 
    id_discount serial PRIMARY KEY,
    satutus VARCHAR(100),
    porcentage decimal (10,2)
 );
   
 CREATE TABLE offers(

    id_offer serial PRIMARY KEY,
    satutus VARCHAR(100)
 );
 
 CREATE TABLE roles(
 
  id_role serial PRIMARY KEY,
  name VARCHAR(100)
 );
 
 
 CREATE TABLE payments(
 
  id_payment serial PRIMARY KEY,
  type VARCHAR(100)
 );
 
 CREATE TABLE countries(

  country serial PRIMARY KEY,
  name VARCHAR(100)

)

CREATE TABLE taxes(

  id_tax serial PRIMARY KEY,
  porcentage decimal(10, 2)
);

CREATE TABLE products (
  id_product serial PRIMARY KEY,
  name VARCHAR(100)
  id_discount INT,
  id_offer INTEGER,
  id_tax INTEGER,
  details TEXT not NULL,
  minimum_stock INTEGER not NULL,
  maximun_stock INTEGER not NULL,
  current_stock INTEGER not NULL,
  price DECIMAL(10, 2) not NULL,
  price_with_tax DECIMAL(10, 2),
  FOREIGN KEY (id_discount) REFERENCES discounts (id_discount),
  FOREIGN KEY (id_offer) REFERENCES offers (id_offer),
  FOREIGN KEY (id_tax) REFERENCES taxes (id_tax)
);
  
  
  CREATE TABLE products_customers(
  
  id_product INTEGER,
  id_customer INTEGER,
  FOREIGN KEY (id_product) REFERENCES products(id_product),
  FOREIGN KEY (id_customer) REFERENCES customers(id_customer)
);

CREATE TABLE orders(

  id_order serial PRIMARY KEY,
  id_invoice INTEGER,
  id_product INTEGER,
  detail VARCHAR(250),
  amount INTEGER,
  price FLOAT,
  FOREIGN KEY (id_invoice) REFERENCES invoice (id_invoice),
  FOREIGN KEY (id_product) REFERENCES products (id_product)
);

CREATE TABLE invoice_status(

	id_invoice_status serial PRIMARY KEY,
 	satutus VARCHAR(100) 
);

CREATE TABLE invoice(

  id_invoice serial PRIMARY KEY,
  id_customer INTEGER,
  id_payment  INTEGER,
  id_invoice_status INTEGER,
  date VARCHAR(250),
  total_to_pay DECIMAL(10, 2),
  total_without_tax DECIMAL(10, 2),
  FOREIGN KEY (id_customer) REFERENCES customers (id_customer),
  FOREIGN KEY (id_payment) REFERENCES payments (id_payment),
  FOREIGN KEY (id_invoice_status) REFERENCES invoice_status (id_invoice_status)
);

-- parte 6

INSERT INTO countries(name) VALUES ('Japon'), ('brasil'), ('Rusia');

INSERT INTO roles(name) VALUES ('frecuente'), ('user'), ('admin');

INSERT INTO customers (email,id_country,id_role,name,age,password,physical_adress) VALUES
('ramirezisaac@gmail.com',1,1,'isaac',19,6795689,'barrio1'),
('elprimo25@gmail.com',2,2,'abraham,',9,121367945,'barrio2'),
('colt@gmail.com',3,3,'william',42,256703326,'barrio3');

INSERT INTO payments (type) VALUES
('pesos mexicanos'),('pesos chilenos'),('tranferencia');

INSERT INTO invoice_status (status) VALUES
('debito'),('credito'),('corriente');

INSERT INTO discounts (status, percentage) VALUES
('falce 1.0'),('true 1.2'),('true 1.3');

INSERT INTO offers (status) VALUES
(10), (40), (60);

INSERT INTO taxes (percentage) VALUES
(25), (30), (35);

(id_discount,id_offer,id_tax,name,details,minimum_stock,maximun_stock,current_stock,price,price_with_tax) VALUES
(1,1,2,'televisor','nuevo',1,50,10,123,200),
(3,3,1,'play5',    'usado',1,20,40,100,500),
(3,1,3,'lavadora', 'nuevo',1,100,50,234,400);

INSERT INTO invoice (id_customer,id_payment,id_invoice_status,date,total_to_pay) VALUES

(1, 1, 1, '2024-04-07 12:00:00', 350.00, 137.50),
(2, 2, 2, '2024-04-08 13:00:00', 75.00, 30.00),
(3, 3, 1, '2024-04-09 14:00:00', 150.00, 85.00);


INSERT INTO orders (id_product, id_invoice, detail, amount, price) VALUES

(1, 1, 'Pago por cuotas', 4, 400),
(2, 2, 'Pago completo', 3, 325),
(3, 3, 'Pago completo', 2, 185);

INSERT INTO products_customers (id_product, id_customer) VALUES
(1, 1),
(2, 2),
(3, 3);

DELETE FROM orders
WHERE id_invoice = 3;
DELETE FROM invoices
WHERE id_customer = 3;
DELETE FROM products_customers
WHERE id_customer = 3;
delete from customers
where email = 3;

UPDATE customers
SET name = 'ramirez', age = 19
WHERE email = (SELECT MAX(email) FROM customers);
UPDATE products
SET price = 500;
UPDATE products
SET id_tax = id_tax + 100
WHERE id_tax BETWEEN 1 AND 49;
UPDATE taxes
SET id_tax = id_tax + 150,
    percentage = percentage * 1.10
WHERE id_tax < 50;