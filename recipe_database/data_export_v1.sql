-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (x86_64)
--
-- Host: 127.0.0.1    Database: repdb
-- ------------------------------------------------------
-- Server version	8.2.0

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy`
--

LOCK TABLES `allergy` WRITE;
/*!40000 ALTER TABLE `allergy` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietaryRequirement`
--

DROP TABLE IF EXISTS `dietaryRequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietaryRequirement` (
  `dietaryID` int NOT NULL AUTO_INCREMENT,
  `dietaryType` varchar(50) NOT NULL,
  PRIMARY KEY (`dietaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietaryRequirement`
--

LOCK TABLES `dietaryRequirement` WRITE;
/*!40000 ALTER TABLE `dietaryRequirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `dietaryRequirement` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duration`
--

LOCK TABLES `duration` WRITE;
/*!40000 ALTER TABLE `duration` DISABLE KEYS */;
/*!40000 ALTER TABLE `duration` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeAllergy`
--

DROP TABLE IF EXISTS `recipeAllergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeAllergy` (
  `recipeID` int NOT NULL,
  `allergyID` int NOT NULL,
  KEY `recipeID` (`recipeID`),
  KEY `allergyID` (`allergyID`),
  CONSTRAINT `recipeallergy_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`),
  CONSTRAINT `recipeallergy_ibfk_2` FOREIGN KEY (`allergyID`) REFERENCES `allergy` (`allergyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeAllergy`
--

LOCK TABLES `recipeAllergy` WRITE;
/*!40000 ALTER TABLE `recipeAllergy` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipeAllergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeDietaryRequirement`
--

DROP TABLE IF EXISTS `recipeDietaryRequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeDietaryRequirement` (
  `recipeID` int NOT NULL,
  `dietaryID` int NOT NULL,
  KEY `recipeID` (`recipeID`),
  KEY `dietaryID` (`dietaryID`),
  CONSTRAINT `recipedietaryrequirement_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`),
  CONSTRAINT `recipedietaryrequirement_ibfk_2` FOREIGN KEY (`dietaryID`) REFERENCES `dietaryRequirement` (`dietaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeDietaryRequirement`
--

LOCK TABLES `recipeDietaryRequirement` WRITE;
/*!40000 ALTER TABLE `recipeDietaryRequirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipeDietaryRequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeImage`
--

DROP TABLE IF EXISTS `recipeImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeImage` (
  `imageID` int NOT NULL AUTO_INCREMENT,
  `recipeID` int NOT NULL,
  `imageSource` varchar(100) NOT NULL,
  PRIMARY KEY (`imageID`),
  KEY `recipeID` (`recipeID`),
  CONSTRAINT `recipeimage_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeImage`
--

LOCK TABLES `recipeImage` WRITE;
/*!40000 ALTER TABLE `recipeImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipeImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeIngredientAmount`
--

DROP TABLE IF EXISTS `recipeIngredientAmount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeIngredientAmount` (
  `recipeID` int NOT NULL,
  `ingredientID` int NOT NULL,
  `quantityID` decimal(10,0) NOT NULL,
  `unitID` int NOT NULL,
  KEY `recipeID` (`recipeID`),
  KEY `ingredientID` (`ingredientID`),
  KEY `unitID` (`unitID`),
  CONSTRAINT `recipeingredientamount_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`),
  CONSTRAINT `recipeingredientamount_ibfk_2` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`),
  CONSTRAINT `recipeingredientamount_ibfk_3` FOREIGN KEY (`unitID`) REFERENCES `unit` (`unitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeIngredientAmount`
--

LOCK TABLES `recipeIngredientAmount` WRITE;
/*!40000 ALTER TABLE `recipeIngredientAmount` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipeIngredientAmount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeStep`
--

DROP TABLE IF EXISTS `recipeStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeStep` (
  `stepID` int NOT NULL AUTO_INCREMENT,
  `recipeID` int NOT NULL,
  `stepNumber` int NOT NULL,
  `stepDescription` text NOT NULL,
  PRIMARY KEY (`stepID`),
  KEY `recipeID` (`recipeID`),
  CONSTRAINT `recipestep_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeStep`
--

LOCK TABLES `recipeStep` WRITE;
/*!40000 ALTER TABLE `recipeStep` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipeStep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeToolRequirement`
--

DROP TABLE IF EXISTS `recipeToolRequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeToolRequirement` (
  `recipeID` int NOT NULL,
  `toolID` int NOT NULL,
  KEY `recipeID` (`recipeID`),
  KEY `toolID` (`toolID`),
  CONSTRAINT `recipetoolrequirement_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`),
  CONSTRAINT `recipetoolrequirement_ibfk_2` FOREIGN KEY (`toolID`) REFERENCES `tool` (`toolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeToolRequirement`
--

LOCK TABLES `recipeToolRequirement` WRITE;
/*!40000 ALTER TABLE `recipeToolRequirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipeToolRequirement` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userAllergy`
--

DROP TABLE IF EXISTS `userAllergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userAllergy` (
  `userID` int NOT NULL,
  `allergyID` int NOT NULL,
  KEY `userID` (`userID`),
  KEY `allergyID` (`allergyID`),
  CONSTRAINT `userallergy_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `userallergy_ibfk_2` FOREIGN KEY (`allergyID`) REFERENCES `allergy` (`allergyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userAllergy`
--

LOCK TABLES `userAllergy` WRITE;
/*!40000 ALTER TABLE `userAllergy` DISABLE KEYS */;
/*!40000 ALTER TABLE `userAllergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userDietaryRequirement`
--

DROP TABLE IF EXISTS `userDietaryRequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userDietaryRequirement` (
  `userID` int NOT NULL,
  `dietaryID` int NOT NULL,
  KEY `userID` (`userID`),
  KEY `dietaryID` (`dietaryID`),
  CONSTRAINT `userdietaryrequirement_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `userdietaryrequirement_ibfk_2` FOREIGN KEY (`dietaryID`) REFERENCES `dietaryRequirement` (`dietaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userDietaryRequirement`
--

LOCK TABLES `userDietaryRequirement` WRITE;
/*!40000 ALTER TABLE `userDietaryRequirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `userDietaryRequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userFavourite`
--

DROP TABLE IF EXISTS `userFavourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userFavourite` (
  `userID` int NOT NULL,
  `recipeID` int NOT NULL,
  KEY `userID` (`userID`),
  KEY `recipeID` (`recipeID`),
  CONSTRAINT `userfavourite_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userInfo` (`userID`),
  CONSTRAINT `userfavourite_ibfk_2` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userFavourite`
--

LOCK TABLES `userFavourite` WRITE;
/*!40000 ALTER TABLE `userFavourite` DISABLE KEYS */;
/*!40000 ALTER TABLE `userFavourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userInfo`
--

DROP TABLE IF EXISTS `userInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userInfo` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `userPassword` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userInfo`
--

LOCK TABLES `userInfo` WRITE;
/*!40000 ALTER TABLE `userInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `userInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-11  0:04:08
