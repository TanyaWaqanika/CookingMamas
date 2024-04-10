create database repdb;

use repdb;

-- fks for duration table aren't working, can use ALTER TABLE to add them later
create table recipe (
recipeID int auto_increment primary key,
recipeName varchar (250) not null,
recipeDescription text,
cuisineID int not null,
durationID int not null,
-- decided on using one duration id that represents combo of prep, cook and overall time
-- prepTime time not null,
-- cookTime time,
servingSize int not null,
foreign key (cuisineID) references cuisine (cuisineID),
foreign key (durationID) references duration(durationID)
-- foreign key (durationID) references duration (durationID),
-- foreign key (prepTime) references duration (prepTime),
-- foreign key (cookTime) references duration (cookTime)
); 

create table ingredient (
ingredientID int auto_increment primary key,
ingredientName varchar(50) not null
);

create table unit (
unitID int auto_increment primary key,
unitName varchar(50) not null
);

-- quantity table removed -- 
-- create table quantity (
-- quantityID int auto_increment primary key,
-- quantityAmount float not null
-- );

create table cuisine (
cuisineID int auto_increment primary key,
cuisine_type varchar(100) not null
);

-- cookTime doesn't have [not null] in case some recipes don't require cooking
-- need to double check if time or varchar data type would be more suitable for this table
create table duration (
durationID int auto_increment primary key,
overallDuration time not null,
prepTime time not null,
cookTime time
);

create table recipeStep (
stepID int auto_increment primary key,
recipeID int not null,
stepNumber int not null,
stepDescription text not null,
foreign key (recipeID) references recipe (recipeID)
);

create table dietaryRequirement (
dietaryID int auto_increment primary key,
dietaryType varchar(50) not null
);

create table allergy (
allergyID int auto_increment primary key,
allergyType varchar(50) not null
);

create table tool (
toolID int auto_increment primary key,
toolName varchar(50) not null
);

create table recipeImage (
imageID int auto_increment primary key,
recipeID int not null,
imageSource varchar(100) not null,
foreign key (recipeID) references recipe (recipeID)
);

-- user info table -- 
create table userInfo (
userID int auto_increment primary key,
firstname varchar(50) not null,
lastname varchar(50) not null,
email varchar(100) not null,
username varchar(50) not null,
userPassword varchar(50) not null
);

-- bridge tables -- 
create table userFavourite (
userID int not null,
foreign key (userID) references userInfo(userID),
recipeID int not null,
foreign key (recipeID) references recipe(recipeID)
);

create table userAllergy (
userID int not null,
foreign key (userID) references userInfo(userID),
allergyID int not null,
foreign key (allergyID) references allergy(allergyID)
);

create table userDietaryRequirement (
userID int not null,
foreign key (userID) references userInfo(userID),
dietaryID int not null,
foreign key (dietaryID) references dietaryRequirement(dietaryID)
);


create table recipeAllergy (
recipeID int not null,
foreign key (recipeID) references recipe(recipeID),
allergyID int not null,
foreign key (allergyID) references allergy(allergyID)
);

create table recipeDietaryRequirement (
recipeID int not null,
foreign key (recipeID) references recipe(recipeID),
dietaryID int not null,
foreign key (dietaryID) references dietaryRequirement(dietaryID)
);

create table recipeToolRequirement (
recipeID int not null,
foreign key (recipeID) references recipe(recipeID),
toolID int not null,
foreign key (toolID) references tool(toolID)
);

create table recipeIngredientAmount (
recipeID int not null,
foreign key (recipeID) references recipe(recipeID),
ingredientID int not null,
foreign key (ingredientID) references ingredient(ingredientID),
quantityID decimal not null,
unitID int not null,
foreign key (unitID ) references unit(unitID)
);

