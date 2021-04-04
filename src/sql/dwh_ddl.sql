--CLEANING
DROP TABLE fact_sale;
DROP TABLE fact_purchase;
DROP TABLE dim_time;
DROP TABLE dim_supplier;
DROP TABLE dim_client;
DROP TABLE dim_seller;
DROP TABLE dim_product;
DROP TABLE dim_branch_office;
DROP TABLE dim_location;

--DIMENSIONS
CREATE TABLE dim_time(
    time DATE NOT NULL,
    year INT NOT NULL,
    month INT NOT NULL,
    month_name varchar(255),
    semester INT NOT NULL,
    day INT NOT NULL,
);

CREATE TABLE dim_supplier(
    dim_supplier_id INT IDENTITY(1,1) PRIMARY KEY,
    code varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    number INT NOT NULL,
    web varchar(255) NOT NULL
);

CREATE TABLE dim_client(
    dim_client_id INT IDENTITY(1,1) PRIMARY KEY,
    code varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    type varchar(255) NOT NULL,
    address varchar(255) NOT NUll,
    number INT NOT NULL
);

CREATE TABLE dim_seller(
    dim_seller_id INT IDENTITY(1,1) PRIMARY KEY,
    code varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    vacationer bit NOT NULL
);

CREATE TABLE dim_product(
    dim_product_id INT IDENTITY(1,1) PRIMARY KEY,
    code varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    brand varchar(255) NOT NULL,
    category varchar(255) NOT NULL
);

CREATE TABLE dim_branch_office(
    dim_branch_office_id INT IDENTITY(1,1) PRIMARY KEY,
    code varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    address varchar(255) NOT NULL
);

CREATE TABLE dim_location(
    dim_location_id INT IDENTITY(1,1) PRIMARY KEY,
    region varchar(255) NOT NULL,
    department varchar(255) NOT NULL
);

--FACT TABLES
CREATE TABLE fact_purchase(
    time DATE NOT NULL,
    sk_supplier INT NOT NULL FOREIGN KEY REFERENCES dim_supplier(dim_supplier_id),
    sk_product INT NOT NULL FOREIGN KEY REFERENCES dim_product(dim_product_id),
    sk_branch_office INT NOT NULL FOREIGN KEY REFERENCES dim_branch_office(dim_branch_office_id),
    sk_location INT NOT NULL FOREIGN KEY REFERENCES dim_location(dim_location_id),
    units INT NOT NULL,
    cost DECIMAL(12, 2) NOT NULL,
    total DECIMAL(12, 2) NOT NULL
);

CREATE TABLE fact_sale(
    time DATE NOT NULL,
    sk_client INT NOT NULL FOREIGN KEY REFERENCES dim_client(dim_client_id),
    sk_seller INT NOT NULL FOREIGN KEY REFERENCES dim_seller(dim_seller_id),
    sk_product INT NOT NULL FOREIGN KEY REFERENCES dim_product(dim_product_id),
    sk_branch_office INT NOT NULL FOREIGN KEY REFERENCES dim_branch_office(dim_branch_office_id),
    sk_location INT NOT NULL FOREIGN KEY REFERENCES dim_location(dim_location_id),
    units INT NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    total DECIMAL(12, 2) NOT NULL
);
