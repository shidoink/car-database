select * from car;

create or replace function add_car(_car_id INTEGER, _make VARCHAR, _model VARCHAR, _year_ NUMERIC)
returns void
as $main$
begin
	insert into car(car_id, make, model, year_)
	values( _car_id, _make, _model, _year_);
end;
$main$
language plpgsql;

select add_car(1,'Ford','Explorer',2018);
select add_car(2,'Toyota','Tacoma',2022);
select add_car(3,'BMW','Model BMW',2011);
select add_car(4,'Mercedes','S Class',2019);

select * from customer;

create or replace function add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _address VARCHAR)
returns void
as $main$
begin
	insert into customer(customer_id, first_name, last_name, address)
	values( _customer_id, _first_name, _last_name, _address);
end;
$main$
language plpgsql;

select add_customer(1,'Ben','Jamin','423 Nowhere St');
select add_customer(2,'Mary','Contrary','111 House Rd');
select add_customer(3,'Joe','Mama','555 Nice St');

create or replace function add_part(_part_id INTEGER, _part_name VARCHAR, _cost_ numeric)
returns void
as $main$
begin
	insert into part(part_id, part_name, cost_)
	values( _part_id, _part_name,_cost_);
end;
$main$
language plpgsql;

select add_part(1,'muffler',1000.00 );
select add_part(2,'rotor',600.00);
select add_part(3,'computer',1500.00);
select add_Part(4,'transmission',2500.00);

create or replace function add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $main$
begin
	insert into mechanic(mechanic_id, first_name, last_name)
	values( _mechanic_id, _first_name, _last_name);
end;
$main$
language plpgsql;

select add_mechanic(1,'Harry','Larry');
select add_mechanic(3,'Steve','Stevenson');
select add_mechanic(2,'Mike','Jordan');

select * from mechanic

create or replace function add_salesperson(_employee_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $main$
begin
	insert into salesperson(employee_id, first_name, last_name)
	values( _employee_id, _first_name, _last_name);
end;
$main$
language plpgsql;

select add_salesperson(1,'Susan','Tousan');
select add_salesperson(2,'Natalie','Amelie');
select add_salesperson(3,'Big','George');

select * from salesperson;

create or replace function add_sales_invoice(_invoice_id INTEGER, _total NUMERIC, _employee_id integer, _customer_id INTEGER, _car_id INTEGER, _date_ date)
returns void
as $main$
begin
	insert into sales_invoice( invoice_id, total, employee_id, customer_id, car_id, date_)
	values( _invoice_id,_total,_employee_id,_customer_id,_car_id,_date_);
end;
$main$
language plpgsql;

select add_sales_invoice(1, 25000, 1,1,1,'03/02/2023');
select add_sales_invoice(2, 30000, 2,2,2,'03/03/2023');

create or replace function add_service_invoice(_s_invoice_id INTEGER, _labor NUMERIC,_customer_id integer, _mechanic_id integer, _part_id INTEGER, _car_id INTEGER, _date_ date)
returns void
as $main$
begin
	insert into service_invoice( s_invoice_id, labor, customer_id, mechanic_id, part_id, car_id, date_)
	values( _s_invoice_id, _labor, _customer_id, _mechanic_id, _part_id, _car_id, _date_);
end;
$main$
language plpgsql;

alter table service_invoice 
add customer_id INTEGER;
alter table service_invoice 
add constraint fk_service_invoice_customers foreign key (customer_id) references customer(customer_id);

select add_service_invoice(1,3.00,1,1,null,1,'03/08/2023' )
select add_service_invoice(2,7.00,2,2,1,2,'03/08/2023' )




