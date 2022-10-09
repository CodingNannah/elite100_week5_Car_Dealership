-- Create Procedure update_price for vehicle price changes:
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
CALL update_price(22, 37799.00, 35799.00);
SELECT *
FROM vehicle;

-- ****************************************
-- Create Procedure update_services_price for updating charges for any services,
-- especially handy for services_id 8:
DROP PROCEDURE update_services_price;
CREATE OR REPLACE PROCEDURE update_services_price(
    servicesID INTEGER,
    servicesPrice NUMERIC,
    updatedServicesPrice NUMERIC
    ) AS $$ BEGIN
UPDATE services
SET services_price = updatedServicesPrice
WHERE services_id = servicesID;
COMMIT;
END;
$$ LANGUAGE plpgsql;
CALL update_price(2, 17.00, 22.50);
SELECT *
FROM services;