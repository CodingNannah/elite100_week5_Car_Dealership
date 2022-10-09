-- What makes a vehicle:
    -- make VARCHAR(50),
--     model VARCHAR(50),
--     color VARCHAR(50),
--     year INTEGER,
--     price NUMERIC (10, 2),
--     sold BOOLEAN,
--     from_inventory BOOLEAN,
--     note TEXT

-- FUNCTION: add_vehicle
CREATE OR REPLACE FUNCTION add_vehicle(
    _make VARCHAR(50),
    _model VARCHAR(50),
    _color VARCHAR(50),
    _year INTEGER,
    _price NUMERIC (10, 2),
    _sold BOOLEAN,
    _from_inventory BOOLEAN,
    _note TEXT
    ) RETURNS void AS $$ BEGIN
INSERT INTO vehicle(
    make,
    model,
    color,
    year,
    price,
    sold,
    from_inventory,
    note
    )
VALUES(
    _make,
    _model,
    _color,
    _year, -- DATE, format "year-mo-da"
    _price, --NUMERIC(10,2)
    _sold, --BOOLEAN
    _from_inventory, --BOOLEAN
    _note
    );
END;
$$ LANGUAGE plpgsql;

SELECT add_vehicle(
    'Volvo',
    '740 GLE Wagon',
    'pebble grey',
    1990,
    22675.00,
    'No',
    'No',
    'owner uses service station'
 );

SELECT add_vehicle(
    'Buick',
    'Grand National',
    'light emerald metallic [green]',
    1987,
    44900.00,
    'No',
    'Yes',
    'none'
 );

SELECT add_vehicle(
    'Ford',
    'Mustang convertible',
    'sapphire blue',
    1966,
    59995.00,
    'Yes',
    'Yes',
    'sold and serviced here'
 );

SELECT add_vehicle(
    'Ford',
    'Explorer XLT',
    'custom: Jurassic Park',
    1993,
    18700.00,
    'No',
    'Yes',
    'none'
 );

SELECT add_vehicle(
    'DeLorean',
    'DMC-12',
    'stainless steel',
    1982,
    60300.00,
    'Yes',
    'Yes',
    'sold and serviced here'
 );

SELECT add_vehicle(
    'Aston Martin',
    'DB5',
    'skyfall silver',
    1963,
    1421495,
    'No',
    'Yes',
    'potential customer: James Bond is interested'
 );

SELECT * FROM vehicle;

SELECT add_vehicle(
    'BMW',
    '750iL sedan',
    'brocade red metallic [rust]',
    1995,
    83559.00,
    'No',
    'Yes',
    'none'
 );

SELECT add_vehicle( 
    'Pontiac',
    'Firebird',
    'dark jadestone metallic [black]',
    1982,
    12500.00,
    'Yes',
    'Yes',
    'sold and serviced here'
);

SELECT add_vehicle( 
    'Porsche',
    'Panamera S',
    'mahogani metallic [brown]',
    2015,
    108279.00,
    'No',
    'Yes',
    'none'
);

SELECT add_vehicle(
    'Porsche',
    'Panamera S',
    'aqua blue metallic',
    2015,
    108279.00,
    'No',
    'Yes',
    'acquired 10/5/2022 from Porsche USA');

SELECT * FROM vehicle;

UPDATE vehicle
SET note = 'acquired 10/5/2022 from Porsche USA'
WHERE vehicle_id = 9;

UPDATE vehicle
SET note = 'not sold but serviced here'
WHERE vehicle_id = 1;

SELECT add_vehicle( 
    'GMC',
    'G-15',
    'dark jadestone metallic',
    1983,
    15995.00,
    'No',
    'No',
    'not sold but serviced here'
);

SELECT add_vehicle( 
    'Ferrari',
    '308 GTS convertible',
    'red',
    1977,
    65997.00,
    'Yes',
    'Yes',
    'sold and serviced here'
);

SELECT add_vehicle(
    'Chevrolet',
    'Corvette ZR1',
    'bluestream tintcoat metallic',
    2009,
    103795.00,
    'No',
    'Yes',
    'none'
 );

SELECT add_vehicle( 
    'Acura',
    'Legend',
    'blade silver metallic',
    1986,
    45879.00,
    'No',
    'Yes',
    'none'
);

SELECT add_vehicle(
    'Dodge',
    'Charger',
    'custom: General Lee',
    1969,
    17120.00,
    'No',
    'No',
    'not sold here but serviced here'
);

SELECT * FROM vehicle;

UPDATE vehicle
SET note = 'not sold here but serviced here'
WHERE vehicle_id = 1;

UPDATE vehicle
SET note = 'not sold here but serviced here'
WHERE vehicle_id = 11;

SELECT add_vehicle(
    'Acura',
    'Legend',
    'cool rose metallic [pink]',
    1986,
    42500.00,
    'No',
    'No',
    'not sold here but serviced here'
 );

SELECT add_vehicle(
    'Ford',
    'F1 4x2',
    'omaha orange [rust]',
    1951,
    80000.00,
    'No',
    'Yes',
    'none'
 );

SELECT add_vehicle( 
    'Ford',
    'Gran Torino',
    'bright red',
    1977,
    17500.00,
    'Yes',
    'Yes',
    'sold and not yet serviced here'
);

SELECT add_vehicle(
    'Pontiac',
    'Firebird',
    'bahia green metallic',
    1977,
    38700.00,
    'No',
    'Yes',
    'none'
 );

SELECT add_vehicle( 
    'Chrysler',
    'Imperial',
    'moss gold metallic',
    1966,
    13950.00,
    'No',
    'Yes',
    'none'
);

SELECT add_vehicle(
    'Ford',
    'Econoline Van',
    'custom: Mystery Machine',
    1963,
    17800.00,
    'Yes',
    'Yes',
    'sold and serviced here'
 );

SELECT add_vehicle( 
    'Toyota',
    'Supra',
    'super red',
    1993,
    37799,
    'No',
    'Yes',
    'none'
);

SELECT add_vehicle( 
    'VW',
    'Beetle',
    'custom: Herbie Love Bug',
    1963,
    34995.00,
    'Yes',
    'Yes',
    'sold but NOT YET serviced here'
);

SELECT * FROM vehicle ORDER BY vehicle_id;
--***************************************************************
-- Gathering & correcting info to create sales and service slips:
UPDATE vehicle
SET note = 'sold here; owner services it himself'
WHERE vehicle_id = 11;

UPDATE vehicle
SET sold = 'Yes'
WHERE vehicle_id = 11;

UPDATE vehicle
SET from_inventory = 'Yes'
WHERE vehicle_id = 11;

UPDATE vehicle
SET note = 'sold here; owner services it himself'
WHERE vehicle_id = 23;

SELECT vehicle_id, note, make, model FROM vehicle
WHERE note = 'sold and serviced here'
ORDER BY vehicle_id;

UPDATE vehicle
SET note = 'sold here; owner services it himself'
WHERE vehicle_id = 5;

UPDATE vehicle
SET note = 'sold here; owner services it himself'
WHERE vehicle_id = 8;

SELECT * FROM vehicle
WHERE note = 'sold and serviced here'
ORDER BY vehicle_id;

SELECT * FROM vehicle
WHERE note = 'sold here; owner services it himself'
ORDER BY vehicle_id;

SELECT * FROM vehicle
WHERE note = 'not sold here but serviced here'
ORDER BY vehicle_id;

SELECT * FROM vehicle 
WHERE vehicle_id = 15;

-- Sam's car:
UPDATE vehicle
SET sold = 'Yes'
WHERE vehicle_id = 13;

UPDATE vehicle
SET note = 'sold and serviced here'
WHERE vehicle_id = 13;

UPDATE vehicle
SET note = 'sold and serviced here'
WHERE vehicle_id = 18;
