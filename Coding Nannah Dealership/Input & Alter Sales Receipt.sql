-- What makes a sales receipt:
--     sale_date DATE,
--     employee_id INTEGER,
--     customer_id INTEGER,
--     vehicle_id INTEGER,
--     tax DECIMAL(5),
--     total_sale NUMERIC(10, 2)
--     Format Sales Receipt:
DROP FUNCTION IF EXISTS add_sales_receipt CASCADE;
CREATE OR REPLACE FUNCTION add_sales_receipt(
    _sale_date DATE,
    _employee_id INTEGER,
    _customer_id INTEGER,
    _vehicle_id INTEGER,
    _tax DECIMAL(5),
    _total_sale NUMERIC(10, 2)
    ) RETURNS void AS $$ BEGIN
INSERT INTO vehicle(
    sale_date,
    employee_id,
    customer_id,
    vehicle_id,
    tax,
    total_sale
    )
VALUES(
    _sale_date,
    _employee_id,
    _customer_id,
    _vehicle_id,
    _tax,
    _total_sale
    );
END;
$$ LANGUAGE plpgsql;
-- OOPS! Inserted into vehicle instead of sales_receipt
SELECT * FROM vehicle;
ROLLBACK;
DROP FUNCTION IF EXISTS add_sales_receipt CASCADE;
CREATE OR REPLACE FUNCTION add_sales_receipt(
    _sale_date DATE,
    _employee_first_name VARCHAR(50),
    _employee_last_name VARCHAR(50),
    _customer_first_name VARCHAR(50),
    _customer_last_name VARCHAR(50),
    _vehicle_id INTEGER,
    _vehicle_make VARCHAR(50),
    _vehicle_model VARCHAR(50),
    _vehicle_year INTEGER,
    _vehicle_price NUMERIC(10,2),
    _tax NUMERIC(8,2),
    _total_sale NUMERIC(10, 2)
    ) RETURNS void AS $$ BEGIN
INSERT INTO sales_receipt(
    sale_date,
    employee_first_name,
    employee_last_name,
    customer_first_name,
    customer_last_name,
    vehicle_id,
    vehicle_make,
    vehicle_model,
    vehicle_year,
    vehicle_price,
    tax,
    total_sale
    )
VALUES(
    _sale_date,
    _employee_first_name,
    _employee_last_name,
    _customer_first_name,
    _customer_last_name,
    _vehicle_id,
    _vehicle_make,
    _vehicle_model,
    _vehicle_year,
    _vehicle_price,
    _tax,
    _total_sale
    );
END;
$$ LANGUAGE plpgsql;

SELECT * FROM vehicle
ORDER BY vehicle_id;

SELECT customer_id, first_name, last_name, category 
FROM customer ORDER BY customer_id;

SELECT * FROM employee
ORDER BY employee_id;

SELECT add_sales_receipt(
    '1982-07-16',
    'Robert "Bob"',
    'Parr',
    'Emmett "Doc"',
    'Brown',
    5,
    'DeLorean',
    'DMC-12',
    1982,
    60300.00,
    3768.75,
    64068.75
);

SELECT add_sales_receipt(
    '1982-01-09',
    'Michael',
    'Scott',
    'Michael',
    'Knight',
    8,
    'Pontiac',
    'Firebird',
    1982,
    12500.00,
    781.25,
    13281.25
);

SELECT add_sales_receipt(
    '1983-01-04',
    'Robert "Bob"',
    'Parr',
    'Bosco Albert "BA"',
    'Baracus',
    11,
    'GMC',
    'G-15',
    1983,
    15995.00,
    999.69,
    16994.69
);

SELECT add_sales_receipt(
    '1968-09-17',
    'Michael',
    'Scott',
    'James "Jim"',
    'Douglas',
    23,
    'VW',
    'Beetle',
    1963,
    34995,
    2187.19,
    37182.19
);

SELECT add_sales_receipt(
    '2006-01-25',
    'Jacob "Jake"',
    'Farmer',
    'Temperance',
    'Brennan',
    3,
    'Ford',
    'Mustang convertible',
    1966,
    59995.00,
    3749.69,
    63744.69
);

SELECT add_sales_receipt(
    '1980-12-11',
    'Florence "Flo"',
    'Courtney',
    'Thomas',
    'Magnum',
    12,
    'Ferrari',
    '308 GTS convertible',
    1977,
    65997.00,
    4124.81,
    70121.81
);

SELECT add_sales_receipt(
    '1965-06-25',
    'Florence "Flo"',
    'Courtney',
    'Fred',
    'Jones',
    21,
    'Ford',
    'Econoline Van',
    1963,
    17800.00,
    1112.50,
    18912.50
);

SELECT add_sales_receipt(
    '2009-04-02',
    'Michael',
    'Scott',
    'Samuel "Sam"',
    'Malone',
    13,
    'Chevrolet',
    'Corvette ZR1',
    2009,
    103795.00,
    6487.19,
    110282.19
);

SELECT add_sales_receipt(
    '1977-08-19',
    'Robert "Bob"',
    'Parr',
    'David "Dave"',
    'Starsky',
    18,
    'Ford',
    'Gran Torino',
    1977,
    38700.00,
    2418.75,
    41118.75
);

SELECT add_sales_receipt(
    '1963-05-14',
    'Michael',
    'Scott',
    'James "OO7"',
    'Bond',
    6,
    'Aston Martin',
    'DB5',
    1963,
    1421495.00,
    88843.44,
    1510338.44
);

SELECT sales_receipt_id, employee_id, employee_first_name, customer_id, customer_first_name, customer_last_name 
FROM sales_receipt ORDER BY sales_receipt_id;
-- sales_receipt requires employee & customer ids
UPDATE sales_receipt
SET employee_id = 9,
customer_id = 10
WHERE sales_receipt_id = 1; 

UPDATE sales_receipt
SET employee_id = 8,
customer_id = 6
WHERE sales_receipt_id = 2; 

UPDATE sales_receipt
SET employee_id = 9,
customer_id = 9
WHERE sales_receipt_id = 3;

UPDATE sales_receipt
SET employee_id = 8,
customer_id = 11
WHERE sales_receipt_id = 4;

UPDATE sales_receipt
SET employee_id = 11,
customer_id = 4
WHERE sales_receipt_id = 5;

UPDATE sales_receipt
SET employee_id = 10,
customer_id = 8 
WHERE sales_receipt_id = 6;

UPDATE sales_receipt
SET employee_id = 10,
customer_id = 7 
WHERE sales_receipt_id = 7;

UPDATE sales_receipt
SET employee_id = 8,
customer_id = 2
WHERE sales_receipt_id = 8;

UPDATE sales_receipt
SET employee_id = 8,
customer_id = 13
WHERE sales_receipt_id = 9; 

UPDATE sales_receipt
SET employee_id = 9,
customer_id = 12 
WHERE sales_receipt_id = 10; 