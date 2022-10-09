--What makes a customer:
    -- first_name VARCHAR(50),
    -- last_name VARCHAR(50),
    -- dob DATE,
    -- email VARCHAR(75),
    -- phone VARCHAR(20),
    -- "address" VARCHAR(75),
    -- city VARCHAR(50),
    -- "state" VARCHAR(2),
    -- zip INTEGER,
    -- category VARCHAR(50)

-- FUNCTION: add_employee:
DROP FUNCTION IF EXISTS add_customer CASCADE;
CREATE OR REPLACE FUNCTION add_customer(
   _first_name VARCHAR(50),
   _last_name VARCHAR(50),
   _dob DATE,
   _email VARCHAR(75),
   _phone VARCHAR(20),
   _address VARCHAR(75),
   _city VARCHAR(50),
   _state VARCHAR(2),
   _zip INTEGER,
   _category TEXT
    ) RETURNS void AS $$ BEGIN
INSERT INTO customer(
    first_name,
    last_name,
    dob,
    email,
    phone,
    "address",
    city,
    "state",
    zip,
    category
    )
VALUES(
    _first_name,
    _last_name,
    _dob,
    _email,
    _phone,
    _address,
    _city,
    _state,
    _zip, 
    _category
    );
END;
$$ LANGUAGE plpgsql;

SELECT add_customer(
    'Jessica',
    'Fletcher',
    '1925-10-16',
    'jessicaf@murder_she_wrote.com',
    '(555) 515-1984',
    '96 Lansbury Lane', 
    'Logan',
    'UT',
    84323,
    'service center client'
);

SELECT add_customer(
    'Samuel "Sam"',
    'Malone',
    '1947-12-29',
    'sam@cheers.com',
    '(555) 801-2108',
    '1982 Red Sox Road',
    'Trenton',
    'UT',
    84338,
    'sales and service center client'
);

SELECT add_customer(
    'Sharona',
    'Fleming',
    '1968-07-17',
    'bitty@monk.com',
    '(555) 712-2002 ',
    '23 Schram Street',
    'Providence',
    'UT',
    84332,
    'service center client'
);

SELECT add_customer(
    'Temperance',
    'Brennan',
    '1976-10-11',
    'bones@jeffersonian.com',
    '(555) 913-2005',
    '2017 Hanson Way',
    'Paradise',
    'UT',
    84328,
    'sales and service center client'
);

SELECT add_customer(
    'Beauregard "Bo"',
    'Duke',
    '1960-4-8',
    'bo@hazzard.com',
    '(555) 435-1979',
    '1985 Schneider Place',
    'Newton',
    'UT',
    84327,
    'service center client'
);

SELECT add_customer(
    'Michael',
    'Knight',
    '1952-7-17',
    'michael@knight_industries.com',
    '(555) 435-1949',
    '1982 Kitt Street',
    'Richmond',
    'UT',
    84333,
    'sales client'
);

SELECT add_customer(
    'Fred',
    'Jones',
    '1946-3-12',
    'fred@mystery_machine.com',
    '(555) 801-1969',
    '1997 Welker Way',
    'Trenton',
    'UT',
    84338,
    'sales and service client'
);

SELECT add_customer(
    'Thomas',
    'Magnum',
    '1945-1-29',
    'magnum@PI.com',
    '(555) 435-1980',
    '1988 Oahu Way',
    'Hyde Park',
    'UT',
    84318,
    'sales and service client'
);

SELECT add_customer(
    'Bosco Albert "BA"',
    'Baracus',
    '1952-5-21',
    'ba@a-team.com',
    '(555) 801-1983',
    '1987 Tureaud Blvd',
    'Cache Junction',
    'UT',
    84304,
    'sales client'  
);

SELECT add_customer(
    'Emmett "Doc"',
    'Brown',
    '1938-10-22',
    'doc@future.com',
    '(555) 435-1985',
    '1990 McFly Drive',
    'Newton',
    'UT',
    84327,
    'sales client'
);

SELECT * FROM customer;

SELECT add_customer(
    'James "Jim"',
    'Douglas',
    '1931-01-25',
    'jim@lovebug.com',
    '(555) 515-1969',
    '1997 El Dorado Way',
    'Cornish',
    'UT',
    84308,
    'sales client'  
);

SELECT add_customer(
    'David "Dave"',
    'Starsky',
    '1943-03-25',
    'dave@baycitypd.com',
    '(555)',
    '3 Zebra Drive',
    'Wellsville',
    'UT',
    84339,
    'sales and service client'
);

UPDATE customer
SET phone = '(555) 315-1979'
WHERE customer_id = 12;

SELECT customer_id, first_name, last_name, category 
FROM customer ORDER BY customer_id;

UPDATE customer
SET category = 'sales and service client'
WHERE customer_id = 4;

UPDATE customer
SET category = 'sales and service client'
WHERE customer_id = 2;

SELECT * FROM customer
ORDER BY customer_id;

SELECT add_customer(
    'James "OO7"',
    'Bond',
    '1930-08-25',
    'bond@mi6.com',
    '(555) 801-1962',
    '7 Connery Lane',
    'Hyde Park',
    'UT',
    84318,
    'sales client'
);