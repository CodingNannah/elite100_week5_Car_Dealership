SELECT *
FROM employee;
CREATE OR REPLACE FUNCTION add_employee(
        _first_name VARCHAR,
        _last_name VARCHAR,
        _department VARCHAR DEFAULT 'unassigned',
        _position VARCHAR DEFAULT 'undetermined',
        _email VARCHAR DEFAULT 'unknown',
        _phone VARCHAR DEFAULT 'unknown',
        _address VARCHAR DEFAULT 'unknown',
        _city VARCHAR DEFAULT 'unknown',
        _state VARCHAR DEFAULT 'UT',
        _zip INTEGER DEFAULT 84321,
        _current_employee BOOLEAN DEFAULT 'Yes',
        _note TEXT DEFAULT 'None'
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
        _current_employee,
        _note
    );
END;
$$ LANGUAGE plpgsql;
--*****************************************
SELECT * FROM customer;
CREATE OR REPLACE FUNCTION add_customer(
        _first_name VARCHAR,
        _last_name VARCHAR,
        _dob DATE,
        _email VARCHAR,
        _phone VARCHAR,
        _address VARCHAR,
        _city VARCHAR,
        _state VARCHAR,
        _zip INTEGER,
        _type BOOLEAN,
        _note TEXT
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
        zip ,
        "type",
        note)
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
        _type,
        _note
    );
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM customer;
--***************************************
SELECT *
FROM vehicle;
ALTER TABLE vehicle
ADD COLUMN note VARCHAR(50);
ALTER TABLE vehicle
ALTER COLUMN note
SET DATA TYPE TEXT;
ALTER TABLE vehicle
ADD COLUMN sold_here BOOLEAN;
SELECT *
FROM vehicle;
DROP PROCEDURE never_inventory;
DROP FUNCTION never_inventory;
CREATE OR REPLACE FUNCTION never_inventory(
        makeInfo VARCHAR,
        modelInfo VARCHAR,
        colorInfo VARCHAR,
        yearInfo INTEGER,
        priceInfo NUMERIC,
        noteInfo TEXT,
        neverInventory BOOLEAN
    ) RETURNS void AS $$ BEGIN
INSERT INTO vehicle(make, model, color, year, price, note, sold_here)
VALUES(
        makeInfo,
        modelInfo,
        colorInfo,
        yearInfo,
        priceInfo,
        noteInfo,
        neverInventory
    );
END;
$$ LANGUAGE plpgsql;
SELECT never_inventory(
        'Acura',
        'Legend',
        'cool rose metallic [pink]',
        1986,
        42500.00,
        'never in inventory: owned by service center customer',
        'No'
    );
SELECT *
FROM vehicle;
--*****************************************
-- CREATE OR REPLACE FUNCTION former_employee(
--         _first_name VARCHAR,
--         _last_name VARCHAR,
--         _note TEXT,
--         _email VARCHAR DEFAULT 'unknown',
--         _phone VARCHAR DEFAULT 'unknown',
--         _address VARCHAR DEFAULT 'unknown',
--         _city VARCHAR DEFAULT 'unknown',
--         _state VARCHAR DEFAULT 'UT',
--         _zip INTEGER DEFAULT 84321,
--         _current_employee BOOLEAN DEFAULT 'Yes',
--         _department VARCHAR DEFAULT 'unassigned',
--         _position VARCHAR DEFAULT 'undetermined'
--     ) RETURNS void AS $$ BEGIN
-- UPDATE employee
-- SET current_employee = currentEmployee
-- WHERE email = emailInfo;
-- VALUES(
--         emailInfo,
--         currentEmployee,
--         noteInfo
--     );
-- END;
-- $$ LANGUAGE plpgsql;
-- DELETE FROM employee
-- WHERE employee_id = 20;
-- DROP FUNCTION former_employee;
-- SELECT oid:: regprocedure
-- FROM pg_proc
-- WHERE proname = 'former employee';
SELECT *
FROM employee;
UPDATE employee
SET note
SELECT former_employee(
        19,
        'No',
        'Chewbacca left a note with his Manager; no forwarding address. He moved back to Kashyyyk, stating he was unhappy with fellow employees misspelling his name and management not advancing him to Senior level mechanic. Scotty replied that Chewie is spelled many ways even by Chewbacca, and Chewie requires orders from Senior mechanics to know what to do next.'
    );
SELECT *
FROM employee;
ROLLBACK;
DELETE FROM employee
WHERE employee_id = 19;