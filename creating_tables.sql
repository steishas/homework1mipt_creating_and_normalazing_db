-- Создаем таблицы --

CREATE TABLE IF NOT EXISTS jobs (
    job_id integer PRIMARY KEY,
    job_title text,
    job_industry_category text
);

CREATE TABLE IF NOT EXISTS property (
    property_id integer PRIMARY KEY,
    address text,
    postcode varchar,
    state text,
    country text,
    property_valuation integer
);

CREATE TABLE IF NOT EXISTS product (
    product_sk integer PRIMARY KEY,
    product_id integer,
    brand text,
    product_line text,
    product_class text,
    product_size text,
    list_price numeric(10,2),
    standard_cost numeric(10,2)
);

CREATE TABLE IF NOT EXISTS customer (
    customer_id integer PRIMARY KEY,
    first_name text,
    last_name text,
    gender text,
    DOB date,
    job_id integer,
    wealth_segment text,
    deceased_indicator text,
    owns_car text,
    property_id integer,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

CREATE TABLE IF NOT EXISTS transactions (
    transaction_id integer PRIMARY KEY,
    transaction_date timestamp,
    online_order boolean,
    order_status text,
    customer_id integer,
    product_sk integer,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_sk) REFERENCES product(product_sk)
);
