CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(100),
  address VARCHAR(150),
  pay_info VARCHAR(150)
);

CREATE TABLE movie (
  movie_id SERIAL PRIMARY KEY,
  movie_name VARCHAR(100),
  tickets_available INTEGER,
  movie_price NUMERIC(5,2)
);

CREATE TABLE concession (
  item_id SERIAL PRIMARY KEY,
  quantity_available INTEGER,
  item_name VARCHAR(100),
  item_price NUMERIC(5,2)
);

CREATE TABLE concession_session (
  c_session_id SERIAL PRIMARY KEY,
  session_date DATE DEFAULT CURRENT_DATE,
  total_cost NUMERIC(6,2),
  customer_id INTEGER NOT NULL,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE ticket_session (
  t_session_id SERIAL PRIMARY KEY,
  session_date DATE DEFAULT CURRENT_DATE,
  total_cost NUMERIC(6,2),
  customer_id INTEGER NOT NULL,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE concession_order (
  c_order_id SERIAL PRIMARY KEY,
  quantity INTEGER,
  item_id INTEGER NOT NULL,
  c_session_id INTEGER NOT NULL,
  FOREIGN KEY(item_id) REFERENCES concession(item_id),
  FOREIGN KEY(c_session_id) REFERENCES concession_session(c_session_id)
);

CREATE TABLE ticket_order (
  t_order_id SERIAL PRIMARY KEY,
  quantity INTEGER,
  t_session_id INTEGER NOT NULL,
  movie_id INTEGER NOT NULL,
  FOREIGN KEY(t_session_id) REFERENCES ticket_session(t_session_id),
  FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);