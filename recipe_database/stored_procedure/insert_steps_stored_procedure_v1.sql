use recipedb;
delimiter $$

create procedure insert_steps_v1(
					IN stepNumber int,
                    IN stepDescription text
                    )
                    
BEGIN
	DECLARE recipeID INT;
    
	/*Selects the maximum recipeID (ie the one we've just added to recipe) and stores it in variable @recipeID*/
    SELECT MAX(r.recipeID) INTO recipeID FROM recipe r; 
    
	INSERT INTO recipestep (recipeID, stepNumber, stepDescription)
    VALUES(recipeID, stepNumber, stepDescription);
           
END$$
DELIMITER :					
                    
                    
                    
                   