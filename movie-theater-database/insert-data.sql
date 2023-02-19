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
    'john@example.com',
    '123 West St., Nowhere, NY 10001',
    '123-456-789-000'
);

INSERT INTO movie (
    movie_id,
    movie_name,
    tickets_available,
    movie_price
) VALUES (
    1,
    'The Lord of the Rings: The Fellowship of the Rings',
    75,
    12.99
);

INSERT INTO concession (
    item_id,
    quantity_available,
    item_name,
    item_price
) VALUES (
    1,
    50,
    'Chocolate',
    4.99
);

INSERT INTO concession (
    item_id,
    quantity_available,
    item_name,
    item_price
) VALUES (
    2,
    50,
    'Large popcorn',
    9.99
);

INSERT INTO concession_session (
    c_session_id,
    total_cost,
    customer_id
) VALUES (
    1,
    14.98,
    1
);

INSERT INTO ticket_session (
    t_session_id,
    total_cost,
    customer_id
) VALUES (
    1,
    12.99,
    1
);

INSERT INTO concession_order (
    c_order_id,
    quantity,
    item_id,
    c_session_id
) VALUES (
    1,
    1,
    1,
    1
);

INSERT INTO concession_order (
    c_order_id,
    quantity,
    item_id,
    c_session_id
) VALUES (
    2,
    1,
    2,
    1
);

INSERT INTO ticket_order (
  t_order_id,
  quantity,
  t_session_id,
  movie_id
) VALUES (
    1,
    1,
    1,
    1
);