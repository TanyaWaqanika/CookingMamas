delimiter $$

create procedure insert_image_v1()
                    
BEGIN
	DECLARE recipeID INT;
        
	/*Selects the maximum recipeID (ie the one we've just added to recipe) and stores it in variable @recipeID*/
    SELECT MAX(r.recipeID) INTO recipeID FROM recipe r; 
    
	INSERT INTO image(recipeID, imageSource)
	VALUES (recipeID, "images/plate.jpg");
           
END$$
DELIMITER :	