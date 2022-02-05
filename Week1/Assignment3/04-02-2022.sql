
JOINING TEMPLATE
--select DISTINCT(cust.cust_id),
--cust.fname,
--
--invoice.issue_date,
--invoice.return_date
--
--From cust
--INNER JOIN invoice ON
--cust.cust_id=invoice.cust_id;
--------------------------------------------------------------------------------

Finding the difference of first and last visit of a customer(in days)
------------------------------------------------------------------------------
select DISTINCT(cust.cust_id),
cust.fname,

invoice.issue_date,
invoice.return_date,
(invoice.return_date-invoice.issue_date) AS DAYS

From cust
INNER JOIN invoice ON
cust.cust_id=invoice.cust_id
order by cust.cust_id,invoice.issue_date,invoice.return_date;