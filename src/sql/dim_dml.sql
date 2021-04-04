SELECT * FROM temp_purchase;
SELECT * FROM temp_sale;

SET DATEFORMAT dmy;
SELECT CAST(A.final_date AS Date) AS final_date
FROM (SELECT LTRIM(purchase_date) AS final_date
FROM temp_purchase
UNION
SELECT LTRIM(sale_date) AS final_date
FROM temp_sale) AS A
ORDER BY final_date;
SELECT * FROM dim_time;

SELECT LTRIM(supplier_code) AS supplier_code, LTRIM(supplier_name) AS supplier_name, 
LTRIM(supplier_address) AS supplier_address, LTRIM(supplier_number) AS supplier_number, LTRIM(supplier_web) AS supplier_web
FROM temp_purchase
GROUP BY supplier_code, supplier_name, supplier_address, supplier_number, supplier_web;
SELECT * FROM dim_supplier;

SELECT LTRIM(product_code) AS product_code, LTRIM(product_name) AS product_name, 
LTRIM(product_brand) AS product_brand, LTRIM(product_category) AS product_category
FROM temp_purchase
UNION
SELECT LTRIM(product_code) AS product_code, LTRIM(product_name) AS product_name, 
LTRIM(product_brand) AS product_brand, LTRIM(product_category) AS product_category
FROM temp_sale;
SELECT * FROM dim_product;

SELECT LTRIM(branch_office_code) AS branch_office_code, LTRIM(branch_office_name) AS branch_office_name, 
LTRIM(branch_office_address) AS branch_office_address
FROM temp_purchase
UNION
SELECT LTRIM(branch_office_code) AS branch_office_code, LTRIM(branch_office_name) AS branch_office_name, 
LTRIM(branch_office_address) AS branch_office_address
FROM temp_sale;
SELECT * FROM dim_branch_office;

SELECT LTRIM(region) AS region, LTRIM(department) AS department
FROM temp_purchase
UNION
SELECT LTRIM(region) AS region, LTRIM(department) AS department
FROM temp_sale;
SELECT * FROM dim_location;

SELECT LTRIM(client_code) AS client_code, LTRIM(client_name) AS client_name, 
LTRIM(client_type) AS client_type, LTRIM(client_address) AS client_address, LTRIM(client_number) AS client_number 
FROM temp_sale
GROUP BY client_code, client_name, client_type, client_address, client_number;
SELECT * FROM dim_client;

SELECT LTRIM(seller_code) AS seller_code, LTRIM(seller_name) AS seller_name, LTRIM(seller_vacationer) AS seller_vacationer
FROM temp_sale
GROUP BY seller_code, seller_name, seller_vacationer;
SELECT * FROM dim_seller;

SET DATEFORMAT dmy;
SELECT DAY(CAST(temp_purchase.purchase_date AS Date)) AS day,
MONTH(CAST(temp_purchase.purchase_date AS Date)) AS month,
YEAR(CAST(temp_purchase.purchase_date AS Date)) AS year,
LTRIM(supplier_code) AS supplier_code, LTRIM(product_code) AS product_code, LTRIM(branch_office_code) AS branch_office_code, 
LTRIM(region) AS region, LTRIM(department) AS department, purchase_units AS units, purchase_cost AS cost
FROM temp_purchase;

SET DATEFORMAT dmy;
SELECT DAY(CAST(temp_sale.sale_date AS Date)) AS day,
MONTH(CAST(temp_sale.sale_date AS Date)) AS month,
YEAR(CAST(temp_sale.sale_date AS Date)) AS year,
LTRIM(client_code) AS client_code, LTRIM(seller_code) AS seller_code, LTRIM(product_code) AS product_code, 
LTRIM(branch_office_code) AS branch_office_code, LTRIM(region) AS region, LTRIM(department) AS department, 
sale_units AS units, sale_price AS price
FROM temp_sale;

SELECT EXTRACT(day FROM TO_DATE(temp_purchase.purchase_date, 'DD-MM-YYYY')) AS day,
EXTRACT(month FROM TO_DATE(temp_purchase.purchase_date, 'DD-MM-YYYY')) AS month,
EXTRACT(year FROM TO_DATE(temp_purchase.purchase_date, 'DD-MM-YYYY')) AS year,
LTRIM(supplier_code) AS supplier_code, LTRIM(product_code) AS product_code, LTRIM(branch_office_code) AS branch_office_code, 
LTRIM(region) AS region, LTRIM(department) AS department, purchase_units AS units, purchase_cost AS cost
FROM temp_purchase;

SELECT EXTRACT(day FROM TO_DATE(temp_sale.sale_date, 'DD-MM-YYYY')) AS day,
EXTRACT(month FROM TO_DATE(temp_sale.sale_date, 'DD-MM-YYYY')) AS month,
EXTRACT(year FROM TO_DATE(temp_sale.sale_date, 'DD-MM-YYYY')) AS year,
LTRIM(client_code) AS client_code, LTRIM(seller_code) AS seller_code, LTRIM(product_code) AS product_code, 
LTRIM(branch_office_code) AS branch_office_code, LTRIM(region) AS region, LTRIM(department) AS department, 
sale_units AS units, sale_price AS price
FROM temp_sale;

SET DATEFORMAT dmy;
INSERT INTO dim_time(time, year, month, month_name, semester, day)
SELECT DISTINCT 
tmp.date, YEAR(tmp.date), MONTH(tmp.date),
CASE
    WHEN MONTH(tmp.date)='1' then 'Enero'
    WHEN MONTH(tmp.date)='2' then 'Febrero'
    WHEN MONTH(tmp.date)='3' then 'Marzo'
    WHEN MONTH(tmp.date)='4' then 'Abril'
    WHEN MONTH(tmp.date)='5' then 'Mayo'
    WHEN MONTH(tmp.date)='6' then 'Junio'
    WHEN MONTH(tmp.date)='7' then 'Julio'
    WHEN MONTH(tmp.date)='8' then 'Agosto'
    WHEN MONTH(tmp.date)='9' then 'Septiembre'
    WHEN MONTH(tmp.date)='10' then 'Octubre'
    WHEN MONTH(tmp.date)='11' then 'Noviembre'
    WHEN MONTH(tmp.date)='12' then 'Diciembre'
END,
CASE
    WHEN MONTH(tmp.date) < 7 then '1'
    ELSE '2'
END,
DAY(tmp.date)
FROM (
    SELECT CAST(purchase_date as Date) as date FROM temp_purchase UNION
    SELECT CAST(sale_date as Date) as date FROM temp_sale 
) as tmp;
