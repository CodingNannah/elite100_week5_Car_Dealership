-- FUNCTIONS
SELECT *
FROM payment;
SELECT customer_id,
    amount
FROM payment;
-- PROCEDURES
-- adding a latefee to one customer to one specific payment
DROP PROCEDURE latefee;
CREATE OR REPLACE PROCEDURE latefee(
        -- Parameters section:
        -- Pass in parameters: need customer_id, payment_id, latefee amount
        customer INTEGER,
        -- parameter must be named dif from column that will be called:
        paymentId INTEGER,
        -- lateFeeAmount is camel case - no spacing or underscores
        lateFeeAmount DECIMAL
    ) AS -- PROCEDURE BODY:
    -- start & end dollar signs - like parentheses for functions
    $$ BEGIN -- changing data is UPDATE
UPDATE payment -- SET for what column changing:
SET amount = amount + lateFeeAmount
WHERE customer_id = customer
    AND payment_id = paymentId;
COMMIT;
END;
-- semicolon goes at end of END before end dollar signs 
$$ LANGUAGE plpgsql;
-- p = procedural, l= language, pgsql = post-gres SQL
CALL latefee(343, 17514, 100.00) -- Oops! wrong one -- Reverse it.
CALL latefee(343, 17514, -100.00)
SELECT customer_id,
    payment_id,
    amount
FROM payment
WHERE customer_id = 343 -- AND payment_id = 17514
ORDER BY payment_id ASC;
-- FUNCTION
-- add a new actor into actor table
DROP FUNCTION add_actor;
CREATE OR REPLACE FUNCTION add_actor(
        -- do not name parameters same as columns
        _first_name VARCHAR,
        _last_name VARCHAR
    ) RETURNS void -- void = None
    AS $Main$ -- could use just $$; tags aren't necessary
    BEGIN
INSERT INTO actor(first_name, last_name) -- parameters become values
VALUES(_first_name, _last_name);
-- semicolon to break function body
END;
-- semicolon to break end of main function
$Main$ LANGUAGE plpgsql;
SELECT add_actor('Tom', 'Hardy');
SELECT add_actor('Dylan', 'Smith');
SELECT first_name,
    last_name
FROM actor
ORDER BY first_name;