   USE BabyName; --Switch to the BabyName database




   SHOW TABLES; --Shows all tables in BabyName database




   DESCRIBE BabyName; --Shows BabyName table and columns




   SELECT DISTINCT name           --Show names that that won't be duplicated
              FROM BabyName       --From table BabyName
	     WHERE year = '1997'  --Where the year is equal to 1997
	     LIMIT 50;	          --Limited to 50 names




   SELECT DISTINCT year             --Show years that won't be duplicated
	      FROM BabyName         --From table BabyName
	     WHERE name = 'Darrius' --Where name "Darrius" appears
	     LIMIT 50;              --Limited to 50 years






   SELECT DISTINCT name, gender, count             --Show name and gender without duplicate
	      FROM BabyName                       --From table BabyName
	     WHERE count = (SELECT MAX(count)     --Of the most popular name
		 	      FROM BabyName       
		 	     WHERE year = '1984'  --In 1984
                 	       AND gender = 'M')  --That is Male
	     UNION                                --Combined with
   SELECT DISTINCT name, gender, count    
	      FROM BabyName
	     WHERE count = (SELECT MAX(count)
		 	      FROM BabyName
		 	     WHERE year = '1984'
                 	       AND gender = 'F'); --Most popular Female name



   SELECT DISTINCT place, count(name)  --Show amount of distinct name at a place
   FROM BabyName		       --From table BabyName
   GROUP BY place                      
   LIMIT 50;



   SELECT *                     --Show all information
   FROM BabyName                --From table BabyName
   WHERE name LIKE '%Darrius%'  --Where name is spelled like "Darrius"
   ORDER BY name, count, year   --Ordered by name, count, and year
   LIMIT 50;



   SELECT year, count(name)   --Show how many names
   FROM BabyName              --From table BabyName
   WHERE year = '1974';       --In the year 1974



    SELECT count(*)  --Show how many rows
    FROM BabyName;   --In table BabyName



    SELECT year, gender, count(name)  --Show how many names
    FROM BabyName               --From table BabyName
    WHERE year = '1962'         --In the year 1962
    GROUP BY gender;            --In each sex