--What makes an employee:
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     department VARCHAR(10),
--     position VARCHAR(20),
--     email VARCHAR(75),
--     phone VARCHAR(20),
--     "address" VARCHAR(75),
--     city VARCHAR(50),
--     "state" VARCHAR(2),
--     zip INTEGER, 
--     current_employee BOOLEAN,
--     note TEXT

-- FUNCTION: add_employee:
CREATE OR REPLACE FUNCTION add_employee(
    _first_name VARCHAR(50),
    _last_name VARCHAR(50),
    _department VARCHAR(10),
    _position VARCHAR(20),
    _email VARCHAR(75),
    _phone VARCHAR(20),
    _address VARCHAR(75),
    _city VARCHAR(50),
    _state VARCHAR(2),
    _zip INTEGER, 
    _current_employee BOOLEAN,
    _note TEXT
    ) RETURNS void AS $$ BEGIN
INSERT INTO employee(
    first_name,
    last_name,
    department,
    position,
    email,
    phone,
    "address",
    city,
    "state",
    zip, 
    current_employee,
    note
    )
VALUES(
    _first_name,
    _last_name,
    _department,
    _position,
    _email,
    _phone,
    _address,
    _city,
    _state,
    _zip, 
    _current_employee, --BOOLEAN
    _note
    );
END;
$$ LANGUAGE plpgsql;

SELECT add_employee(
    'William "Number One"',
    'Ryker',
    'Office',
    'General Manager',
    'ryker@enterprise47.com',
    '(555) 474-4747',
    '47 Frakes Ave',
    'Nibley',
    'UT',
    84321,
    'Yes',
    'stellar employee'  
 );

UPDATE employee
SET department = 'All'
WHERE employee_id = 1;

SELECT add_employee(
    'Leland',
    'Stottlemeyer',
    'Office',
    'Manager',
    'leland@sfpd.com',
    '(555) 651-1956',
    '51 Monk Dr',
    'Brigham City',
    'UT',
    84302,
    'Yes',
    'runs a strict but relaxed office' 
 );

SELECT add_employee(
    'Nyota',
    'Uhura',
    'Office',
    'Senior',
    'uhura@enterprise66.com',
    '(555) 555-1966',
    '23 Nichols Way',
    'Paradise',
    'UT',
    84328,
    'Yes',
    'best receptionist and phone systems operator 50 years running' 
 );

SELECT add_employee(
    'Felicity',
    'Smoak',
    'Office',
    'Mid-level',
    'overseer@arrow.com',
    '(555) 984-2012',
    '23 Overwatch Pass',
    'Hyrum',
    'UT',
    84319,
    'Yes',
    'terrific at overseeing projects'
 );

SELECT add_employee(
    'Drew',
    'Carey',
    'Office',
    'Mid-level',
    'dc@cleveland.com',
    '(555) 523-1958',
    '15 Ohio Dr',
    'Amalga',
    'UT',
    84335,
    'Yes',
    'welcome comedy relief in the office'
 );

UPDATE employee
SET first_name = 'Andrew "Drew"'
WHERE last_name = 'Carey';

SELECT add_employee(
    'Kelly',
    'Grayson',
    'Office',
    'Junior',
    'kelly@orville.com',
    '(555) 435-2421',
    '2414 Palicki Place',
    'Smithfield',
    'UT',
    84335,
    'Yes',
    'rising star in the office'
 );

SELECT add_employee(
    'Bailey',
    'Quarters',
    'Office',
    'Intern',
    'bailey@wkrp.com',
    '(555) 435-1978',
    '1982 Cincinnati Dr',
    'Logan',
    'UT',
    84321,
    'Yes',
    'handles all work, personalities, and the radio dial with style'
 );

SELECT add_employee(
    'Michael',
    'Scott',
    'Sales',
    'Manager',
    'mikey@dunder.com',
    '(555) 415-1965',
    '40 Mifflin St',
    'Mendon',
    'UT',
    84325,
    'Yes',
    'sales team supports his comedic approach to sales'
 );

SELECT add_employee(
    'Robert "Bob"',
    'Parr',
    'Sales',
    'Mid-level',
    'mr_incredible@parr.com',
    '(555) 208-2004',
    '1960 Superhero Dr',
    'Franklin',
    'ID',
    83237,
    'Yes',
    'Bob tends to disappear often, but his attention to customers and his work cannot be faulted'
 );

 SELECT add_employee(
    'Flo',
    'Courtney',
    'Sales',
    'Junior',
    'flo@progressive.com',
    '(555) 435-2008',
    '100 Insurance Way',
    'River Heights',
    'UT',
    84332,
    'Yes',
    'Her sales technique is progressively improving.'
 );

UPDATE employee
SET first_name = 'Florence "Flo"'
WHERE last_name = 'Courtney';

SELECT add_employee(
    'Jake',
    'Farmer',
    'Sales',
    'Intern',
    'jakey@state.com',
    '(555) 801-2020 ',
    '2022 Kevin Blvd',
    'North Logan',
    'UT',
    84341,
    'Yes',
    'charismatic sales intern' 
 );

UPDATE employee
SET first_name = 'Jacob "Jake"'
WHERE last_name = 'Farmer';

 SELECT add_employee(
    'Montgomery''Scotty',
    'Scott',
    'Mechanic',
    'Manager',
    'scotty@enterprise66.com',
    '(555) 801-2266',
    '24 Doohan Place',
    'Hyde Park',
    'UT',
    84318,
    'Yes',
    'He gives everything all he has got.' 
 );

UPDATE employee
SET first_name = 'Montgomery "Scotty"'
WHERE last_name = 'Scott';

SELECT * FROM employee;

-- DELETE FROM employee
-- WHERE employee_id = 8;

UPDATE employee
SET first_name = 'Michael'
WHERE employee_id = 8;

SELECT * FROM employee
ORDER BY employee_id;

SELECT add_employee(
    'Benjamin "Cooter"',
    'Davenport',
    'Mechanic',
    'Senior',
    'cooter@hazzard.com',
    '(555) 435-1946',
    '1969 Dodge Way',
    'Millville',
    'UT',
    84326,
    'Yes',
    'He might be crazy, but he is definitely not dumb.'
 );

SELECT add_employee(
    'Angus "Mac"',
    'MacGyver',
    'Mechanic',
    'Senior',
    'mac@phoenix.com',
    '(555) 435-1985',
    'Slip 2 Hyrum Dam',
    'Hyrum',
    'UT',
    84319,
    'Yes',
    'Mac can fix anything with anything.'
 );

SELECT add_employee(
    'Geordi',
    'LaForge',
    'Mechanic',
    'Senior',
    'laforge@enterprise47.com',
    '(555) 435-1987',
    '2002 Burton Dr',
    'Richmond',
    'UT',
    84333,
    'Yes',
    'Though, he is technically blind, Geordi has an uncanny ability to work with electric and mechanical systems.'
 );

SELECT add_employee(
    'Chewbacca "Chewy"',
    'Wookie',
    'Mechanic',
    'Mid-level',
    'chewie@starwars.com',
    '(555) 515-5555',
    '1300 Corellia Place',
    'Wellsville',
    'UT',
    84339,
    'Yes',
    'He may be hairy all over, but Chewie can do the work of two mechanics.'
     );
UPDATE employee
SET position = 'Junior'
WHERE employee_id = 16;

SELECT add_employee(
    'R2',
    'D2',
    'Mechanic',
    'Junior',
    'R2D2@astromech.com',
    '(555) 555-2222',
    '22 Star Wars Blvd',
    'Cornish',
    'UT',
    84308,
    'Yes',
    'R2 came highly recommended by Chewbacca. He has proved that droids are a valuable asset to the services department.'
 );

SELECT add_employee(
    'Charlotte "Charlie"',
    'Watson',
    'Mechanic',
    'Intern',
    'charlie@vwbug.com',
    '(555) 208-2018',
    '1987 Bumblebee Way',
    'Newton',
    'UT',
    84327,
    'Yes',
    'Charlie works hard and brings the tunes!'
 );

 SELECT * FROM employee
 ORDER BY employee_id;

UPDATE employee
SET position = 'Mid-Level'
WHERE employee_id = 15;

UPDATE employee
SET current_employee = 'No',
note = 'left note in manager box: went home to Kashyyyk and will not return; address unknown'
WHERE employee_id = 16;