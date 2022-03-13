-- Q1  Get a list of latest order IDs for all customers 
--by using the max function on Order_ID column.

    SELECT 
        companyname,orderdate
    FROM 
        orders O
    JOIN customers C
    ON
        C.customerID = O.customerID
    WHERE  O.orderid IN (SELECT 
                MAX(orderid)
            FROM 
                orders O
            JOIN customers C
            ON
                C.customerID = O.customerID
            GROUP BY 
                companyname)
    ORDER BY
        companyname;

--Q2 Find suppliers who sell more than one product 
-- to Northwind Trader.

    SELECT 
        s.supplierid,s.companyname
    FROM 
        suppliers s
    INNER JOIN 
        products p
    ON 
        s.supplierid=p.supplierid
    WHERE 
        p.supplierid > (SELECT count(productid) 
                        FROM products 
                        GROUP BY supplierid 
                        HAVING count(productid)>1 
                        ORDER BY count(productid));


-- Q3 Create a function to get latest order date for entered customer_id
    --Function Declaration
    CREATE OR REPLACE FUNCTION getLatestOrderDate(
        v_customerid customers.customerid%TYPE
    ) 
    RETURN orders.orderdate%TYPE
    IS
        v_orderdate orders.orderdate%TYPE;  
    BEGIN
        --v_customerid := '&v_customerid';
        -- get order date
        SELECT 
            max(orderdate) into v_orderdate
        FROM 
            orders O
        JOIN customers C
        ON
            C.customerID = O.customerID
        WHERE
            C.customerID = v_customerid;
        -- return the order date
        RETURN v_orderdate;
    END;

    -- Calling a Function
    DECLARE
        i_customerid customers.customerid%TYPE;
        i_orderdate orders.orderdate%TYPE;  
    BEGIN
        i_customerid := '&i_customerid';
        i_orderdate := getLatestOrderDate(i_customerid);
        DBMS_OUTPUT.PUT_LINE(i_orderdate);    
    END;
    /

-- Q4 Get the top 10 most expensive products.
    SELECT * FROM
    (
        SELECT DISTINCT ProductName AS EXPENSIVE_PRODUCTS, 
            UnitPrice
        FROM Products
        ORDER BY UnitPrice desc
    )
    FETCH NEXT 10 ROWS ONLY;

-- Q5 Rank products by the number of units in stock in each product category

    SELECT DENSE_RANK() 
    OVER(PARTITION BY categoryid 
        ORDER BY unitsinstock) 
        productrank,productid,productname,categoryid,unitsinstock 
    FROM products;

-- Q6 Rank customers by the total sales amount within each order date

    SELECT DENSE_RANK() OVER(PARTITION BY o.orderdate 
                            ORDER BY (ord.unitprice*ord.quantity) DESC),
    o.orderdate FROM customers c INNER JOIN orders o
    USING (customerid) INNER JOIN orderdetails ord USING (orderid) ;

-- Q7 For each order, calculate a subtotal for each Order (identified by OrderID)
    SELECT OrderID, 
        to_char(sum(UnitPrice * Quantity * (1 - Discount)), '$99,999.99') AS Subtotal
    FROM OrderDetails
    GROUP BY OrderID
    ORDER BY OrderID;

-- Q8 Sales by Year for each order.
    SELECT DISTINCT a.ShippedDate, 
        a.OrderID, 
        b.Subtotal, 
        to_char(a.ShippedDate,'YYYY') AS "Year"
    FROM Orders a 
    INNER JOIN
    (
        -- Get subtotal for each order
        SELECT DISTINCT OrderID, 
            to_char(sum(UnitPrice * Quantity * (1 - Discount)), '$99,999.99') AS Subtotal
        FROM OrderDetails
        GROUP BY OrderID ) 
        b ON a.OrderID = b.OrderID
        WHERE a.ShippedDate IS NOT NULL
        AND a.ShippedDate BETWEEN to_date('24/12/1996', 'DD/MM/YYYY') 
                                AND to_date('30/09/1997', 'DD/MM/YYYY')
        ORDER BY a.ShippedDate;

-- Q9 Get Employee sales by country names
    SELECT DISTINCT a.Country, 
        a.lastName, 
        a.FirstName, 
        b.ShippedDate, 
        b.OrderID, 
        c.Subtotal AS Sale_Amount
    FROM Employees a
    INNER JOIN Orders b ON b.EmployeeID = a.EmployeeID
    INNER JOIN
    (
        -- Get subtotal for each order
        SELECT Discount OrderID, 
            to_char(sum(UnitPrice * Quantity * (1 - Discount)), '$99,999.99') AS Subtotal
        FROM OrderDetails
        GROUP BY OrderID    
    ) C ON b.OrderID = c.OrderID
    WHERE b.ShippedDate BETWEEN to_date('24/12/1996', 'DD/MM/YYYY') 
                                AND to_date('30/09/1997', 'DD/MM/YYYY')
    ORDER BY a.lastName, a.FirstName, a.Country, b.ShippedDate;

-- Q10 Alphabetical list of products
    SELECT DISTINCT b.*, a.CategoryName
    FROM Categories a 
    INNER JOIN Products b ON a.CategoryID = b.CategoryID
    WHERE b.Discontinued = 0
    ORDER BY b.ProductName;

-- Q11 Display the current Productlist 
    SEELCT ProductID, ProductName
    FROM Products
    WHERE Discontinued = 0
    ORDER BY ProductName;

-- Q12 Calculate sales price for each order after discount is applied.
    SELECT DISTINCT y.OrderID, 
        y.ProductID, 
        x.ProductName, 
        y.UnitPrice, 
        y.Quantity, 
        y.Discount, 
        y.UnitPrice * y.Quantity * (1 - y.Discount) AS Extendedprice
    FROM Products x
    INNER JOIN OrderDetails y ON x.ProductID = y.ProductID
    ORDER BY y.OrderID;

-- Q13 Sales by Category: For each category, we get the list of products sold and the total sales amount.
    SELECT DISTINCT a.CategoryID, 
        a.CategoryName, 
        b.ProductName, 
        sum(c.ExtendedPrice) AS ProductSales
    FROM Categories a 
    INNER JOIN Products b ON a.CategoryID = b.CategoryID
    INNER JOIN 
    (
        SELECT DISTINCT y.OrderID, 
            y.ProductID, 
            x.ProductName, 
            y.UnitPrice, 
            y.Quantity, 
            y.Discount, 
            y.UnitPrice * y.Quantity * (1 - y.Discount) AS ExtendedPrice
        FROM Products x
        INNER JOIN OrderDetails y ON x.ProductID = y.ProductID
        ORDER BY y.OrderID
    ) c ON c.ProductID = b.ProductID
    INNER JOIN Orders d ON d.OrderID = c.OrderID
    where d.OrderDate between to_date('1/1/1997', 'DD/MM/YYYY') 
                            and to_date('31/12/1997', 'DD/MM/YYYY')
    GROUP BY a.CategoryID, a.CategoryName, b.ProductName
    ORDER BY a.CategoryName, b.ProductName, ProductSales;

-- Q14 Sales by Category: For each category, we get the list of products sold and the total sales amount.
    SELECT c.categoryid,c.categoryname,p.productname
    FROM categories c
    INNER JOIN products p
    ON c.categoryid=p.categoryid;

-- Q15 Displays products(productname,unitprice) whos price is greater than avg(price)

    CREATE OR REPLACE VIEW vwproducts_above_averageprice
    AS
    SELECT productname,unitprice
    FROM products
    WHERE unitprice >(
    SELECT AVG(unitprice)
    FROM products)
    ORDER BY unitprice;

-- Q16 Display product(productname), customers(companyname), orders(orderyear)

    CREATE OR REPLACE VIEW vwquarterly_ordersby_product
    AS
    SELECT p.productname,c.companyname,EXTRACT(YEAR FROM o.orderdate) orderyear
    FROM customers c
    INNER JOIN orders o
    ON c.customerid=o.customerid
    INNER JOIN orderdetails ord
    ON o.orderid=ord.orderid
    INNER JOIN products p
    ON ord.productid=p.productid;

-- Q17 Display Supplier Continent wise sum of unitinstock.

    CREATE OR REPLACE VIEW vwunitsinstock
    AS
    SELECT SUM(p.unitprice) AS totalprice,'UK' AS continent 
    FROM suppliers s
    INNER JOIN products p
    USING (supplierid)
    WHERE s.country IN ('UK','Spain','Sweden','Germany','Norway','Denmark','Netherlands','Finland','Italy','France') 
    UNION
    SELECT SUM(p.unitprice) AS totalprice,'America' AS continent 
    FROM suppliers s
    INNER JOIN products p
    USING (supplierid)
    WHERE s.country IN ('USA','Canada','Brazil','ASia-Pacific');

--Q18 Display top 10 expensive products

    CREATE OR REPLACE VIEW vw10most_expensive_products
    AS
    SELECT productid,productname,unitprice 
    FROM products 
    ORDER BY unitprice DESC 
    FETCH FIRST 10 ROWS;

--Q19 Display customer supplier by city

    CREATE OR REPLACE VIEW vwcustomer_supplier_bycity
    AS
    SELECT city,companyname,contactname,'suppliers' AS relationship
    FROM suppliers
    UNION
    SELECT city,companyname,contactname,'customers' AS relationship
    FROM customers;
