-- Elephant SQL Original Code: postgres://mwrfuqvg:kF3LGUi9i6b43uf3DWL7tc0nh3SxP2PM@heffalump.db.elephantsql.com/mwrfuqvg
-- Elephant SQL Current Code: postgres://pdtwndag:J5pm510LWq9KZkmqIRtNewc7Ndsk92uf@heffalump.db.elephantsql.com/pdtwndag 

DROP TABLE IF EXISTS Vehicle CASCADE;
CREATE TABLE Vehicle (
    vehicle_id SERIAL PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    color VARCHAR(50),
    year INTEGER,
    price NUMERIC (10, 2),
    sold BOOLEAN,
    from_inventory BOOLEAN,
    note TEXT
);

DROP TABLE IF EXISTS Employee CASCADE;
CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(10),
    position VARCHAR(20),
    email VARCHAR(75),
    phone VARCHAR(20),
    "address" VARCHAR(75),
    city VARCHAR(50),
    "state" VARCHAR(2),
    zip INTEGER, 
    current_employee BOOLEAN,
    note TEXT
);

DROP TABLE IF EXISTS Customer CASCADE;
CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    email VARCHAR(75),
    phone VARCHAR(20),
    "address" VARCHAR(75),
    city VARCHAR(50),
    "state" VARCHAR(2),
    zip INTEGER,
    category TEXT
);

DROP TABLE IF EXISTS Sales_receipt CASCADE;
CREATE TABLE Sales_receipt (
    sales_receipt_id SERIAL PRIMARY KEY,
    sale_date DATE,
    employee_id INTEGER,
    employee_first_name VARCHAR(50),
    employee_last_name VARCHAR(50),
    customer_id INTEGER,
    customer_first_name VARCHAR(50),
    customer_last_name VARCHAR(50),
    vehicle_id INTEGER,
    vehicle_make VARCHAR(50),
    vehicle_model VARCHAR(50),
    vehicle_year INTEGER,
    vehicle_price NUMERIC(10,2),
    tax NUMERIC (8,2),
    total_sale NUMERIC(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id)
);

DROP TABLE IF EXISTS Services CASCADE;
CREATE TABLE Services (
    services_id SERIAL PRIMARY KEY,
    services_name VARCHAR(30),
    services_description TEXT,
    services_price NUMERIC(8,2)
);

DROP TABLE IF EXISTS Services_receipt CASCADE;
CREATE TABLE Services_receipt (
    services_receipt_id SERIAL PRIMARY KEY,
    services_date DATE,
    employee_id INTEGER,
    employee_first_name VARCHAR(50),
    employee_last_name VARCHAR(50),
    customer_id INTEGER,
    customer_first_name VARCHAR(50),
    customer_last_name VARCHAR(50),
    vehicle_id INTEGER,
    vehicle_make VARCHAR(50),
    vehicle_model VARCHAR(50),
    vehicle_year INTEGER,
    services_id INTEGER,
    services_name VARCHAR(30),
    services_explanation TEXT,
    services_price NUMERIC(8,2),
    tax NUMERIC (8,2),
    total_service_price NUMERIC(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    FOREIGN KEY (services_id) REFERENCES services(services_id)
);

    
    
    

   
   
    
    