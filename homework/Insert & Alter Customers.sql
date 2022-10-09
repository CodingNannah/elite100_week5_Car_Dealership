-- SELECT *
-- FROM customer;
-- CREATE OR REPLACE FUNCTION add_customer(_first_name VARCHAR(75), _last_name VARCHAR(75),
-- _dob DATE, _email VARCHAR(100), _phone VARCHAR(20), _address VARCHAR(100),
-- _city VARCHAR(75), _state VARCHAR(2), _zip INTEGER,
-- _type VARCHAR(50)
--     ) RETURNS void AS $$ BEGIN
-- INSERT INTO customer(first_name, last_name, dob,
-- email, phone, "address", city, "state", zip, category
--     )
-- VALUES(
--         _first_name,
--         _last_name,
--         _dob,
--         _email,
--         _phone,
--         _address,
--         _city,
--         _state,
--         _zip,
--         _type
--     );
-- END;
-- $$ LANGUAGE plpgsql;

-- -- cannot update people with __type and category not meshing:

-- DROP FUNCTION IF EXISTS add_customer(_first_name VARCHAR(75), _last_name VARCHAR(75),
-- _dob DATE, _email VARCHAR(100), _phone VARCHAR(20), _address VARCHAR(100),
-- _city VARCHAR(75), _state VARCHAR(2), _zip INTEGER,
-- _category VARCHAR(50)) CASCADE;

-- CREATE OR REPLACE FUNCTION add_customer(_first_name VARCHAR(75), _last_name VARCHAR(75),
-- _dob DATE, _email VARCHAR(125), _phone VARCHAR(25), _address VARCHAR(125),
-- _city VARCHAR(75), _state VARCHAR(2), _zip INTEGER,
-- _type VARCHAR(75)
--     ) RETURNS void AS $$ BEGIN
-- INSERT INTO customer(first_name, last_name, dob,
-- email, phone, "address", city, "state", zip, category
--     )
-- VALUES(
--         _first_name,
--         _last_name,
--         _dob,
--         _email,
--         _phone,
--         _address,
--         _city,
--         _state,
--         _zip,
--         _category
--     );
-- END;
-- $$ LANGUAGE plpgsql;

-- SELECT add_customer(
--         'Jessica',
--         'Fletcher',
--         '1925-10-16',
--         'jessicaf@murder_she_wrote.com',
--         '(555) 515-1984',
--         '96 Lansbury Lane', 
--         'Logan',
--         'UT',
--         84323,
--         'service center'
--     );
-- UPDATE customer
-- SET category = 'service center'
-- WHERE customer_id = 1;

-- SELECT * FROM customer;

-- SELECT add_customer(
--         'Samuel "Sam"',
--         'Malone',
--         '1947-12-29',
--         'sam@cheers.com',
--         '(555) 801-2108',
--         '1982 Red Sox Road',
--         'Trenton',
--         'UT',
--         84338,
--         category = 'sales and service center'
--     );
-- -- Sam is not going through

-- ALTER TABLE customer
-- ALTER COLUMN first_name TYPE VARCHAR(75);

-- SELECT add_customer (
--         'Sharona',
--         'Fleming',
--         '1968-07-17',
--         'bitty@monk.com',
--         '(555) 712-2002 ',
--         '23 Schram Street',
--         'Providence',
--         'UT',
--         84332,
--         'purchase and service center',
--     );
-- VALUES (
--         'Temperance',
--         'Brennan',
--         '1976-10-11',
--         'bones@jeffersonian.com',
--         '(555) 913-2005',
--         '2017 Hanson Way',
--         'Paradise',
--         'UT',
--         84328
--     );
-- VALUES (
--         'Beauregard''Bo',
--         'Duke',
--         '1960-4-8',
--         'bo@hazzard.com',
--         '(555) 435-1979',
--         '1985 Schneider Place',
--         'Newton',
--         'UT',
--         84327
--     );
-- (
--     'Michael',
--     'Knight',
--     '1952-7-17',
--     'michael@knight_industries.com',
--     '(555) 435-1949',
--     '1982 Kitt Street',
--     'Richmond',
--     'UT',
--     84333
-- );
-- (
--     'Fred',
--     'Jones',
--     '1946-3-12',
--     'bo@hazzard.com',
--     '(555) 801-1969',
--     '1997 Welker Way',
--     'Trenton',
--     'UT',
--     84338
-- );
-- (
--     'Thomas',
--     'Magnum',
--     '1945-1-29',
--     ',
--     '(555) 435-1980',
--     '1988 Oahu Way',
--     'Hyde Park',
--     'UT',
--     84318
-- );
(
--     'Bosco Albert''BA',
--     'Baracus',
--     '1952-5-21',
--     'ba@a-team.com',
--     '(555) 801-1983',
--     '1987 Tureaud Blvd',
--     'Cache Junction',
--     'UT',
--     84304
-- );
(
    'Emmett''Doc',
    'Brown',
    '1938-10-22',
    'doc@hazzard.com',
    '(555) 435-1985',
    '1990 Future Way',
    'Newton',
    'UT',
    84327
);
SELECT *
FROM employee;
SELECT *
FROM customer;
UPDATE customer
SET email = 'fred@mystery_machine.com'
WHERE customer_id = 5;
UPDATE customer
SET email = 'magnum@PI.com'
WHERE customer_id = 8;
SELECT employee.employee_id,
    customer.customer_id,
    employee.phone,
    customer.phone
FROM employee
    JOIN salesperson ON employee.employee_id = salesperson.employee_id
    JOIN sales_receipt ON salesperson.salesperson_id = sales_receipt.salesperson_id
    JOIN customer ON sales_receipt.customer_id = customer.customer_id
GROUP BY employee.employee_id,
    customer.customer_id
ORDER BY employee.phone,
    customer.phone;
UPDATE customer
SET phone = '(555) 515-1985'
WHERE customer_id = 10;
SELECT *
FROM customer;