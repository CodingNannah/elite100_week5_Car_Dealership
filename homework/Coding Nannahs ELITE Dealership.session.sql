DROP TABLE IF EXISTS Vehicle CASCADE;
CREATE TABLE Vehicle (
    vehicle_id SERIAL PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(100),
    color VARCHAR(50),
    year INTEGER,
    price NUMERIC (10, 2),
    sold BOOLEAN
);

DROP TABLE IF EXISTS Employee CASCADE;
CREATE TABLE EMPLOYEE (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(75),
    last_name VARCHAR(75),
    department VARCHAR(10),
    position VARCHAR(20),
    email VARCHAR(100),
    phone VARCHAR(20),
    "address" VARCHAR(100),
    city VARCHAR(75),
    "state" VARCHAR(2),
    zip INTEGER
);

DROP TABLE IF EXISTS Office_personnel CASCADE;
CREATE TABLE Office_personnel (
    office_personnel_id SERIAL PRIMARY KEY,
    wage NUMERIC(5),
    employee_id INTEGER,
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
);

DROP TABLE IF EXISTS Mechanic CASCADE;
CREATE TABLE Mechanic (
    mechanic_id SERIAL PRIMARY KEY,
    wage NUMERIC(5),
    employee_id INTEGER,
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
);
DROP TABLE IF EXISTS Salesperson CASCADE;
CREATE TABLE Salesperson (
    salesperson_id SERIAL PRIMARY KEY,
    base_salary NUMERIC(5),
    commission DECIMAL(3),
    employee_id INTEGER,
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
);
DROP TABLE IF EXISTS Customer CASCADE;
CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(75),
    last_name VARCHAR(75),
    dob DATE,
    email VARCHAR(100),
    phone VARCHAR(20),
    "address" VARCHAR(100),
    city VARCHAR(75),
    "state" VARCHAR(2),
    zip INTEGER
);
SELECT * FROM customer;
DROP TABLE IF EXISTS Sales_receipt CASCADE;
CREATE TABLE Sales_receipt (
    sales_receipt_id SERIAL PRIMARY KEY,
    sale_date DATE,
    salesperson_id INTEGER,
    customer_id INTEGER,
    vehicle_id INTEGER,
    tax DECIMAL(5),
    total_sale NUMERIC(10, 2),
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id)
);

DROP TABLE IF EXISTS Services CASCADE;
CREATE TABLE Services (
    services_id SERIAL PRIMARY KEY,
    services_name VARCHAR(75),
    services_description VARCHAR(200),
    services_price NUMERIC(8, 2)
);

DROP TABLE IF EXISTS Services_receipt CASCADE;
CREATE TABLE Services_receipt (
    services_receipt_id SERIAL PRIMARY KEY,
    services_date DATE,
    mechanic_id INTEGER,
    customer_id INTEGER,
    vehicle_id INTEGER,
    services_id INTEGER,
    tax DECIMAL(5),
    total_services NUMERIC(10, 2),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    FOREIGN KEY (services_id) REFERENCES services(services_id)
);

ALTER TABLE employee
ADD COLUMN current_employee BOOLEAN; 

ALTER TABLE employee
ALTER COLUMN current_employee SET DEFAULT 'Yes';

ALTER TABLE employee
ADD COLUMN note Text;

ALTER TABLE employee
ALTER COLUMN note SET Default 'no message';

ALTER TABLE customer
ADD COLUMN category VARCHAR(50);

ALTER TABLE customer
ALTER COLUMN category SET Default 'unknown';

