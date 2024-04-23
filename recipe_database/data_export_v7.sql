CREATE DATABASE  IF NOT EXISTS `recipedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipedb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: recipedb
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `allergy`
--

DROP TABLE IF EXISTS `allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy` (
  `allergyID` int NOT NULL AUTO_INCREMENT,
  `allergyType` varchar(50) NOT NULL,
  PRIMARY KEY (`allergyID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy`
--

LOCK TABLES `allergy` WRITE;
/*!40000 ALTER TABLE `allergy` DISABLE KEYS */;
INSERT INTO `allergy` VALUES (1,'Nuts'),(2,'Shellfish'),(3,'Dairy'),(4,'Eggs'),(5,'Wheat');
/*!40000 ALTER TABLE `allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `cuisineID` int NOT NULL AUTO_INCREMENT,
  `cuisine_type` varchar(100) NOT NULL,
  PRIMARY KEY (`cuisineID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
INSERT INTO `cuisine` VALUES (1,'Italian'),(2,'Middle-Eastern'),(3,'Chinese'),(4,'Indian'),(5,'Mexican'),(6,'American');
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietaryrequirement`
--

DROP TABLE IF EXISTS `dietaryrequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietaryrequirement` (
  `dietaryID` int NOT NULL AUTO_INCREMENT,
  `dietaryType` varchar(50) NOT NULL,
  PRIMARY KEY (`dietaryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietaryrequirement`
--

LOCK TABLES `dietaryrequirement` WRITE;
/*!40000 ALTER TABLE `dietaryrequirement` DISABLE KEYS */;
INSERT INTO `dietaryrequirement` VALUES (1,'Gluten free'),(2,'Halal'),(3,'Vegetarian'),(4,'Vegan'),(5,'Pescatarian');
/*!40000 ALTER TABLE `dietaryrequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duration`
--

DROP TABLE IF EXISTS `duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duration` (
  `durationID` int NOT NULL AUTO_INCREMENT,
  `overallDuration` time NOT NULL,
  `prepTime` time NOT NULL,
  `cookTime` time DEFAULT NULL,
  PRIMARY KEY (`durationID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duration`
--

LOCK TABLES `duration` WRITE;
/*!40000 ALTER TABLE `duration` DISABLE KEYS */;
INSERT INTO `duration` VALUES (1,'00:10:00','00:10:00',NULL),(2,'00:15:00','00:15:00',NULL),(3,'00:10:00','00:05:00','00:05:00'),(4,'00:15:00','00:05:00','00:10:00'),(5,'00:20:00','00:05:00','00:15:00'),(6,'00:40:00','00:10:00','00:30:00'),(7,'00:55:00','00:10:00','00:45:00'),(8,'00:45:00','00:15:00','00:30:00'),(9,'01:00:00','00:15:00','00:45:00'),(10,'00:50:00','00:20:00','00:30:00'),(11,'01:05:00','00:20:00','00:45:00'),(12,'01:20:00','00:20:00','01:00:00'),(13,'00:20:00','00:20:00',NULL),(14,'00:45:00','00:30:00','00:15:00');
/*!40000 ALTER TABLE `duration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `imageID` int NOT NULL AUTO_INCREMENT,
  `recipeID` int NOT NULL,
  `imageSource` varchar(100) NOT NULL,
  PRIMARY KEY (`imageID`),
  KEY `recipeID` (`recipeID`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,1,'images/CacioePepe.png'),(2,2,'images/Shakshuka-Recipe-The-Mediterranean-Dish-100.jpg'),(3,3,'images/stickychicken.png'),(4,11,'images/datemilkshake.png'),(5,12,'images/fatoush.png'),(6,13,'images/babaganoush.png'),(7,14,'images/shawarma.png'),(8,15,'images/falafel.png'),(9,16,'images/fruitsalad.jpg'),(10,17,'images/cucumberlemonade.jpg'),(11,18,'images/dumqeema.png'),(12,19,'images/tiramisu.jpeg'),(13,20,'images/chickennuggets.jpeg'),(14,4,'images/stirfryshrimp.jpeg'),(15,5,'images/glazedsalmon.jpeg'),(16,6,'images/balsamicbruschetta.jpeg'),(17,7,'images/roti.jpeg'),(18,8,'images/lentilsoup.jpeg'),(19,9,'images/coconutchickpeacurry.jpeg'),(20,10,'images/capresesalad.jpeg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredientID` int NOT NULL AUTO_INCREMENT,
  `ingredientName` varchar(50) NOT NULL,
  PRIMARY KEY (`ingredientID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Spaghetti'),(2,'Butter'),(3,'Black pepper'),(4,'Parmesan'),(5,'Tinned Chopped Tomatoes'),(6,'Eggs'),(7,'Cloves of Garlic'),(8,'Onion'),(9,'Soy Sauce'),(10,'Honey'),(11,'Chinese 5-Spice'),(12,'Rice'),(13,'Chicken'),(14,'Shrimp'),(15,'Cooking Oil'),(16,'Salt'),(17,'Green Onions'),(18,'Salmon'),(19,'Olive Oil'),(20,'Lentils'),(21,'Vegetable Broth'),(22,'Carrot'),(23,'Cumin'),(24,'Paprika'),(25,'Chickpeas'),(26,'Coconut Milk'),(27,'Mixed Spice'),(28,'Basil'),(29,'Balsamic Glaze'),(30,'Mozarella'),(31,'Tomato'),(32,'Chopped Dates'),(33,'Milk'),(34,'Banana'),(35,'Vanilla extract'),(36,'Chopped romain lettuce'),(37,'Cucumber'),(38,'Cherry Tomato'),(39,'Red onion'),(40,'Chopped parsley'),(41,'Chopped mint'),(42,'Sumac'),(43,'Lemon juice'),(44,'Pitta bread'),(45,'Aubergine'),(46,'Tahini'),(47,'Garlic powder'),(48,'Tumeric'),(49,'Flat bread'),(50,'Baking soda'),(51,'Flour'),(52,'Watermelon'),(53,'Cantaloupe'),(54,'Honeydew melon'),(55,'Grapes'),(56,'Lime juice'),(57,'Sugar'),(58,'Water'),(59,'Minced beef'),(60,'Chilli powder'),(61,'Coffee'),(62,'Ladyfingers'),(63,'Powdered cocoa'),(64,'Mascarpone cheese'),(65,'Breadcrumbs');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipeID` int NOT NULL AUTO_INCREMENT,
  `recipeName` varchar(250) NOT NULL,
  `recipeDescription` text,
  `cuisineID` int NOT NULL,
  `durationID` int NOT NULL,
  `servingSize` int NOT NULL,
  PRIMARY KEY (`recipeID`),
  KEY `cuisineID` (`cuisineID`),
  KEY `durationID` (`durationID`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`cuisineID`) REFERENCES `cuisine` (`cuisineID`),
  CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`durationID`) REFERENCES `duration` (`durationID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Cacio e pepe','Whip up a simple cacio e pepe for a speedy lunch. With four simple ingredients – spaghetti, pepper, parmesan and butter – this is a storecupboard favourite',1,4,2),(2,'Shakshuka','A North African dish, said to have originated in Tunisia, shakshuka, ponounced Shak-SHOO-kah. Fun fact, the origins of the word shakshuka comes from the Arabic for \"all mixed up\" or \"shaken.\"',2,4,2),(3,'Sticky Chinese 5-Spice Chicken','Flavoured with honey, soy sauce and Chinese 5-spice herbs, this one-pan chicken dish makes a cheap and easy midweek meal.',3,6,4),(4,'Stir-Fried Garlic Shrimp','Succulent shrimp stir-fried with aromatic garlic and savory sauces, creating a quick and flavorful dish perfect for pairing with steamed rice.',3,4,2),(5,'Soy Sauce Glazed Salmon','This recipe features tender salmon fillets baked to perfection and glazed with a harmonious blend of soy sauce and honey, creating a delectable dish that\'s both easy to prepare and bursting with flavor.',3,4,2),(6,'Balsamic Bruschetta','Bruschetta is a classic Italian appetizer that is easy to make at home. Toasted bread is topped with tomatoes, Parmesan cheese, garlic, and fresh basil. Use a high-quality balsamic vinegar for best results',1,13,8),(7,'Roti','Roti or Chapati is everyday Indian flatbread which is made with only 2 ingredients- whole wheat flour (atta) and water. Learn all the tips to make soft roti at home!',4,14,12),(8,'Lentil Soup','A hearty and nutritious soup made with tender lentils, aromatic vegetables, and savory spices, perfect for a comforting and satisfying meal.',2,6,2),(9,'Coconut Curry Chickpeas','A flavorful and creamy curry dish featuring tender chickpeas simmered in coconut milk with fragrant spices, offering a delightful blend of sweetness and heat.',2,5,2),(10,'Caprese Salad','This classic Italian salad features alternating slices of ripe tomatoes and fresh mozzarella, adorned with fragrant basil leaves and drizzled with balsamic glaze and olive oil, offering a simple yet elegant dish bursting with fresh Mediterranean flavors.',1,1,2),(11,'Dates milkshake','This date shake is naturally sweet, filling, and a delightful way to start your day or enjoy as a snack or dessert. Cheers to wholesome indulgence!',2,3,1),(12,'Fattoush salad','Fattoush is a refreshing Lebanese salad made with fresh vegetables, herbs, and toasted or fried Arabic bread. It typically includes ingredients like lettuce, tomatoes, cucumbers, radishes, green peppers, and parsley, all tossed in a zesty sumac Mediterranean dressing. The iconic feature of fattoush is the crispy fried pita bread, adding a delightful crunch to this vibrant salad',2,4,2),(13,'Baba ganoush','A delectable Middle Eastern dish that is widely enjoyed for its rich and smoky flavors. It’s the perfect companion to pita bread or fresh vegetables, and its smoky undertones make it truly irresistible!',2,6,4),(14,'Chicken Shawarma','Chicken Shawarma is a delectable Middle Eastern dish that tantalizes the senses with its aromatic spices and succulent flavors.',2,12,4),(15,'Falafel','These crispy-on-the-outside, tender-on-the-inside morsels have a rich history and are beloved worldwide. You can enjoy them in wraps, sandwiches, or as a delightful appetizer with tahini sauce.',2,5,2),(16,'Fruit salad','A delightful medley of various fresh fruits, combining vibrant colors, flavors, and textures. Imagine juicy strawberries, fragrant oranges, and crisp pineapple all mingling together in a refreshing and luscious ensemble',2,1,1),(17,'Cucumber lemonade','Cucumber lemonade is a refreshing beverage made by blending fresh cucumber juice with zesty lemon juice, creating a delightful balance of coolness and tanginess. It’s perfect for hot summer days!',2,1,1),(18,'Dum Qeema AKA Mince','Dum ka Keema, also known as Spicy Smoked Ground Beef, is a flavorful Pakistani dish punctuated with the brightness of mint and the boldness of ginger, making it absolutely delicious when paired with parathas',2,4,2),(19,'Tiramisu','It’s a delightful Italian dessert that combines the richness of mascarpone with the boldness of coffee and cocoa. Buon appetito!',1,13,4),(20,'Chicken nuggets','Here’s a simple chicken nuggets recipe that you can whip up in no time. These crispy nuggets are perfect for a quick and delicious meal.',6,5,2);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeallergy`
--

DROP TABLE IF EXISTS `recipeallergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeallergy` (
  `recipeID` int NOT NULL,
  `allergyID` int NOT NULL,
  KEY `recipeID` (`recipeID`),
  KEY `allergyID` (`allergyID`),
  CONSTRAINT `recipeallergy_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`),
  CONSTRAINT `recipeallergy_ibfk_2` FOREIGN KEY (`allergyID`) REFERENCES `allergy` (`allergyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeallergy`
--

LOCK TABLES `recipeallergy` WRITE;
/*!40000 ALTER TABLE `recipeallergy` DISABLE KEYS */;
INSERT INTO `recipeallergy` VALUES (1,3),(2,4),(8,3),(9,3),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2);
/*!40000 ALTER TABLE `recipeallergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipedietaryrequirement`
--

DROP TABLE IF EXISTS `recipedietaryrequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipedietaryrequirement` (
  `recipeID` int NOT NULL,
  `dietaryID` int NOT NULL,
  KEY `recipeID` (`recipeID`),
  KEY `dietaryID` (`dietaryID`),
  CONSTRAINT `recipedietaryrequirement_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`),
  CONSTRAINT `recipedietaryrequirement_ibfk_2` FOREIGN KEY (`dietaryID`) REFERENCES `dietaryrequirement` (`dietaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipedietaryrequirement`
--

LOCK TABLES `recipedietaryrequirement` WRITE;
/*!40000 ALTER TABLE `recipedietaryrequirement` DISABLE KEYS */;
INSERT INTO `recipedietaryrequirement` VALUES (1,2),(1,3),(1,5),(2,1),(2,2),(2,3),(2,5),(3,1),(3,2),(4,5),(5,5),(8,3),(8,4),(9,3),(9,4),(10,1),(10,3),(11,2),(11,1),(12,2),(12,3),(12,4),(12,5),(13,1),(13,2),(13,3),(13,4),(13,5),(14,2),(15,2),(15,3),(15,4),(16,1),(16,2),(16,3),(16,4),(16,5),(17,1),(17,2),(17,3),(17,4),(17,5),(18,1),(18,2),(18,5),(19,2),(19,5),(20,2);
/*!40000 ALTER TABLE `recipedietaryrequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeingredientamount`
--

DROP TABLE IF EXISTS `recipeingredientamount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeingredientamount` (
  `recipeID` int NOT NULL,
  `ingredientID` int NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unitID` int DEFAULT NULL,
  KEY `recipeID` (`recipeID`),
  KEY `ingredientID` (`ingredientID`),
  KEY `unitID` (`unitID`),
  CONSTRAINT `recipeingredientamount_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`),
  CONSTRAINT `recipeingredientamount_ibfk_2` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`),
  CONSTRAINT `recipeingredientamount_ibfk_3` FOREIGN KEY (`unitID`) REFERENCES `unit` (`unitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeingredientamount`
--

LOCK TABLES `recipeingredientamount` WRITE;
/*!40000 ALTER TABLE `recipeingredientamount` DISABLE KEYS */;
INSERT INTO `recipeingredientamount` VALUES (1,1,200.00,1),(1,2,25.00,1),(1,3,2.00,5),(1,4,50.00,1),(2,5,1.00,NULL),(2,6,2.00,NULL),(2,7,3.00,NULL),(2,8,100.00,1),(3,7,6.00,NULL),(3,8,100.00,1),(3,9,200.00,2),(3,10,4.00,5),(3,11,1.00,4),(3,12,200.00,1),(3,13,500.00,1),(4,14,500.00,1),(4,7,4.00,NULL),(4,9,2.00,4),(4,15,1.00,4),(4,3,2.00,5),(4,16,2.00,5),(4,17,1.00,6),(5,18,500.00,1),(5,19,3.00,4),(5,9,2.00,4),(5,10,1.00,4),(8,20,250.00,1),(8,21,500.00,2),(8,22,2.00,NULL),(8,23,1.00,5),(8,24,1.00,5),(8,15,2.00,4),(8,8,2.00,NULL),(8,7,2.00,NULL),(9,25,500.00,1),(9,26,500.00,2),(9,27,1.00,4),(9,16,2.00,5),(9,8,1.00,NULL),(9,7,2.00,NULL),(10,31,2.00,NULL),(10,30,50.00,1),(10,28,1.00,6),(10,29,2.00,4),(10,19,1.00,4),(11,32,94.00,1),(11,33,237.00,2),(11,34,1.00,NULL),(11,35,1.00,5),(12,36,1.00,NULL),(12,37,1.00,NULL),(12,38,1.00,NULL),(12,39,0.50,NULL),(12,40,120.00,1),(12,41,60.00,1),(12,42,1.00,4),(12,43,1.00,NULL),(12,19,3.00,4),(12,3,1.00,1),(12,16,1.00,1),(12,44,2.00,NULL),(13,45,1.00,NULL),(13,7,1.00,NULL),(13,46,60.00,1),(13,43,60.00,2),(13,3,1.00,1),(13,16,1.00,1),(13,19,2.00,4),(14,13,455.00,1),(14,19,60.00,2),(14,43,1.00,NULL),(14,24,2.00,5),(14,48,1.00,5),(14,47,1.00,5),(14,3,1.00,1),(14,16,1.00,1),(14,49,4.00,NULL),(14,23,1.00,4),(15,25,1.00,NULL),(15,8,0.50,NULL),(15,40,60.00,1),(15,23,1.00,5),(15,16,1.00,5),(15,50,0.25,5),(15,51,1.00,4),(15,19,60.00,2),(15,7,1.00,NULL),(16,52,85.00,1),(16,53,85.00,1),(16,54,85.00,1),(16,55,85.00,1),(16,56,60.00,2),(17,43,1.00,NULL),(17,37,1.00,NULL),(17,58,220.00,2),(17,57,100.00,1),(18,59,227.00,1),(18,60,0.50,5),(18,8,1.00,NULL),(18,7,1.00,NULL),(18,23,1.00,5),(18,3,1.00,1),(18,16,1.00,1),(19,6,3.00,NULL),(19,64,500.00,1),(19,61,200.00,2),(19,62,1.00,NULL),(19,63,1.00,5),(19,57,75.00,1),(20,13,400.00,1),(20,51,3.00,4),(20,6,1.00,NULL),(20,65,80.00,1);
/*!40000 ALTER TABLE `recipeingredientamount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipestep`
--

DROP TABLE IF EXISTS `recipestep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipestep` (
  `stepID` int NOT NULL AUTO_INCREMENT,
  `recipeID` int NOT NULL,
  `stepNumber` int NOT NULL,
  `stepDescription` text NOT NULL,
  PRIMARY KEY (`stepID`),
  KEY `recipeID` (`recipeID`),
  CONSTRAINT `recipestep_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipestep`
--

LOCK TABLES `recipestep` WRITE;
/*!40000 ALTER TABLE `recipestep` DISABLE KEYS */;
INSERT INTO `recipestep` VALUES (1,1,1,'Cook pasta for 2 mins'),(2,1,2,'Melt butter in a medium pan and add the ground black pepper'),(3,1,3,'Drain pasta and keep a cup of the pasta water'),(4,1,4,'Put pasta in the pan with the remaining pasta water'),(5,1,5,'Stir in the parmesan'),(6,2,1,'Fry the garlic and onion until brown'),(7,2,2,'Combine the chopped tomatoes and cook until it\'s bubbling'),(8,2,3,'Make wells in the sauce and poach the eggs in the well'),(9,3,1,'In a saucepan, cook your rice for 10 mins in low heat'),(10,3,2,'In your baking tray, combine the remaining ingredients'),(11,3,3,'Bake in the over for 25 mins, 200°C'),(12,3,4,'Serve the chicken with rice, and drizzle the sauce from the tray'),(13,4,1,'Heat the cooking oil in a wok or large skillet over medium-high heat'),(14,4,2,'Add the minced garlic and stir-fry for about 30 seconds until fragrant'),(15,4,3,'Add the shrimp to the wok and stir-fry for 2-3 minutes until they turn pink and opaque'),(16,4,4,'Pour in the soy sauce, and season with salt and pepper. Stir well to coat the shrimp evenly with the sauce'),(17,4,5,'Garnish with chopped green onions, serve hot with steamed rice'),(18,5,1,'Preheat your oven to 400°F (200°C) and line a baking sheet with parchment paper'),(19,5,2,'In a small bowl, mix together soy sauce and honey to create the glaze'),(20,5,3,'Place the salmon fillets on the prepared baking sheet and brush them with olive oil'),(21,5,4,'Pour the soy sauce-honey glaze evenly over the salmon and bake for 10-12 minutes'),(22,5,5,'Serve hot with your favorite side dishes, such as steamed vegetables or rice'),(23,8,1,'Sauté onion, carrots, celery, and garlic'),(24,8,2,'Add lentils, broth, cumin, paprika, salt, and pepper to taste'),(25,8,3,'Simmer 20-25 mins until lentils are tender'),(26,8,4,'Serve hot, optionally garnished with coriander'),(27,9,1,'Sauté onion and garlic'),(28,9,2,'Add chickpeas, coconut milk, curry powder, turmeric, salt, and pepper to taste'),(29,9,3,'Simmer for 10-15 mins'),(30,9,4,'Serve hot with your favorite side dishes, such as steamed vegetables or rice, and garnish'),(31,10,1,'Arrange tomato and mozzarella slices on a serving plate, alternating between them'),(32,10,2,'Tuck fresh basil leaves between the tomato and mozzarella slices'),(33,10,3,'Drizzle with balsamic glaze and olive oil, optionally season with salt and pepper to taste'),(34,10,4,'Serve immediately as a refreshing appetizer or side dish'),(35,11,1,'Combine all ingredients in a blender and blend until smooth'),(36,11,2,'Serve immediately'),(37,12,1,'Cut the pita into the desired shapes (triangles, squares or strips). Toss with olive oil, salt and pepper and fry on medium heat. Stir frequently until is golden brown.'),(38,12,2,'In a large bowl, combine all ingredients and mix well'),(39,12,3,'Season with salt and pepper to taste!'),(40,13,1,'Pre heat oven to 200°C. Cut aubergine into large cubes, drizzle with olive oil and season with salt and pepper. Roast for 30 minutes turning the aubergine half way through.'),(41,13,2,'In a food processor, combine all ingredients and blend until smooth.'),(42,13,3,'Season with salt and pepper to taste and enjoy with pita bread or crackers!'),(43,14,1,'In a large bowl, combine all ingredients and mix well.'),(44,14,2,'Cover and refrigerate for at least 1 hour, up to 24 hours.'),(45,14,3,'Preheat a grill or grill pan over medium-high heat.'),(46,14,4,'Grill chicken for 5-7 minutes per side, or until cooked through.'),(47,14,5,'Spread sauce, chicken, and onions on the Shawarma bread, roll into a wrap and enjoy!'),(48,15,1,'Drain your tin of chickpeas and rinse them, dice your onion, mince your garlic'),(49,15,2,'In a food processor, combine all ingredients and blend until smooth.'),(50,15,3,'Shape mixture into small balls or patties.'),(51,15,4,'In a large skillet, heat olive oil over medium-high heat.'),(52,15,5,'Add falafel and cook for 3-5 minutes per side, or until golden brown.'),(53,15,6,'Serve with salad, flatbread and sauces.'),(54,16,1,'Dice the fruit'),(55,16,2,'In a large bowl, combine all ingredients and mix well.'),(56,16,3,'Serve immediately or refrigerate for later. Enjoy!'),(57,17,1,'peel and dice your cucumber'),(58,17,2,'In a blender combine all ingredients until smooth'),(59,17,3,'Pour into glass and enjoy!'),(60,18,1,'Dice onion, mince the garlic clove'),(61,18,2,'In a large pan, cook beef over medium-high heat until browned.'),(62,18,3,'Add onion, garlic, cumin, chilli powder, salt and pepper. Stir to combine.'),(63,18,4,'Cook for 5 minutes, or until the beef is fully cooked.'),(64,19,1,'Lightly oil an 8x8-inch baking dish'),(65,19,2,'Set a large heatproof bowl over a pan of simmering water to create a double boiler. Whisk together the egg yolks and sugar in the bowl until pale and thickened. Remove from heat and let it cool.'),(66,19,3,'Gradually fold in the mascarpone cheese into the egg yolk mixture until well combined.'),(67,19,4,'Dip the boudoir biscuits (ladyfingers) into espresso or strong coffee. Arrange a layer of soaked biscuits in the prepared dish.'),(68,19,5,'Spread a layer of the mascarpone mixture over the soaked biscuits. Repeat the layers until you’ve used up all the ingredients. Finish with a layer of mascarpone on top.'),(69,19,6,'Cover the dish and refrigerate for several hours or overnight. Before serving, dust the top with powdered cocoa or instant chocolate drink mix.'),(70,20,1,'Preheat the oven to 220°C/200°C Fan/Gas 7. Cut the chicken into strips.'),(71,20,2,'Put the flour in a wide, shallow bowl. Season it with salt and pepper and stir.'),(72,20,3,'Break the egg into a second shallow bowl and beat it with a fork until smooth and pale.'),(73,20,4,'Tip half of the breadcrumbs into a third shallow bowl.'),(74,20,5,'Coat each chicken strip first in flour, then egg, and finally breadcrumbs, pressing firmly and turning to coat on both sides. Set aside on baking paper.'),(75,20,6,'Brush a baking tray with 1 tablespoon of oil. Place the chicken pieces on the tray and brush generously but lightly with 3 tablespoons more oil. Bake for 15 minutes, turning halfway through.');
/*!40000 ALTER TABLE `recipestep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipetoolrequirement`
--

DROP TABLE IF EXISTS `recipetoolrequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipetoolrequirement` (
  `recipeID` int NOT NULL,
  `toolID` int NOT NULL,
  KEY `recipeID` (`recipeID`),
  KEY `toolID` (`toolID`),
  CONSTRAINT `recipetoolrequirement_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`),
  CONSTRAINT `recipetoolrequirement_ibfk_2` FOREIGN KEY (`toolID`) REFERENCES `tool` (`toolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipetoolrequirement`
--

LOCK TABLES `recipetoolrequirement` WRITE;
/*!40000 ALTER TABLE `recipetoolrequirement` DISABLE KEYS */;
INSERT INTO `recipetoolrequirement` VALUES (11,4),(12,8),(15,8);
/*!40000 ALTER TABLE `recipetoolrequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool` (
  `toolID` int NOT NULL AUTO_INCREMENT,
  `toolName` varchar(50) NOT NULL,
  PRIMARY KEY (`toolID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (1,'Air fryer'),(2,'Deep fat fryer'),(3,'Slow cooker'),(4,'Blender'),(5,'Hand blender'),(6,'Hand mixer'),(7,'Pressure cooker'),(8,'Food processor');
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `unitID` int NOT NULL AUTO_INCREMENT,
  `unitName` varchar(50) NOT NULL,
  PRIMARY KEY (`unitID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'g'),(2,'ml'),(3,'l'),(4,'tbsp'),(5,'tsp'),(6,'bunch'),(7,'cm'),(8,'in'),(9,'oz'),(10,'fl oz'),(11,'none');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userallergy`
--

DROP TABLE IF EXISTS `userallergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userallergy` (
  `userID` int NOT NULL,
  `allergyID` int NOT NULL,
  KEY `allergyID` (`allergyID`),
  KEY `userID` (`userID`),
  CONSTRAINT `userallergy_ibfk_1` FOREIGN KEY (`allergyID`) REFERENCES `allergy` (`allergyID`),
  CONSTRAINT `userallergy_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `userinfo` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userallergy`
--

LOCK TABLES `userallergy` WRITE;
/*!40000 ALTER TABLE `userallergy` DISABLE KEYS */;
INSERT INTO `userallergy` VALUES (1,1),(1,5),(4,2),(4,3),(8,4),(3,4),(11,2),(11,3),(11,5),(14,1),(10,1),(3,5),(6,2);
/*!40000 ALTER TABLE `userallergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdietaryrequirement`
--

DROP TABLE IF EXISTS `userdietaryrequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdietaryrequirement` (
  `userID` int NOT NULL,
  `dietaryID` int NOT NULL,
  KEY `userID` (`userID`),
  KEY `dietaryID` (`dietaryID`),
  CONSTRAINT `userdietaryrequirement_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userinfo` (`userID`),
  CONSTRAINT `userdietaryrequirement_ibfk_2` FOREIGN KEY (`dietaryID`) REFERENCES `dietaryrequirement` (`dietaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdietaryrequirement`
--

LOCK TABLES `userdietaryrequirement` WRITE;
/*!40000 ALTER TABLE `userdietaryrequirement` DISABLE KEYS */;
INSERT INTO `userdietaryrequirement` VALUES (2,1),(2,4),(6,4),(8,2),(13,4),(14,1),(3,2),(8,3),(9,3),(9,1),(7,5),(12,2),(12,5);
/*!40000 ALTER TABLE `userdietaryrequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfavourite`
--

DROP TABLE IF EXISTS `userfavourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userfavourite` (
  `userID` int NOT NULL,
  `recipeID` int NOT NULL,
  KEY `userID` (`userID`),
  KEY `recipeID` (`recipeID`),
  CONSTRAINT `userfavourite_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userinfo` (`userID`),
  CONSTRAINT `userfavourite_ibfk_2` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfavourite`
--

LOCK TABLES `userfavourite` WRITE;
/*!40000 ALTER TABLE `userfavourite` DISABLE KEYS */;
INSERT INTO `userfavourite` VALUES (1,3),(2,5),(3,6),(3,1),(4,6),(5,15),(5,2),(5,8),(6,17),(6,1),(7,19),(8,20),(8,12),(9,17),(10,7),(11,4),(11,9),(12,20),(13,20),(14,10),(15,10),(15,20);
/*!40000 ALTER TABLE `userfavourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `userPassword` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'John','Smith','john.smith@example.com','jsmith','p@ssw0rd'),(2,'Emily','Johnson','emily.johnson@example.com','ejohnson','secret123'),(3,'Michael','Williams','michael.williams@example.com','mwilliams','12345678'),(4,'Sarah','Brown','sarah.brown@example.com','sbrown','qwerty'),(5,'David','Davis','david.davis@example.com','ddavis','abc123'),(6,'Jessica','Martinez','jessica.martinez@example.com','jmartinez','mypassword'),(7,'Matthew','Jones','matthew.jones@example.com','mjones','letmein'),(8,'Samantha','Anderson','samantha.anderson@example.com','sanderson','passw0rd'),(9,'Daniel','Taylor','daniel.taylor@example.com','dtaylor','ilovecats'),(10,'Olivia','Wilson','olivia.wilson@example.com','owilson','98765432'),(11,'Ethan','Thomas','ethan.thomas@example.com','ethomas','mydog123'),(12,'Ava','Garcia','ava.garcia@example.com','agarcia','sunshine'),(13,'Logan','Miller','logan.miller@example.com','lmiller','football'),(14,'Mia','Jackson','mia.jackson@example.com','mjackson','123abc'),(15,'Benjamin','Lee','benjamin.lee@example.com','blee','ilovecoding');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vrecipecuisine`
--

DROP TABLE IF EXISTS `vrecipecuisine`;
/*!50001 DROP VIEW IF EXISTS `vrecipecuisine`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vrecipecuisine` AS SELECT 
 1 AS `recipeID`,
 1 AS `recipeName`,
 1 AS `allergyID`,
 1 AS `allergyType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vrecipedietaryrequirements`
--

DROP TABLE IF EXISTS `vrecipedietaryrequirements`;
/*!50001 DROP VIEW IF EXISTS `vrecipedietaryrequirements`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vrecipedietaryrequirements` AS SELECT 
 1 AS `recipeID`,
 1 AS `recipeName`,
 1 AS `dietaryID`,
 1 AS `dietaryType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vrecipeingredients`
--

DROP TABLE IF EXISTS `vrecipeingredients`;
/*!50001 DROP VIEW IF EXISTS `vrecipeingredients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vrecipeingredients` AS SELECT 
 1 AS `recipeID`,
 1 AS `recipeName`,
 1 AS `ingredientID`,
 1 AS `ingredientName`,
 1 AS `quantity`,
 1 AS `unitID`,
 1 AS `unitName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vrecipestep`
--

DROP TABLE IF EXISTS `vrecipestep`;
/*!50001 DROP VIEW IF EXISTS `vrecipestep`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vrecipestep` AS SELECT 
 1 AS `recipeID`,
 1 AS `recipeName`,
 1 AS `stepID`,
 1 AS `stepNumber`,
 1 AS `stepDescription`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vrecipetools`
--

DROP TABLE IF EXISTS `vrecipetools`;
/*!50001 DROP VIEW IF EXISTS `vrecipetools`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vrecipetools` AS SELECT 
 1 AS `recipeID`,
 1 AS `recipeName`,
 1 AS `toolID`,
 1 AS `toolName`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vrecipecuisine`
--

/*!50001 DROP VIEW IF EXISTS `vrecipecuisine`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vrecipecuisine` AS select `r`.`recipeID` AS `recipeID`,`r`.`recipeName` AS `recipeName`,`ra`.`allergyID` AS `allergyID`,`a`.`allergyType` AS `allergyType` from ((`recipe` `r` join `recipeallergy` `ra` on((`r`.`recipeID` = `ra`.`recipeID`))) join `allergy` `a` on((`ra`.`allergyID` = `a`.`allergyID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vrecipedietaryrequirements`
--

/*!50001 DROP VIEW IF EXISTS `vrecipedietaryrequirements`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vrecipedietaryrequirements` AS select `r`.`recipeID` AS `recipeID`,`r`.`recipeName` AS `recipeName`,`rdr`.`dietaryID` AS `dietaryID`,`dr`.`dietaryType` AS `dietaryType` from ((`recipe` `r` join `recipedietaryrequirement` `rdr` on((`r`.`recipeID` = `rdr`.`recipeID`))) join `dietaryrequirement` `dr` on((`rdr`.`dietaryID` = `dr`.`dietaryID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vrecipeingredients`
--

/*!50001 DROP VIEW IF EXISTS `vrecipeingredients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vrecipeingredients` AS select `r`.`recipeID` AS `recipeID`,`r`.`recipeName` AS `recipeName`,`ri`.`ingredientID` AS `ingredientID`,`i`.`ingredientName` AS `ingredientName`,`ri`.`quantity` AS `quantity`,`ri`.`unitID` AS `unitID`,`u`.`unitName` AS `unitName` from (((`recipe` `r` join `recipeingredientamount` `ri` on((`r`.`recipeID` = `ri`.`recipeID`))) join `ingredient` `i` on((`ri`.`ingredientID` = `i`.`ingredientID`))) join `unit` `u` on((`ri`.`unitID` = `u`.`unitID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vrecipestep`
--

/*!50001 DROP VIEW IF EXISTS `vrecipestep`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vrecipestep` AS select `r`.`recipeID` AS `recipeID`,`r`.`recipeName` AS `recipeName`,`rs`.`stepID` AS `stepID`,`rs`.`stepNumber` AS `stepNumber`,`rs`.`stepDescription` AS `stepDescription` from (`recipe` `r` join `recipestep` `rs` on((`r`.`recipeID` = `rs`.`recipeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vrecipetools`
--

/*!50001 DROP VIEW IF EXISTS `vrecipetools`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vrecipetools` AS select `r`.`recipeID` AS `recipeID`,`r`.`recipeName` AS `recipeName`,`rtr`.`toolID` AS `toolID`,`t`.`toolName` AS `toolName` from ((`recipe` `r` join `recipetoolrequirement` `rtr` on((`rtr`.`recipeID` = `r`.`recipeID`))) join `tool` `t` on((`rtr`.`toolID` = `t`.`toolID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-23 22:06:40
