CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(100),
  address VARCHAR(150),
  pay_info VARCHAR(150)
);

CREATE TABLE customer_car (
  serial_number VARCHAR(100) PRIMARY KEY,
  make VARCHAR(100),
  model VARCHAR(100),
  year INTEGER,
  color VARCHAR(100),
  customer_id INTEGER,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE sales_staff (
  staff_id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE car_for_sale (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(100),
  model VARCHAR(100),
  year INTEGER,
  color VARCHAR(100),
  is_new BOOLEAN,
  price NUMERIC(7,2)
);

CREATE TABLE service_invoice (
  invoice_id SERIAL PRIMARY KEY,
  invoice_date DATE DEFAULT CURRENT_DATE,
  total_cost NUMERIC(7,2),
  serial_number VARCHAR(100),
  FOREIGN KEY(serial_number) REFERENCES customer_car(serial_number)
);

CREATE TABLE service_history (
  service_id SERIAL PRIMARY KEY,
  service_date DATE DEFAULT CURRENT_DATE,
  type_of_service VARCHAR(100),
  serial_number VARCHAR(100),
  invoice_id INTEGER,
  FOREIGN KEY(serial_number) REFERENCES customer_car(serial_number),
  FOREIGN KEY(invoice_id) REFERENCES service_invoice(invoice_id)
);

CREATE TABLE mechanic_log (
  log_id SERIAL PRIMARY KEY,
  log_date DATE DEFAULT CURRENT_DATE,
  service_id INTEGER,
  mechanic_id INTEGER,
  FOREIGN KEY(service_id) REFERENCES service_history(service_id),
  FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE parts_log (
  part_id SERIAL PRIMARY KEY,
  quantity INTEGER,
  part_name VARCHAR(100),
  service_id INTEGER,
  FOREIGN KEY(service_id) REFERENCES service_history(service_id)
);

CREATE TABLE car_invoice (
  invoice_id SERIAL PRIMARY KEY,
  invoice_date DATE DEFAULT CURRENT_DATE,
  total_cost NUMERIC(7,2),
  customer_id INTEGER,
  car_id INTEGER,
  staff_id INTEGER,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY(car_id) REFERENCES car_for_sale(car_id),
  FOREIGN KEY(staff_id) REFERENCES sales_staff(staff_id)
);