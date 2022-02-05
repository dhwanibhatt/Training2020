SELECT * from movie;
SELECT * from cust;
select * from invoice;


---------------------------------------------------------------------------
movie type wise ranking
----------------------------------------------------------------------------
SELECT 
	type,
	RANK() OVER (ORDER BY type) Ranking
FROM 
	movie;
    
-------------------------------------------------------------------------
Ranking based on movie price in descending order    
------------------------------------------------------------------------    
SELECT  
		title,type,price,
		RANK() OVER( PARTITION BY type ORDER BY price DESC) price_rank
FROM 
		movie
------------------------------------------------------------------------
movie type wise dense ranking
-------------------------------------------------------------------------
select type,
DENSE_RANK() OVER ( ORDER BY type) Ranking
from 
   movie; 
---------------------------------------------------------------------
Partition by type with Dense rank
-----------------------------------------------------------------------
select type,
DENSE_RANK() OVER (PARTITION BY type ORDER BY star)
from 
   movie;
   
---------------------------------------------------------------------------
Display the most expensive movie from each category:
--------------------------------------------------------------------------
WITH Dhwani AS (
	SELECT 
		Title, 
		type,
        star,
        price,
		RANK() OVER(PARTITION BY type ORDER BY star DESC) price_rank
	FROM 
		movie
)
SELECT 
	title,type,price_rank
FROM 
	Dhwani
WHERE
	price_rank <= 1;
 





   

   
   





    


  