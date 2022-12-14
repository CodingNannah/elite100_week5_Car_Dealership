-- Stored procedures and stored functions
-- Explore Data
SELECT *
FROM payment;
-- Stored Procedure Example
-- Simulating a late fee charge
CREATE OR REPLACE PROCEDURE latefee(customer INTEGER, lateFeeAmount DECIMAL) AS $$ BEGIN -- Add late fee to customer payment amount
UPDATE payment
SET amount = amount + lateFeeAmount
WHERE customer_id = customer;
-- Commit the above statement inside of a transaction
COMMIT;
END;
$$ LANGUAGE plpgsql;
-- Calling
CALL latefee(341, 120.00);
-- Validate chages
SELECT *
FROM payment
WHERE customer_id = 341;
-- DROP procedure
DROP PROCEDURE latefee;
-- Stored Functions Example
-- Stored Function to insert data into actor
CREATE OR REPLACE FUNCTION add_actor(
        _actor_id INTEGER,
        _first_name VARCHAR,
        _last_name VARCHAR,
        _last_update TIMESTAMP WITHOUT TIME ZONE
    ) RETURNS void AS $MAIN$ BEGIN
INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES(_actor_id, _first_name, _last_name, _last_update);
END;
$MAIN$ LANGUAGE plpgsql;
SELECT add_actor(500, 'Kevin', 'Hart', NOW()::timestamp) -- Verify that it worked
SELECT *
FROM actor
WHERE actor_id = 500;
-- DELETE function
DROP FUNCTION add_actor