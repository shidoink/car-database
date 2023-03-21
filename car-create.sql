create table customer(
customer_id SERIAL primary key,
first_name VARCHAR(100),
last_name VARCHAR (100),
address VARCHAR(150)
);

create table salesperson(
employee_id SERIAL primary key,
first_name VARCHAR(100),
last_name VARCHAR(100)
);

create table car(
car_id SERIAL primary key,
make VARCHAR(100),
model VARCHAR(100),
year NUMERIC(4));

create table mechanic(
mechanic_id SERIAL primary key,
first_name VARCHAR(100),
last_name VARCHAR(100));

create table part( 
part_id SERIAL primary key,
part_name VARCHAR(150),
cost_ NUMERIC(6,2));

create table sales_invoice(
invoice_id SERIAL primary key,
total NUMERIC(8,2),
employee_id INTEGER not null,
foreign key (employee_id) references salesperson(employee_id),
customer_id INTEGER not null,
foreign key (customer_id) references customer(customer_id),
car_id INTEGER not null,
foreign key (car_id) references car(car_id));

create table service_invoice( 
s_invoice_id SERIAL primary key,
labor NUMERIC(5,2),
mechanic_id INTEGER not null,
foreign key (mechanic_id) references mechanic(mechanic_id),
part_id INTEGER,
foreign key (part_id) references part(part_id),
car_id INTEGER not null,
foreign key (car_id) references car(car_id));

alter table service_invoice
add date_ Date

alter table sales_invoice
add date_ Date;

alter table car
rename column year to year_

