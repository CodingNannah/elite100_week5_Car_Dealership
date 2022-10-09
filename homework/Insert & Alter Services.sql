INSERT INTO Services (
        services_name,
        services_description,
        -- VARCHAR(200)
        services_price -- NUMERIC(8, 2)
    )
VALUES (
        'Yearly Tune-up',
        'oil change, tires rotated & filled, fluids topped off, new spark plugs and filters; hoses, belts, etc. checked; old cars - ignition system optimized',
        250.00
    );
INSERT INTO Services (
        services_name,
        services_description,
        -- VARCHAR(200)
        services_price -- NUMERIC(8, 2)
    )
VALUES (
        'Warning Light Check',
        'diagnostic',
        17.00
    );
INSERT INTO Services (
        services_name,
        services_description,
        -- VARCHAR(200)
        services_price -- NUMERIC(8, 2)
    )
VALUES (
        'Wiper Adjustment',
        '1 set of new wipers, wiper fluid topped, wipers calibrated',
        57.00
    );
INSERT INTO Services (
        services_name,
        services_description,
        -- VARCHAR(200)
        services_price -- NUMERIC(8, 2)
    )
VALUES (
        'Tire Rotation',
        'rotate all four tires',
        90.00
    );
INSERT INTO Services (
        services_name,
        services_description,
        -- VARCHAR(200)
        services_price -- NUMERIC(8, 2)
    )
VALUES (
        'AC Tune-up',
        'general AC check & updates, barring extensive repairs',
        150.00
    );
INSERT INTO Services (
        services_name,
        services_description,
        -- VARCHAR(200)
        services_price -- NUMERIC(8, 2)
    )
VALUES (
        'Classic Cars Deep Dive',
        'diagnostic evaluation of all systems; recommendations for repairs, upgrades, or authentic parts, acquisition of classic vehicle parts - minimum $250',
        250.00
    );
INSERT INTO Services (
        services_name,
        services_description,
        -- VARCHAR(200)
        services_price -- NUMERIC(8, 2)
    )
VALUES (
        'Repair Quote',
        'evaluation & recommendation',
        20.00
    );

SELECT * FROM services;