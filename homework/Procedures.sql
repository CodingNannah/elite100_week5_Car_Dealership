DROP PROCEDURE update_price;
CREATE OR REPLACE PROCEDURE update_price(
        vehicleID INTEGER,
        vehiclePrice NUMERIC,
        updatedPrice NUMERIC
    ) AS $$ BEGIN
UPDATE vehicle
SET price = updatedPrice
WHERE vehicle_id = vehicleID;
COMMIT;
END;
$$ LANGUAGE plpgsql;
S CALL update_price(, 37799.00, 35799.00);
SELECT *
FROM vehicle;