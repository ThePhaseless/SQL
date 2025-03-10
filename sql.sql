#1
SELECT * FROM "Orders", "Order Details"

#2
SELECT * FROM "Products"
JOIN "Suppliers" ON "Products"."SupplierID" = "Suppliers"."SupplierID";

#3
SELECT * FROM "Customers"
JOIN "Orders" ON "Customers"."CustomerID" = "Orders"."CustomerID"
WHERE "Orders"."ShippedDate" > '1998-03-02'

#5
SELECT c."CustomerID", c."CompanyName", o."OrderDate"
FROM "Customers" AS c
LEFT JOIN "Orders" AS o ON c."CustomerID" = o."CustomerID";

#6
SELECT c."CustomerID", c."CompanyName", o."OrderDate"
FROM "Customers" AS c
LEFT JOIN "Orders" AS o ON c."CustomerID" = o."CustomerID"
WHERE o."OrderID" IS NULL;

#8/9
SELECT p."ProductName", o."OrderDate"
FROM "Orders" AS o
INNER JOIN "Order Details" AS od ON o."OrderID" = od."OrderID"
INNER JOIN "Products" AS p ON od."ProductID" = p."ProductID";

#10
SELECT p."ProductName", o."OrderDate"
FROM "Orders" AS o
INNER JOIN "Order Details" AS od ON o."OrderID" = od."OrderID"
INNER JOIN "Products" AS p ON od."ProductID" = p."ProductID"
WHERE o."OrderDate" = '1996-07-08';

#13
SELECT e."City", e."Country" FROM "Employees" as e
UNION
SELECT c."City", c."Country" FROM "Customers" as c;

#15
SELECT p."ProductName", o."Freight"
FROM "Products" as p
INNER JOIN "Order Details" as od ON p."ProductID" = od."ProductID"
INNER JOIN "Orders" as o ON od."OrderID" = o."OrderID"
INNER JOIN "Categories" as c ON p."CategoryID" = c."CategoryID"
WHERE o."Freight" BETWEEN 20 and 30
AND c."CategoryName" = 'Meat/Poultry';

#16
SELECT p."ProductName", o."Freight", s."CompanyName", o."OrderDate"
FROM "Products" as p
INNER JOIN "Order Details" as od ON p."ProductID" = od."ProductID"
INNER JOIN "Orders" as o ON od."OrderID" = o."OrderID"
INNER JOIN "Categories" as c ON p."CategoryID" = c."CategoryID"
INNER JOIN "Shippers" as s ON o."ShipVia" = s."ShipperID"
WHERE c."CategoryName" = 'Confections'
AND s."CompanyName" = 'United Package'
AND o."OrderDate" BETWEEN '1997-01-01' AND '1997-12-31';

#17
# Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii Confections
SELECT DISTINCT c."CompanyName", c."Phone"
FROM "Customers" as c
INNER JOIN "Orders" as o ON c."CustomerID" = o."CustomerID"
INNER JOIN "Order Details" as od ON o."OrderID" = od."OrderID"
INNER JOIN "Products" as p ON od."ProductID" = p."ProductID"
INNER JOIN "Categories" as cat ON p."CategoryID" = cat."CategoryID"
WHERE cat."CategoryName" = 'Confections';