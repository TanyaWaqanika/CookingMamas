use recipedb;
delimiter $$

create procedure insert_ingredients_v1(
					IN ingredientName varchar(50), 
					IN quantity decimal (10,2), 
					IN unitName varchar(50)
                    )
                    
BEGIN
    DECLARE ingredientID INT;
    DECLARE unitID INT;
    DECLARE recipeID INT;
	-- Looks for the ingredientID based on the name passed in 
	SELECT i.ingredientID INTO ingredientID from ingredient i
    where i.ingredientName = ingredientName
    LIMIT 1;
    -- Looks for the unit based on the name passed in - can pass in null when no unit is needed 
    SELECT u.unitID INTO unitID from unit u
    where u.unitName = unitName
    LIMIT 1;
    
	/*Selects the maximum recipeID (ie the one we've just added to recipe) and stores it in variable @recipeID*/
    SELECT MAX(r.recipeID) INTO recipeID FROM recipe r;
    
    INSERT INTO recipeingredientamount (recipeID, ingredientID, quantity, unitID)
    VALUES (recipeID, ingredientID, quantity, unitID);
    
       
END$$
DELIMITER :