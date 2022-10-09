-- What make up services:
--     services_name VARCHAR(30),
--     services_description TEXT,
--     services_price NUMERIC(8,2)

-- Create FUNCTION add_service:

CREATE OR REPLACE FUNCTION add_service(
        _services_name VARCHAR(30),
        _services_description TEXT,
        _services_price NUMERIC(8,2)
    ) RETURNS void AS $$ BEGIN
INSERT INTO services(
        services_name, 
        services_description, 
        services_price
)
VALUES(
        _services_name,
        _services_description,
        _services_price
    );
END;
$$ LANGUAGE plpgsql;

SELECT add_service(
    'Yearly Tune-up',
    'oil change, tires rotated & filled, fluids topped off, new spark plugs and filters; hoses, belts, etc. checked; old cars - ignition system optimized',
    250.00
 );

 SELECT add_service(
    'Warning Light Check',
    'diagnostic of warning light indicator with recommendations and a quote for any repairs',
    17.00
 );

 SELECT add_service(
    'Wiper Adjustment',
    '1 set of new premium wipers, wiper fluid topped, wipers calibrated; additional charge if vehicle has additional wiper array',
    57.00
 );

 SELECT add_service(
    'Tire Rotation',
    'rotate all four existing tires',
    90.00
 );

 SELECT add_service(
    'AC Tune-up',
    'general AC check & updates with a quote for any extensive repairs',
    150.00
 );

 SELECT add_service(
    'Classic Cars Deep Dive',
    'We LOVE classic cars! a diagnostic evaluation of all systems; recommendations for repairs, upgrades, obtaining authentic parts, etc. starts at $250 with a quote for additional needs',
    250.00
 );

 SELECT add_service(
    'Repair Quote',
    'Got zinged? We offer an honest evaluation with recommendations.',
    20.00
 );

 SELECT add_service(
    'Miscellaneous Services',
    'Repairs, parts, and services provided by and agreed upon from previous quotes. Minimum: 50.00',
    50.00
 );

SELECT *
FROM services;