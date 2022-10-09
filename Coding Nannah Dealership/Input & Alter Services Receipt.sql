-- What makes a services receipt:
--     services_date DATE,
--     employee_first_name VARCHAR(50),
--     employee_last_name VARCHAR(50),
--     customer_first_name VARCHAR(50),
--     customer_last_name VARCHAR(50),
--     vehicle_make VARCHAR(50),
--     vehicle_model VARCHAR(50),
--     vehicle_year INTEGER,
--     services_name VARCHAR(30),
--     services_description TEXT,
--     services_price NUMERIC(8,2),
--     tax NUMERIC (8,2),
--     total_services NUMERIC(10, 2),

-- Create FUNCTION add_service:
DROP FUNCTION IF EXISTS Services_receipt CASCADE;
CREATE OR REPLACE FUNCTION add_services_receipt(
    _services_date DATE,
    _employee_first_name VARCHAR(50),
    _employee_last_name VARCHAR(50),
    _customer_first_name VARCHAR(50),
    _customer_last_name VARCHAR(50),
    _vehicle_make VARCHAR(50),
    _vehicle_model VARCHAR(50),
    _vehicle_year INTEGER,
    _services_name VARCHAR(30),
    _services_explanation TEXT, 
    _services_price NUMERIC(8,2),
    _tax NUMERIC (8,2),
    _total_services NUMERIC(10, 2)
    ) RETURNS void AS $$ BEGIN
INSERT INTO services_receipt(
    services_date,
    employee_first_name,
    employee_last_name,
    customer_first_name,
    customer_last_name,
    vehicle_make,
    vehicle_model,
    vehicle_year,
    services_name,
    services_explanation,
    services_price,
    tax,
    total_services
    )
VALUES(
    _services_date,
    _employee_first_name,
    _employee_last_name,
    _customer_first_name,
    _customer_last_name,
    _vehicle_make,
    _vehicle_model,
    _vehicle_year,
    _services_name,
    _services_explanation,
    _services_price, 
    _tax,  
    _total_services 
    );
END;
$$ LANGUAGE plpgsql;
-- services explanation on a receipt can differ from the services description in services;
-- Drop function does not remove parameters created by a function nor does "create or replace"
-- must change function name to circumvent the error for input parameter
-- will not keep services_name for the same reason


CREATE OR REPLACE FUNCTION add_final_services_receipt(
    _services_date DATE,
    _employee_first_name VARCHAR(50),
    _employee_last_name VARCHAR(50),
    _customer_first_name VARCHAR(50),
    _customer_last_name VARCHAR(50),
    _vehicle_make VARCHAR(50),
    _vehicle_model VARCHAR(50),
    _vehicle_year INTEGER,
    _services_explanation TEXT, 
    _services_price NUMERIC(8,2),
    _tax NUMERIC (8,2),
    _total_service_price NUMERIC(10, 2)
    ) RETURNS void AS $$ BEGIN
INSERT INTO services_receipt(
    services_date,
    employee_first_name,
    employee_last_name,
    customer_first_name,
    customer_last_name,
    vehicle_make,
    vehicle_model,
    vehicle_year,
    services_explanation,
    services_price,
    tax,
    total_service_price
    )
VALUES(
    _services_date,
    _employee_first_name,
    _employee_last_name,
    _customer_first_name,
    _customer_last_name,
    _vehicle_make,
    _vehicle_model,
    _vehicle_year,
    _services_explanation,
    _services_price, 
    _tax,  
    _total_service_price 
    );
END;
$$ LANGUAGE plpgsql;
-- Prepping for service receipts:
SELECT customer_id, first_name, last_name, category FROM customer
WHERE category = 'service center client' OR category = 'sales and service client'
ORDER BY customer_id; 

SELECT vehicle_id, make, model, year FROM vehicle
WHERE note = 'not sold here but serviced here' OR note = 'sold and serviced here'
ORDER BY vehicle_id;

SELECT employee_id, first_name, last_name, position FROM employee
WHERE department = 'Mechanic' ORDER BY employee_id;

SELECT * FROM services;

SELECT * FROM sales_receipt;

SELECT add_final_services_receipt(
    '2022-08-23',
    'Chewbacca "Chewy"',
    'Wookie',
    'Jessica',
    'Fletcher',
    'Acura',
    'Legend',
    1986,
    'yearly tune-up',
    250.00,
    15.63,
    265.63
);

SELECT add_final_services_receipt(
    '2022-04-06',
    'Geordi',
    'LaForge',
    'Samuel "Sam"',
    'Malone',
    'Chevrolet',
    'Corvette ZR1',
    2009,
    'yearly tune-up',
    250.00,
    15.63,
    265.63
);

SELECT add_final_services_receipt(
    '2022-10-04',
    'Angus "Mac"',
    'MacGyver',
    'Sharona',
    'Fleming',
    'Volvo',
    '740 GLE Wagon',
    1990,
    'tire rotation + fluid top off',
    107.00,
    6.69,
    113.69
);

SELECT add_final_services_receipt(
    '2022-01-25',
    'Geordi',
    'LaForge',
    'Temperance',
    'Brennan',
    'Ford',
    'Mustang convertible',
    1966,
    'yearly tune-up',
    250.00,
    15.63,
    265.63
);

SELECT add_final_services_receipt(
    '2022-07-05',
    'Benjamin "Cooter"',
    'Davenport',
    'Beauregard "Bo"',
    'Duke',
    'Dodge',
    'Charger',
    1969,
    'tune-up + fix dents + paint touch up',
    325.67,
    20.35,
    346.02
);

SELECT add_final_services_receipt(
    '2022-06-25',
    'Charlotte "Charlie"',
    'Watson',
    'Fred',
    'Jones',
    'Ford',
    'Econoline Van',
    1963,
    'AC tune-up + slime removal',
    225.00,
    14.06,
    239.06
);

SELECT add_final_services_receipt(
    '2022-05-23',
    'Angus "Mac"',
    'MacGyver',
    'Thomas',
    'Magnum',
    'Ferrari',
    '308 GTS convertible',
    1977,
    'bullet removal + fix scratch & dent + paint touch up',
    578.64,
    36.17,
    614.81
);

SELECT add_final_services_receipt(
    '2022-09-05',
    'Benjamin "Cooter"',
    'Davenport',
    'David "Dave"',
    'Starsky',
    'Ford',
    'Gran Torino',
    1977,
    'bullet removal + fix scratch & dent + paint touch up',
    592.87,
    37.05,
    629.92
);

SELECT add_final_services_receipt(
    '2022-04-16',
    'Benjamin "Cooter"',
    'Davenport',
    'Beauregard "Bo"',
    'Duke',
    'Dodge',
    'Charger',
    1969,
    'bullet removal + fix scratch & dent + paint touch up + shocks & struts',
    589.76,
    36.86,
    626.62
);

SELECT add_final_services_receipt(
    '2022-01-16',
    'Angus "Mac"',
    'MacGyver',
    'Fred',
    'Jones',
    'Ford',
    'Econoline Van',
    1963,
    'full restoration: reassembling the Beetle, sealing 2 halves, smoothing seal, paint touch up',
    5684.97,
    355.31,
    6040.28
);

SELECT add_final_services_receipt(
    '2022-06-17',
    'Charlotte "Charlie"',
    'Watson',
    'Temperance',
    'Brennan',
    'Ford',
    'Mustang convertible',
    1966,
    'warning light check',
    17.00,
    1.06,
    18.06
);

SELECT add_final_services_receipt(
    '2022-04-22',
    'Charlotte "Charlie"',
    'Watson',
    'Jessica',
    'Fletcher',
    'Acura',
    'Legend',
    1986,
    'wiper adjustment',
    57.00,
    3.56,
    60.56
);
-- Checking and correcting info in table:
SELECT * FROM services_receipt;

SELECT * FROM customer;

ALTER TABLE services_receipt
DROP COLUMN services_id CASCADE,
DROP COLUMN services_name CASCADE,
DROP COLUMN vehicle_id CASCADE;

SELECT services_receipt_id, employee_id, employee_first_name, customer_id, customer_first_name 
FROM services_receipt ORDER BY services_receipt_id;

SELECT * FROM employee WHERE department = 'Mechanic'
ORDER BY employee_id;

UPDATE sales_receipt
SET employee_id = 16,
customer_id = 1 
WHERE sales_receipt_id = 1; 

UPDATE sales_receipt
SET employee_id = 15,
customer_id = 2 
WHERE sales_receipt_id = 2; 

UPDATE sales_receipt
SET employee_id = 14,
customer_id = 3 
WHERE sales_receipt_id = 3; 

UPDATE sales_receipt
SET employee_id = 15,
customer_id = 4 
WHERE sales_receipt_id = 4; 

UPDATE sales_receipt
SET employee_id = 13,
customer_id = 5 
WHERE sales_receipt_id = 5; 

UPDATE sales_receipt
SET employee_id = 14,
customer_id = 8 
WHERE sales_receipt_id = 6; 

UPDATE sales_receipt
SET employee_id = 18,
customer_id = 7 
WHERE sales_receipt_id = 7; 

UPDATE sales_receipt
SET employee_id = 13,
customer_id = 12 
WHERE sales_receipt_id = 8; 

UPDATE sales_receipt
SET employee_id = 13,
customer_id = 5 
WHERE sales_receipt_id = 9; 

UPDATE sales_receipt
SET customer_first_name = 'James "Jim"',
customer_last_name = 'Douglas' 
WHERE sales_receipt_id = 10; 

UPDATE sales_receipt
SET employee_id = 14,
customer_id = 11 
WHERE sales_receipt_id = 10; 

UPDATE sales_receipt
SET employee_id = 18,
customer_id = 4 
WHERE sales_receipt_id = 11; 

UPDATE sales_receipt
SET employee_id = 18,
customer_id = 1 
WHERE sales_receipt_id = 12; 