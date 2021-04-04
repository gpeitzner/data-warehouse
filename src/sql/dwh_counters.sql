SELECT COUNT(*) AS FECHAS FROM dim_time;
SELECT COUNT(*) AS PROVEEDORES FROM dim_supplier;
SELECT COUNT(*) AS CLIENTES FROM dim_client;
SELECT COUNT(*) AS VENDEDORES FROM dim_seller;
SELECT COUNT(*) AS PRODUCTOS FROM dim_product;
SELECT COUNT(*) AS SUCURSALES FROM dim_branch_office;
SELECT COUNT(*) AS UBICACIONES FROM dim_location;
SELECT COUNT(*) AS COMPRAS from fact_purchase;
SELECT COUNT(*) AS VENTAS from fact_sale;

SELECT * FROM dim_time;
SELECT * FROM dim_supplier;
SELECT * FROM dim_client;
SELECT * FROM dim_seller;
SELECT * FROM dim_product;
SELECT * FROM dim_branch_office;
SELECT * FROM dim_location;
SELECT * FROM fact_purchase;
SELECT * FROM fact_sale;
