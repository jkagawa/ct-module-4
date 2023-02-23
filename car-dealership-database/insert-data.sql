-- Insert customer 1
INSERT INTO customer (
    customer_id,
    first_name,
    last_name,
    email,
    address,
    pay_info
) VALUES (
    1,
    'John',
    'Smith',
    'johns@example.com',
    '123 West St., Nowhere, NY 10001',
    '123-456-789-000'
);

-- Insert customer 2
INSERT INTO customer (
    customer_id,
    first_name,
    last_name,
    email,
    address,
    pay_info
) VALUES (
    2,
    'Emma',
    'Parton',
    'emmap@example.com',
    '500 West St., Nowhere, NY 10001',
    '456-000-111-000'
);

-- Insert customer car 1
INSERT INTO customer_car (
    serial_number,
    make,
    model,
    year,
    color,
    customer_id
) VALUES (
    'A100B100',
    'Toyota',
    'Prius',
    2018,
    'Red',
    1
);

-- Insert customer car 2
INSERT INTO customer_car (
    serial_number,
    make,
    model,
    year,
    color,
    customer_id
) VALUES (
    'A200B200',
    'BMW',
    '330i',
    2022,
    'White',
    2
);

-- Insert customer car 3
INSERT INTO customer_car (
    serial_number,
    make,
    model,
    year,
    color,
    customer_id
) VALUES (
    'A300B300',
    'Subaru',
    'Forester',
    2023,
    'Black',
    1
);

-- Insert sales staff 1
INSERT INTO sales_staff (
    staff_id,
    name
) VALUES (
    1,
    'Joel Miller'
);

-- Insert sales staff 2
INSERT INTO sales_staff (
    staff_id,
    name
) VALUES (
    2,
    'Ellie Jones'
);

-- Insert sales staff 3
INSERT INTO sales_staff (
    staff_id,
    name
) VALUES (
    3,
    'Steve Curry'
);

-- Insert mechanic 1
INSERT INTO mechanic (
    mechanic_id,
    name
) VALUES (
    1,
    'Elijah Cooper'
);

-- Insert mechanic 2
INSERT INTO mechanic (
    mechanic_id,
    name
) VALUES (
    2,
    'Thomas Richard'
);

-- Insert mechanic 3
INSERT INTO mechanic (
    mechanic_id,
    name
) VALUES (
    3,
    'Dennis Carver'
);

-- Insert car sold 1
INSERT INTO car_for_sale (
    car_id,
    make,
    model,
    year,
    color,
    is_new,
    price
) VALUES (
    1,
    'Jeep',
    'Wrangler',
    2021,
    'Green',
    TRUE,
    23999.00
);

-- Insert car sold 2
INSERT INTO car_for_sale (
    car_id,
    make,
    model,
    year,
    color,
    is_new,
    price
) VALUES (
    2,
    'Honda',
    'CRV',
    2022,
    'Silver',
    TRUE,
    24999.00
);

-- Insert car sold 3
INSERT INTO car_for_sale (
    car_id,
    make,
    model,
    year,
    color,
    is_new,
    price
) VALUES (
    3,
    'Ford',
    'F150',
    2019,
    'Blue',
    FALSE,
    26499.00
);

-- Stored function to insert data into service_invoice
CREATE OR REPLACE FUNCTION add_service_invoice(
	_invoice_id INTEGER,
    _invoice_date TIMESTAMP WITHOUT TIME ZONE,
    _total_cost NUMERIC,
    _serial_number VARCHAR
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO service_invoice(invoice_id, invoice_date, total_cost, serial_number)
	VALUES (_invoice_id, _invoice_date, _total_cost, _serial_number);
END;
$MAIN$
LANGUAGE plpgsql;

-- Call the function
SELECT add_service_invoice(1, NOW()::timestamp, 0, 'A300B300');
SELECT add_service_invoice(2, NOW()::timestamp, 0, 'A200B200');

-- Delete the stored function
DROP FUNCTION add_service_invoice;

-- Stored function to insert data into service_history
CREATE OR REPLACE FUNCTION add_service_history(
	_service_id INTEGER,
	_service_date TIMESTAMP WITHOUT TIME ZONE,
	_type_of_service VARCHAR,
	_serial_number VARCHAR,
    _invoice_id INTEGER
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO service_history(service_id, service_date, type_of_service, serial_number, invoice_id)
	VALUES (_service_id, _service_date, _type_of_service, _serial_number, _invoice_id);
END;
$MAIN$
LANGUAGE plpgsql;

-- Call the function
SELECT add_service_history(1, NOW()::timestamp, 'Oil change', 'A300B300', 1);
SELECT add_service_history(2, NOW()::timestamp, 'Tire rotation', 'A300B300', 1);
SELECT add_service_history(3, NOW()::timestamp, 'Fix engine', 'A200B200', 2);

-- Delete the stored function
DROP FUNCTION add_service_history;

-- Insert mechanic log 1
INSERT INTO mechanic_log (
    log_id,
    service_id,
    mechanic_id
) VALUES (
    1,
    1,
    1
);

-- Insert mechanic log 2
INSERT INTO mechanic_log (
    log_id,
    service_id,
    mechanic_id
) VALUES (
    2,
    2,
    1
);

-- Insert mechanic log 3
INSERT INTO mechanic_log (
    log_id,
    service_id,
    mechanic_id
) VALUES (
    3,
    2,
    2
);

-- Insert mechanic log 4
INSERT INTO mechanic_log (
    log_id,
    service_id,
    mechanic_id
) VALUES (
    4,
    3,
    3
);

-- Insert parts log 1
INSERT INTO parts_log (
    part_id,
    quantity,
    part_name,
    service_id
) VALUES (
    1,
    1,
    'Synthetic engine oil',
    1
);

-- Insert parts log 2
INSERT INTO parts_log (
    part_id,
    quantity,
    part_name,
    service_id
) VALUES (
    2,
    2,
    'Tires',
    2
);

-- Insert parts log 3
INSERT INTO parts_log (
    part_id,
    quantity,
    part_name,
    service_id
) VALUES (
    3,
    1,
    'Brake pads',
    2
);

-- Insert car invoice 1
INSERT INTO car_invoice (
    invoice_id,
    total_cost,
    customer_id,
    car_id,
    staff_id
) VALUES (
    1,
    27248.91,
    2,
    2,
    2
);

-- Insert car invoice 2
INSERT INTO car_invoice (
    invoice_id,
    total_cost,
    customer_id,
    car_id,
    staff_id
) VALUES (
    2,
    28883.91,
    1,
    3,
    3
);