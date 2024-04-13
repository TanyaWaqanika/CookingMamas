delimiter $$

create procedure insert_allergy_v1(
					IN allergytype varchar(50)
                    )
                    
BEGIN
	DECLARE recipeID INT;
    DECLARE allergyID INT;
    -- Looks for the allergyID based on the type passed in
    SELECT a.allergyID INTO allergyID from allergy a
    where a.allergyType = allergytype
    LIMIT 1;
    
	/*Selects the maximum recipeID (ie the one we've just added to recipe) and stores it in variable @recipeID*/
    SELECT MAX(r.recipeID) INTO recipeID FROM recipe r; 
    
	INSERT INTO recipeallergy (recipeID, allergyID)
	VALUES (recipeID, allergyID);
           
END$$
DELIMITER :					
            