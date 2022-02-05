  ================================================
    1. DQL
    2. SELECT
    3. WHERE
    4. ORDER BY
    5. >,<,>=,<=,IN,NOT IN, BETWEEN, NOT BETWEEN,
    6. LIKE, NOT LIKE
    7. IS NULL, IS NOT NULL
    8. OR
    9. AND
    10. AGGREGATE FUNCTIONS 
        MIN,MAX,SUM,AVERAGE,COUNT
    11. GROUP BY Clause with Aggregate functions
    12. nvl()
    13. case when * more exaples
    ==============================================
    Assignment:
    Oracle Query
        Oracle Queries
        Oracle Select
        Oracle Insert
        Oracle Insert All
        Oracle Update
        Oracle Delete
        Truncate Table
    Oracle Clauses
        Oracle DISTINCT
        Oracle FROM
        Oracle ORDER BY
        Oracle GROUP BY
        Oracle HAVING
    Oracle Misc
    
    ==============================
    
--A) query data from  column
            -- To get the customer fnames,lname from the customers table
                SELECT 
                        fname ,lname
                FROM 
                        cust; 
            
    --B) Querying data from all columns of a table
            -- To get the customer cust_id ,lname ,fname ,area ,phone_no  from the customers table
                SELECT 
                        cust_id ,lname ,fname ,area ,phone_no 
                FROM 
                        cust;  
            -- USING * 
                SELECT 
                        *
                FROM 
                       cust;

--  Oracle Update
        -- A) update one column of a single row
                --  Changes the dis of the part with  star name 'tom cruise' :
                        UPDATE
                            movie
                        SET
                            dis=NULL
                        WHERE
                            star LIKE ('tom cruise');
                        
                        SELECT 
                                *
                        FROM  
                                movie;

        -- B) UPDATE data in specific Position in column base on some condition
    
                UPDATE
                    movie
                SET
                    dis = 
                         CASE 
                            WHEN price BETWEEN 130 AND 150 THEN round(price*.64) 
                            WHEN price BETWEEN 150 AND 200 THEN round(price*.20)
                         END 
                
                SELECT 
                        *
                FROM  
                        movie;


-- Create Copy of Custmore table
    CREATE TABLE cust_copy
    AS
        SELECT
          *
        FROM
          cust; 
    
     SELECT *
     FROM 
            cust_copy;
            
-- Truncate Table
    TRUNCATE TABLE cust_copy;
    
-- Drop cust_copy table
    DROP TABLE cust_copy;


-- Oracle to_char 
    SELECT 
            to_char(issue_date,'YY-MM-DD')
    from 
            invoice;

-- GROUP BY CLAUSE
        --selecting number of movies group by type action and arange them into asecending order
                SELECT 
                    type,COUNT( TITLE) AS T_count
                FROM 
                    movie 
                GROUP BY 
                    type
                Order By
                    T_count;
        --Get the Average Price of each movie type 
                SELECT 
                    type,ROUND(AVG( price),2)
                FROM 
                    movie 
                GROUP BY 
                    type
                Order By
                    avg(price);
                     
        select * from cust; 
        select * from movie;
-- HAVING BY CLAUSE

-- LIke and concat
        --Find the full name and phones  of contacts whose first  names end with 'a'
                SELECT 
                        fname ||' '|| lname as full_name,phone_no
                FROM 
                        cust
                WHERE
                      fname LIKE '%a';
-- BETWEEN or Range queries
        -- list the movies title come between price of 100 to 170 
                SELECT 
                        title
                FROM 
                        movie
                WHERE
                        price BETWEEN 100 AND 170;


