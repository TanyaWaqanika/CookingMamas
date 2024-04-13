delimiter $$

create procedure insert_dietary_v1(
					IN dietarytype varchar(50)
                    )
                    
BEGIN
	DECLARE recipeID INT;
    DECLARE dietaryID INT;
    -- Looks for the dietaryID based on the type passed in 
    select d.dietaryID INTO dietaryID from dietaryrequirement d
    where d.dietaryType = dietarytype
    LIMIT 1;
    
	/*Selects the maximum recipeID (ie the one we've just added to recipe) and stores it in variable @recipeID*/
    SELECT MAX(r.recipeID) INTO recipeID FROM recipe r; 
    
	INSERT INTO recipedietaryrequirement (recipeID, dietaryID)
	VALUES (recipeID, dietaryID);
           
END$$
DELIMITER :	