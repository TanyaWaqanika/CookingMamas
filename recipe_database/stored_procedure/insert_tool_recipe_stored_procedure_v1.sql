delimiter $$

create procedure insert_tool_v1(
					IN toolname varchar(50)
                    )
                    
BEGIN
	DECLARE recipeID INT;
    DECLARE toolID INT;
	-- Looks for the tool id based on the name passed in through the stored procedure
    select t.toolID INTO toolID from tool t
    where t.toolName = toolname
    LIMIT 1;
    
	/*Selects the maximum recipeID (ie the one we've just added to recipe) and stores it in variable @recipeID*/
    SELECT MAX(r.recipeID) INTO recipeID FROM recipe r; 
    
	INSERT INTO recipetoolrequirement (recipeID, toolID)
	VALUES (recipeID, toolID);
           
END$$
DELIMITER :	