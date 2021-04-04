--SQL SERVER
CREATE DATABASE seminariodos201504468;
USE seminariodos201504468;

DROP TABLE temp_purchase;
DROP TABLE temp_sale;

CREATE TABLE temp_purchase(
    purchase_date varchar(255),
    supplier_code varchar(255),
    supplier_name varchar(255),
    supplier_address varchar(255),
    supplier_number varchar(255),
    supplier_web varchar(255),
    product_code varchar(255),
    product_name varchar(255),
    product_brand varchar(255),
    product_category varchar(255),
    branch_office_code varchar(255),
    branch_office_name varchar(255),
    branch_office_address varchar(255),
    region varchar(255),
    department varchar(255),
    purchase_units varchar(255),
    purchase_cost varchar(255)
);

CREATE TABLE temp_sale(
    sale_date varchar(255),
    client_code varchar(255),
    client_name varchar(255),
    client_type varchar(255),
    client_address varchar(255),
    client_number varchar(255),
    seller_code varchar(255),
    seller_name varchar(255),
    seller_vacationer varchar(255),
    product_code varchar(255),
    product_name varchar(255),
    product_brand varchar(255),
    product_category varchar(255),
    branch_office_code varchar(255),
    branch_office_name varchar(255),
    branch_office_address varchar(255),
    region varchar(255),
    department varchar(255),
    sale_units varchar(255),
    sale_price varchar(255)
);
