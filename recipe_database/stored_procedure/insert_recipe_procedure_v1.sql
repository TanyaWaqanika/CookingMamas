use recipedb;
delimiter $$

create procedure insert_recipe_v1(
					IN recipename varchar(50),
                    IN recipedescription text, 
					IN cuisinetype varchar(100) , 
					IN preptime time,
					IN cooktime time,
                    IN servingsize int
                    )
BEGIN
	DECLARE cuisineID INT;
    DECLARE durationID INT;
    DECLARE recipeID INT;
     -- Looks for the cuisineID based on the type we pass in   
	SELECT c.cuisineID INTO cuisineID from cuisine c
    where c.cuisine_type = cuisinetype
    LIMIT 1;
   -- Looks for the durationID based on the prep time and cook time passed in  
    select d.durationID INTO durationID from duration d
    where d.prepTime = preptime
    and d.cookTime = cooktime
    LIMIT 1;
    
    INSERT INTO recipe (recipeName, recipeDescription, cuisineID, durationID, servingSize)
    VALUES (recipename, recipedescription, cuisineID, durationID, servingsize);

   
END$$
DELIMITER :