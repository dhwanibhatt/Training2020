-- Date - 08/02/2022
-- Topic - SET operators (UNION and UNION ALL)

-- Display list of contacts from Employee and Contacts
    SELECT
        first_name,
        last_name,
        email,
        'contact'
    FROM
        contacts
    UNION SELECT
        first_name,
        last_name,
        email,
        'employee'
    FROM
        employees;

-- OR
    SELECT
        first_name || ' ' || last_name name,
        email,
        'contact'
    FROM
        contacts
    UNION SELECT
        first_name || ' ' || last_name name,
        email,
        'employee'
    FROM
        employees
    ORDER BY
        name DESC;

-- ==================================
-- Display unique last name of employees and contacts
    SELECT
        last_name
    FROM
        employees
    UNION SELECT
        last_name
    FROM
        contacts
    ORDER BY
        last_name;

-- With UNION ALL

    SELECT
        last_name
    FROM
        employees
    UNION ALL SELECT
        last_name
    FROM
        contacts
    ORDER BY
        last_name;

-- #INTERSECT
-- get the last names used by 
-- people in both contacts and employees tables

    SELECT
        last_name
    FROM
        contacts
    INTERSECT 
    SELECT
        last_name
    FROM
        employees
    ORDER BY
        last_name;

-- #MINUS
-- Returns distinct last names from the the left 
-- table which are not found in right table
    SELECT
        last_name
    FROM
        contacts
    MINUS
    SELECT
        last_name
    FROM
        employees
    ORDER BY
        last_name;

-- List of product id from the product table
-- but doesnt exist in inventories table
    SELECT
        product_id
    FROM
        products
    WHERE
        product_id NOT IN
        (SELECT
            product_id
        FROM
            inventory);

    OR

    SELECT
        product_id
    FROM
        products
    MINUS
    SELECT
        product_id
    FROM
        inventories;