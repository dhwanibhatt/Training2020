create user c##dhwani identified by root;


CREATE TABLE cust
(
    Cust_id varchar(3) primary key,
    lname varchar(15),
    fname varchar(15),
    area varchar(2),
    phone_no number(8)
);

CREATE TABLE movie
(
    mv_no varchar(2) primary key,
    title varchar(25),
    type varchar(10),
    star varchar(25)
);

CREATE TABLE invoice
(
    Inv_no varchar(3) primary key,
    Mv_no varchar(2),
    Cust_id varchar(3),
    Issue_date date,
    Return_date date
);

ALTER TABLE invoice
add constraint c1
foreign key(cust_id)
references cust(cust_id);

ALTER TABLE invoice
add constraint c2
foreign key(mv_no)
references movie(mv_no);

ALTER TABLE cust
MODIFY (lname NOT NULLl, fname NOT NULLl);

ALTER TABLE movie
MODIFY (title NOT NULLl, type NOT NULLl);

ALTER TABLE movie
add price number(8,2);
INSERT INTO cust VALUES ('a01','Bayross','Ivan','sa',6125467);
INSERT INTO cust VALUES ('a02','Saitwal','Vandana','mu',5560379);
INSERT INTO cust VALUES ('a03','Jaguste','Pramada','da',4563891);
INSERT INTO cust VALUES ('a04','Navindgi','Basu','ba',6125401);
INSERT INTO cust (cust_id,lname,fname,area) VALUES ('a05','Sreedharan','Ravi','va');
INSERT INTO cust VALUES ('a06',' ','Rukmini','gh',5125274);

INSERT INTO movie VALUES ('1','bloody vengeance','action','jackie chan',180.95);
INSERT INTO movie VALUES ('2','the firm','thriller','tom cruise',200.00);
INSERT INTO movie VALUES ('3','pretty woman','romance','richard gere',200.00);
INSERT INTO movie VALUES ('4','home alone','comedy','macaulay culkin',150);
INSERT INTO movie VALUES ('5','the fugitive','thriller','harisson ford',200.00);
INSERT INTO movie VALUES ('6','coma','suspense','michael douglas',100.00);
INSERT INTO movie VALUES ('7','dracula','horror','gary oldman',150.25);
INSERT INTO movie VALUES ('8','quick change','comedy','bill muray',100.00);
INSERT INTO movie VALUES ('9','gone with the wind','drama','clarke gable',200.00);
INSERT INTO movie VALUES ('10','carry on doctor','comedy','leslie phillips',100.00);

INSERT INTO invoice VALUES ('i01','4','a01','23-jul-93','25-jul-93');
INSERT INTO invoice VALUES ('i02','3','a02','12-aug-93','15-aug-93');
INSERT INTO invoice VALUES ('i03','1','a02','15-aug-93','18-aug-93');
INSERT INTO invoice VALUES ('i04','6','a03','10-sep-93','12-sep-93');
INSERT INTO invoice VALUES ('i05','7','a04','05-aug-93','08-aug-93');
INSERT INTO invoice VALUES ('i06','2','a06','18-sep-93','21-sep-93');
INSERT INTO invoice VALUES ('i07','9','a05','07-jul-93','10-jul-93');
INSERT INTO invoice VALUES ('i08','9','a01','11-aug-93','14-aug-93');
INSERT INTO invoice VALUES ('i09','5','a03','06-jul-93','07-jul-93');
INSERT INTO invoice VALUES ('i10','8','a06','03-sep-93','06-sep-93');

-- ADD a column in table
    ALTER TABLE movie 
    ADD Dis number(4,2);

-- UPDATE data in specific Position in column base on some condition

    UPDATE
        movie
    SET
        dis = 
             CASE 
                WHEN price BETWEEN 130 AND 150 THEN round(price*.10) 
                WHEN price BETWEEN 150 AND 200 THEN round(price*.20)
             END 
 
 
--  Retrieve all data from tables Custmor

    SELECT 
            cust_id ,lname ,fname ,area ,phone_no 
    FROM 
            cust;
            
            
--Sorting rows by a column example
            --  To sort the customer data by fnames alphabetically in ascending order
                SELECT 
                        cust_id ,lname ,fname ,area ,phone_no 
                FROM 
                        cust
                ORDER BY
                        fname;
                        
            --  To sort customer by fname alphabetically in descending order,
                SELECT 
                        cust_id ,lname ,fname ,area ,phone_no 
                FROM 
                        cust
                ORDER BY
                        fname DESC;
                        
            
--  Sorting rows by multiple columns example

            -- To sort Custmor by their first names in ascending order and their last names in descending order
                SELECT 
                        cust_id ,lname ,fname ,area ,phone_no 
                FROM 
                        cust
                ORDER BY
                        fname,lname DESC;

            --  Sort rows by column?s positions example
                SELECT 
                        cust_id ,lname ,fname ,area ,phone_no 
                FROM 
                        cust
                ORDER BY
                        3,2 DESC;
                        
--  Sorting rows with NULL VALUES examples

            --  Retrieves Type of Movie and Title and sorts them by price and discount.
                SELECT 
                        type , title, price , dis
                FROM 
                        movie
                ORDER BY
                        price , dis;
                        
            --  sorts the Price and Discount in descending order and Discount NULL VALUES First.
                SELECT 
                        type , title, price , dis
                FROM 
                        movie
                ORDER BY
                        dis DESC NULLS FIRST;
             
             --  sorts the Price and Discount in ascending order and Discount NULL VALUES LAST.
                SELECT 
                        type , title, price , dis
                FROM 
                        movie
                ORDER BY
                        dis DESC NULLS LAST;

-- Sorting rows by the result of a function or expression
            --  sort the customer lnames
                SELECT 
                        cust_id ,lname ,fname ,area ,phone_no 
                FROM 
                        cust
                ORDER BY
                        UPPER(lname) NULLS LAST;
    
-- Retrieve all the data from Custmor Where phone no is null AND first name start with v or last name altest 8 word 
    SELECT 
            cust_id ,lname ,fname ,area ,phone_no 
    FROM 
            cust
    WHERE
            phone_no IS NOT NULL AND (lower(fname) LIKE 'v%' OR lower(lname) LIKE '________%');
            
    
    


