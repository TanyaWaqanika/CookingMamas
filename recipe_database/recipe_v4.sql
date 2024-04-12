create database recipedb;

use recipedb;

create table cuisine (
cuisineID int auto_increment primary key,
cuisine_type varchar(100) not null
);

INSERT INTO cuisine (cuisine_type)
VALUES 
('Italian'),
('Middle-Eastern'),
('Chinese'),
('Indian'),
('Mexican'),
('American')
;

create table allergy (
allergyID int auto_increment primary key,
allergyType varchar(50) not null
);

INSERT INTO allergy (allergyType)
VALUES 
('Nuts'),
('Shellfish'),
('Dairy'),
('Eggs'),
('Wheat');

create table duration (
durationID int auto_increment primary key,
overallDuration time not null,
prepTime time not null,
cookTime time
);

INSERT INTO duration (overallDuration, prepTime, cookTime)
VALUES 
('0:10:00', '0:10:00', null),
('0:15:00', '0:15:00', null),
('0:10:00', '0:05:00', '0:05:00'),
('0:15:00', '0:05:00', '0:10:00'),
('0:20:00', '0:05:00', '0:15:00'),
('0:40:00', '0:10:00', '0:30:00'),
('0:55:00', '0:10:00', '0:45:00'),
('0:45:00', '0:15:00', '0:30:00'),
('1:00:00', '0:15:00', '0:45:00'),
('0:50:00', '0:20:00', '0:30:00'),
('1:05:00', '0:20:00', '0:45:00'),
('1:20:00', '0:20:00', '1:00:00'),
('0:20:00', '0:20:00', null),
('0:45:00', '0:30:00', '0:15:00');

create table ingredient (
ingredientID int auto_increment primary key,
ingredientName varchar(50) not null
);

INSERT INTO ingredient (ingredientName) VALUES
('Spaghetti'),
('Butter'),
('Black pepper'),
('Parmesan'),
('Tinned Chopped Tomatoes'),
('Eggs'),
('Cloves of Garlic'),
('Onion'),
('Soy Sauce'),
('Honey'),
('Chinese 5-Spice'),
('Rice'),
('Chicken'),
('Shrimp'),
('Cooking Oil'),
('Salt'),
('Green Onions'),
('Salmon'),
('Olive Oil'),
('Lentils'),
('Vegetable Broth'),
('Carrot'),
('Cumin'),
('Paprika'),
('Chickpeas'),
('Coconut Milk'),
('Mixed Spice'),
('Basil'),
('Balsamic Glaze'),
('Mozarella'),
('Tomato'),
('Chopped Dates'),
('Milk'),
('Banana'),
('Vanilla extract'),
('Chopped romain lettuce'),
('Cucumber'),
('Cherry Tomato'),
('Red onion'),
('Chopped parsley'),
('Chopped mint'),
('Sumac'),
('Lemon juice'),
('Pitta bread'),
('Aubergine'),
('Tahini'),
('Garlic powder'),
('Tumeric'),
('Flat bread'),
('Baking soda'),
('Flour'),
('Watermelon'),
('Cantaloupe'),
('Honeydew melon'),
('Grapes'),
('Lime juice'),
('Sugar'),
('Water'),
('Minced beef'),
('Chilli powder'),
('Coffee'),
('Ladyfingers'),
('Powdered cocoa'),
('Mascarpone cheese'),
('Breadcrumbs');

create table unit (
unitID int auto_increment primary key,
unitName varchar(50) not null
);

INSERT INTO unit (unitName) VALUES
('g'),
('ml'),
('l'),
('tbsp'),
('tsp'),
('bunch'),
('cm'),
('in'),
('oz'),
('fl oz');

create table tool (
toolID int auto_increment primary key,
toolName varchar(50) not null
);

INSERT INTO tool (toolName) VALUES
('Air fryer'),
('Deep fat fryer'),
('Slow cooker'),
('Blender'),
('Hand blender'),
('Hand mixer'),
('Pressure cooker'),
('Food processor');

create table recipe (
recipeID int auto_increment primary key,
recipeName varchar (250) not null,
recipeDescription text,
cuisineID int not null,
foreign key (cuisineID) references cuisine (cuisineID),
durationID int not null,
foreign key (durationID) references duration(durationID),
servingSize int not null
); 

INSERT INTO recipe (recipeName, recipeDescription, cuisineID, durationID, servingSize) VALUES
('Cacio e pepe', 'Whip up a simple cacio e pepe for a speedy lunch. With four simple ingredients – spaghetti, pepper, parmesan and butter – this is a storecupboard favourite', 1, 4, 2),
('Shakshuka', 'A North African dish, said to have originated in Tunisia, shakshuka, ponounced Shak-SHOO-kah. Fun fact, the origins of the word shakshuka comes from the Arabic for "all mixed up" or "shaken."', 2, 4, 2),
('Sticky Chinese 5-Spice Chicken', 'Flavoured with honey, soy sauce and Chinese 5-spice herbs, this one-pan chicken dish makes a cheap and easy midweek meal.', 3, 6, 4),
('Stir-Fried Garlic Shrimp', 'Succulent shrimp stir-fried with aromatic garlic and savory sauces, creating a quick and flavorful dish perfect for pairing with steamed rice.', 3, 4, 2),
('Soy Sauce Glazed Salmon', 'This recipe features tender salmon fillets baked to perfection and glazed with a harmonious blend of soy sauce and honey, creating a delectable dish that''s both easy to prepare and bursting with flavor.', 3, 4, 2),
('Balsamic Bruschetta', 'Bruschetta is a classic Italian appetizer that is easy to make at home. Toasted bread is topped with tomatoes, Parmesan cheese, garlic, and fresh basil. Use a high-quality balsamic vinegar for best results', 1, 13, 8),
('Roti', 'Roti or Chapati is everyday Indian flatbread which is made with only 2 ingredients- whole wheat flour (atta) and water. Learn all the tips to make soft roti at home!', 4, 14, 12),
('Lentil Soup', 'A hearty and nutritious soup made with tender lentils, aromatic vegetables, and savory spices, perfect for a comforting and satisfying meal.', 2, 6, 2),
('Coconut Curry Chickpeas', 'A flavorful and creamy curry dish featuring tender chickpeas simmered in coconut milk with fragrant spices, offering a delightful blend of sweetness and heat.', 2, 5, 2),
('Caprese Salad', 'This classic Italian salad features alternating slices of ripe tomatoes and fresh mozzarella, adorned with fragrant basil leaves and drizzled with balsamic glaze and olive oil, offering a simple yet elegant dish bursting with fresh Mediterranean flavors.', 1, 1, 2),
('Dates milkshake', 'This date shake is naturally sweet, filling, and a delightful way to start your day or enjoy as a snack or dessert. Cheers to wholesome indulgence!', 2, 3, 1),
('Fattoush salad', 'Fattoush is a refreshing Lebanese salad made with fresh vegetables, herbs, and toasted or fried Arabic bread. It typically includes ingredients like lettuce, tomatoes, cucumbers, radishes, green peppers, and parsley, all tossed in a zesty sumac Mediterranean dressing. The iconic feature of fattoush is the crispy fried pita bread, adding a delightful crunch to this vibrant salad', 2, 4, 2),
('Baba ganoush', 'A delectable Middle Eastern dish that is widely enjoyed for its rich and smoky flavors. It’s the perfect companion to pita bread or fresh vegetables, and its smoky undertones make it truly irresistible!', 2, 6, 4),
('Chicken Shawarma', 'Chicken Shawarma is a delectable Middle Eastern dish that tantalizes the senses with its aromatic spices and succulent flavors.', 2, 12, 4),
('Falafel', 'These crispy-on-the-outside, tender-on-the-inside morsels have a rich history and are beloved worldwide. You can enjoy them in wraps, sandwiches, or as a delightful appetizer with tahini sauce.', 2, 5, 2),
('Fruit salad', 'A delightful medley of various fresh fruits, combining vibrant colors, flavors, and textures. Imagine juicy strawberries, fragrant oranges, and crisp pineapple all mingling together in a refreshing and luscious ensemble', 2, 1, 1);


INSERT INTO recipe (recipeName, recipeDescription, cuisineID, durationID, servingSize) VALUES
('Cucumber lemonade', 'Cucumber lemonade is a refreshing beverage made by blending fresh cucumber juice with zesty lemon juice, creating a delightful balance of coolness and tanginess. It’s perfect for hot summer days!', 2, 1, 1),
('Dum Qeema AKA Mince', 'Dum ka Keema, also known as Spicy Smoked Ground Beef, is a flavorful Pakistani dish punctuated with the brightness of mint and the boldness of ginger, making it absolutely delicious when paired with parathas', 2, 4, 2),
('Tiramisu', 'It’s a delightful Italian dessert that combines the richness of mascarpone with the boldness of coffee and cocoa. Buon appetito!', 1, 13, 4),
('Chicken nuggets', 'Here’s a simple chicken nuggets recipe that you can whip up in no time. These crispy nuggets are perfect for a quick and delicious meal.', 6, 5, 2);

create table dietaryRequirement (
dietaryID int auto_increment primary key,
dietaryType varchar(50) not null
);

INSERT INTO dietaryRequirement (dietaryType) VALUES
('Gluten free'),
('Halal'),
('Vegetarian'),
('Vegan'),
('Pescatarian');

create table recipeIngredientAmount (
recipeID int not null,
foreign key (recipeID) references recipe(recipeID),
ingredientID int not null,
foreign key (ingredientID) references ingredient(ingredientID),
quantity decimal (10,2) not null,
unitID int,
foreign key (unitID ) references unit(unitID)
);


INSERT INTO recipeIngredientAmount (recipeID, ingredientID, unitID, quantity) VALUES
(1, 1, 1, 200),
(1, 2, 1, 25),
(1, 3, 5, 2),
(1, 4, 1, 50),
(2, 5, null, 1),
(2, 6, null, 2),
(2, 7, null, 3),
(2, 8, 1, 100),
(3, 7, null, 6),
(3, 8, 1, 100),
(3, 9, 2, 200),
(3, 10, 5, 4),
(3, 11, 4, 1),
(3, 12, 1, 200),
(3, 13, 1, 500),
(4, 14, 1, 500),
(4, 7, null, 4),
(4, 9, 4, 2),
(4, 15, 4, 1),
(4, 3, 5, 2),
(4, 16, 5, 2),
(4, 17, 6, 1),
(5, 18, 1, 500),
(5, 19, 4, 3),
(5, 9, 4, 2),
(5, 10, 4, 1),
(8, 20, 1, 250),
(8, 21, 2, 500),
(8, 22, null, 2),
(8, 23, 5, 1),
(8, 24, 5, 1),
(8, 15, 4, 2),
(8, 8, null, 2),
(8, 7, null, 2),
(9, 25, 1, 500),
(9, 26, 2, 500),
(9, 27, 4, 1),
(9, 16, 5, 2),
(9, 8, null, 1),
(9, 7, null, 2),
(10, 31, null, 2),
(10, 30, 1, 50),
(10, 28, 6, 1),
(10, 29, 4, 2),
(10, 19, 4, 1),
(11, 32, 1, 94),
(11, 33, 2, 237),
(11, 34, null, 1),
(11, 35, 5, 1),
(12, 36, null, 1),
(12, 37, null, 1),
(12, 38, null, 1),
(12, 39, null, 0.5),
(12, 40, 1, 120),
(12, 41, 1, 60),
(12, 42, 4, 1),
(12, 43, null, 1),
(12, 19, 4, 3),
(12, 3, 1, 1),
(12, 16, 1, 1),
(12, 44, null, 2),
(13, 45, null, 1),
(13, 7, null, 1),
(13, 46, 1, 60),
(13, 43, 2, 60),
(13, 3, 1, 1),
(13, 16, 1, 1),
(13, 19, 4, 2),
(14, 13, 1, 455),
(14, 19, 2, 60),
(14, 43, null, 1),
(14, 24, 5, 2),
(14, 48, 5, 1),
(14, 47, 5, 1),
(14, 3, 1, 1),
(14, 16, 1, 1),
(14, 49, null, 4),
(14, 23, 4, 1),
(15, 25, null, 1),
(15, 8, null, 0.5),
(15, 40, 1, 60),
(15, 23, 5, 1),
(15, 16, 5, 1),
(15, 50, 5, 0.25),
(15, 51, 4, 1),
(15, 19, 2, 60),
(15, 7, null, 1),
(16, 52, 1, 85),
(16, 53, 1, 85),
(16, 54, 1, 85),
(16, 55, 1, 85),
(16, 56, 2, 60),
(17, 43, null, 1),
(17, 37, null, 1),
(17, 58, 2, 220),
(17, 57, 1, 100),
(18, 59, 1, 227),
(18, 60, 5, 0.5),
(18, 8, null, 1),
(18, 7, null, 1),
(18, 23, 5, 1),
(18, 3, 1, 1),
(18, 16, 1, 1),
(19, 6, null, 3),
(19, 64, 1, 500),
(19, 61, 2, 200),
(19, 62, null, 1),
(19, 63, 5, 1),
(19, 57, 1, 75),
(20, 13, 1, 400),
(20, 51, 4, 3),
(20, 6, null, 1),
(20, 65, 1, 80);

create table recipeStep (
stepID int auto_increment primary key,
recipeID int not null,
stepNumber int not null,
stepDescription text not null,
foreign key (recipeID) references recipe (recipeID)
);

INSERT INTO recipeStep (recipeID, stepNumber, stepDescription) VALUES
(1, 1, 'Cook pasta for 2 mins'),
(1, 2, 'Melt butter in a medium pan and add the ground black pepper'),
(1, 3, 'Drain pasta and keep a cup of the pasta water'),
(1, 4, 'Put pasta in the pan with the remaining pasta water'),
(1, 5, 'Stir in the parmesan'),
(2, 1, 'Fry the garlic and onion until brown'),
(2, 2, 'Combine the chopped tomatoes and cook until it''s bubbling'),
(2, 3, 'Make wells in the sauce and poach the eggs in the well'),
(3, 1, 'In a saucepan, cook your rice for 10 mins in low heat'),
(3, 2, 'In your baking tray, combine the remaining ingredients'),
(3, 3, 'Bake in the over for 25 mins, 200°C'),
(3, 4, 'Serve the chicken with rice, and drizzle the sauce from the tray'),
(4, 1, 'Heat the cooking oil in a wok or large skillet over medium-high heat'),
(4, 2, 'Add the minced garlic and stir-fry for about 30 seconds until fragrant'),
(4, 3, 'Add the shrimp to the wok and stir-fry for 2-3 minutes until they turn pink and opaque'),
(4, 4, 'Pour in the soy sauce, and season with salt and pepper. Stir well to coat the shrimp evenly with the sauce'),
(4, 5, 'Garnish with chopped green onions, serve hot with steamed rice'),
(5, 1, 'Preheat your oven to 400°F (200°C) and line a baking sheet with parchment paper'),
(5, 2, 'In a small bowl, mix together soy sauce and honey to create the glaze'),
(5, 3, 'Place the salmon fillets on the prepared baking sheet and brush them with olive oil'),
(5, 4, 'Pour the soy sauce-honey glaze evenly over the salmon and bake for 10-12 minutes'),
(5, 5, 'Serve hot with your favorite side dishes, such as steamed vegetables or rice'),
(8, 1, 'Sauté onion, carrots, celery, and garlic'),
(8, 2, 'Add lentils, broth, cumin, paprika, salt, and pepper to taste'),
(8, 3, 'Simmer 20-25 mins until lentils are tender'),
(8, 4, 'Serve hot, optionally garnished with coriander'),
(9, 1, 'Sauté onion and garlic'),
(9, 2, 'Add chickpeas, coconut milk, curry powder, turmeric, salt, and pepper to taste'),
(9, 3, 'Simmer for 10-15 mins'),
(9, 4, 'Serve hot with your favorite side dishes, such as steamed vegetables or rice, and garnish'),
(10, 1, 'Arrange tomato and mozzarella slices on a serving plate, alternating between them'),
(10, 2, 'Tuck fresh basil leaves between the tomato and mozzarella slices'),
(10, 3, 'Drizzle with balsamic glaze and olive oil, optionally season with salt and pepper to taste'),
(10, 4, 'Serve immediately as a refreshing appetizer or side dish'),
(11, 1, 'Combine all ingredients in a blender and blend until smooth'),
(11, 2, 'Serve immediately'),
(12, 1, 'Cut the pita into the desired shapes (triangles, squares or strips). Toss with olive oil, salt and pepper and fry on medium heat. Stir frequently until is golden brown.'),
(12, 2, 'In a large bowl, combine all ingredients and mix well'),
(12, 3, 'Season with salt and pepper to taste!'),
(13, 1, 'Pre heat oven to 200°C. Cut aubergine into large cubes, drizzle with olive oil and season with salt and pepper. Roast for 30 minutes turning the aubergine half way through.'),
(13, 2, 'In a food processor, combine all ingredients and blend until smooth.'),
(13, 3, 'Season with salt and pepper to taste and enjoy with pita bread or crackers!'),
(14, 1, 'In a large bowl, combine all ingredients and mix well.'),
(14, 2, 'Cover and refrigerate for at least 1 hour, up to 24 hours.'),
(14, 3, 'Preheat a grill or grill pan over medium-high heat.'),
(14, 4, 'Grill chicken for 5-7 minutes per side, or until cooked through.'),
(14, 5, 'Spread sauce, chicken, and onions on the Shawarma bread, roll into a wrap and enjoy!'),
(15, 1, 'Drain your tin of chickpeas and rinse them, dice your onion, mince your garlic'),
(15, 2, 'In a food processor, combine all ingredients and blend until smooth.'),
(15, 3, 'Shape mixture into small balls or patties.'),
(15, 4, 'In a large skillet, heat olive oil over medium-high heat.'),
(15, 5, 'Add falafel and cook for 3-5 minutes per side, or until golden brown.'),
(15, 6, 'Serve with salad, flatbread and sauces.'),
(16, 1, 'Dice the fruit'),
(16, 2, 'In a large bowl, combine all ingredients and mix well.'),
(16, 3, 'Serve immediately or refrigerate for later. Enjoy!'),
(17, 1, 'peel and dice your cucumber'),
(17, 2, 'In a blender combine all ingredients until smooth'),
(17, 3, 'Pour into glass and enjoy!'),
(18, 1, 'Dice onion, mince the garlic clove'),
(18, 2, 'In a large pan, cook beef over medium-high heat until browned.'),
(18, 3, 'Add onion, garlic, cumin, chilli powder, salt and pepper. Stir to combine.'),
(18, 4, 'Cook for 5 minutes, or until the beef is fully cooked.'),
(19, 1, 'Lightly oil an 8x8-inch baking dish'),
(19, 2, 'Set a large heatproof bowl over a pan of simmering water to create a double boiler. Whisk together the egg yolks and sugar in the bowl until pale and thickened. Remove from heat and let it cool.'),
(19, 3, 'Gradually fold in the mascarpone cheese into the egg yolk mixture until well combined.'),
(19, 4, 'Dip the boudoir biscuits (ladyfingers) into espresso or strong coffee. Arrange a layer of soaked biscuits in the prepared dish.'),
(19, 5, 'Spread a layer of the mascarpone mixture over the soaked biscuits. Repeat the layers until you’ve used up all the ingredients. Finish with a layer of mascarpone on top.'),
(19, 6, 'Cover the dish and refrigerate for several hours or overnight. Before serving, dust the top with powdered cocoa or instant chocolate drink mix.'),
(20, 1, 'Preheat the oven to 220°C/200°C Fan/Gas 7. Cut the chicken into strips.'),
(20, 2, 'Put the flour in a wide, shallow bowl. Season it with salt and pepper and stir.'),
(20, 3, 'Break the egg into a second shallow bowl and beat it with a fork until smooth and pale.'),
(20, 4, 'Tip half of the breadcrumbs into a third shallow bowl.'),
(20, 5, 'Coat each chicken strip first in flour, then egg, and finally breadcrumbs, pressing firmly and turning to coat on both sides. Set aside on baking paper.'),
(20, 6, 'Brush a baking tray with 1 tablespoon of oil. Place the chicken pieces on the tray and brush generously but lightly with 3 tablespoons more oil. Bake for 15 minutes, turning halfway through.');

create table recipeToolRequirement (
recipeID int not null,
foreign key (recipeID) references recipe(recipeID),
toolID int not null,
foreign key (toolID) references tool(toolID)
);

INSERT INTO recipeToolRequirement (recipeID, toolID) VALUES
(11,4),
(12,8),
(15,8);


create table recipeDietaryRequirement (
recipeID int not null,
foreign key (recipeID) references recipe(recipeID),
dietaryID int not null,
foreign key (dietaryID) references dietaryRequirement(dietaryID)
);


INSERT INTO recipeDietaryRequirement (recipeID, dietaryID) VALUES
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(3, 1),
(3, 2),
(4, 5),
(5, 5),
(8, 3),
(8, 4),
(9, 3),
(9, 4),
(10, 1),
(10, 3),
(11, 2),
(11, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(14, 2),
(15, 2),
(15, 3),
(15, 4),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(16, 5),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(18, 1),
(18, 2),
(18, 5),
(19, 2),
(19, 5),
(20, 2);

create table recipeAllergy (
recipeID int not null,
foreign key (recipeID) references recipe(recipeID),
allergyID int not null,
foreign key (allergyID) references allergy(allergyID)
);

INSERT INTO recipeAllergy (recipeID, allergyID) VALUES
(1, 3),
(2, 4),
(8, 3),
(9, 3),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2);

create table userInfo (
userID int auto_increment primary key,
firstname varchar(50) not null,
lastname varchar(50) not null,
email varchar(100) not null,
username varchar(50) not null,
userPassword varchar(50) not null
);


INSERT INTO userInfo (firstname, lastname, email, username, userPassword) VALUES
('John', 'Smith', 'john.smith@example.com', 'jsmith', 'p@ssw0rd'),
('Emily', 'Johnson', 'emily.johnson@example.com', 'ejohnson', 'secret123'),
('Michael', 'Williams', 'michael.williams@example.com', 'mwilliams', '12345678'),
('Sarah', 'Brown', 'sarah.brown@example.com', 'sbrown', 'qwerty'),
('David', 'Davis', 'david.davis@example.com', 'ddavis', 'abc123'),
('Jessica', 'Martinez', 'jessica.martinez@example.com', 'jmartinez', 'mypassword'),
('Matthew', 'Jones', 'matthew.jones@example.com', 'mjones', 'letmein'),
('Samantha', 'Anderson', 'samantha.anderson@example.com', 'sanderson', 'passw0rd'),
('Daniel', 'Taylor', 'daniel.taylor@example.com', 'dtaylor', 'ilovecats'),
('Olivia', 'Wilson', 'olivia.wilson@example.com', 'owilson', '98765432'),
('Ethan', 'Thomas', 'ethan.thomas@example.com', 'ethomas', 'mydog123'),
('Ava', 'Garcia', 'ava.garcia@example.com', 'agarcia', 'sunshine'),
('Logan', 'Miller', 'logan.miller@example.com', 'lmiller', 'football'),
('Mia', 'Jackson', 'mia.jackson@example.com', 'mjackson', '123abc'),
('Benjamin', 'Lee', 'benjamin.lee@example.com', 'blee', 'ilovecoding');


-- bridge tables -- 
create table userFavourite (
userID int not null,
recipeID int not null,
foreign key (userID) references userInfo(userID),
foreign key (recipeID) references recipe(recipeID)
);

INSERT INTO userFavourite (userID, recipeID) VALUES
(1, 3),
(2, 5),
(3, 6),
(3, 1),
(4, 6),
(5, 15),
(5, 2),
(5, 8),
(6, 17),
(6, 1),
(7, 19),
(8, 20),
(8, 12),
(9, 17),
(10, 7),
(11, 4),
(11, 9),
(12, 20),
(13, 20),
(14, 10),
(15, 10),
(15, 20);




create table userAllergy (
userID int not null,
allergyID int not null,
foreign key (allergyID) references allergy(allergyID),
foreign key (userID) references userInfo(userID)
);

INSERT INTO userAllergy (userID, allergyID) VALUES
(1, 1),
(1, 5),
(4, 2),
(4, 3),
(8, 4),
(3, 4),
(11, 2),
(11, 3),
(11, 5),
(14, 1),
(10, 1),
(3, 5),
(6, 2);


create table userDietaryRequirement (
userID int not null,
foreign key (userID) references userInfo(userID),
dietaryID int not null,
foreign key (dietaryID) references dietaryRequirement(dietaryID)
);

INSERT INTO userDietaryRequirement (userID, dietaryID) VALUES
(2, 1),
(2, 4),
(6, 4),
(8, 2),
(13, 4),
(14, 1),
(3, 2),
(8, 3),
(9, 3),
(9, 1),
(7, 5),
(12, 2),
(12, 5);

create table image (
imageID int auto_increment primary key,
recipeID int not null,
imageSource varchar(100) not null,
foreign key (recipeID) references recipe(recipeID)
);

INSERT INTO image (recipeID, imageSource) VALUES
(1,	'images/CacioePepe.png'),
(2,	'images/Shakshuka-Recipe-The-Mediterranean-Dish-100.jpg'),
(3,	'images/stickychicken.png'),
(11, 'images/datemilkshake.png'),
(12, 'images/fatoush.png'),
(13, 'images/babaganoush.png'),
(14, 'images/shawarma.png'),
(15,'images/falafel.png'),
(16,'images/fruitsalad.jpg'),
(17, 'images/cucumberlemonade.jpg'),
(18,'images/dumqeema.png'),
(19,'images/tiramisu.jpeg'),
(20, 'images/chickennuggets.jpeg');

