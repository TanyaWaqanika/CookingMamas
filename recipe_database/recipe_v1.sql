create database repdb;

use repdb;

create table recipe (
recipeID int auto_increment primary key,
recipeName varchar (250) not null,
recipeDescription text,
cuisineID int not null,
overallDuration time,
cookTime time not null,
prepTime time not null,
servingSize int not null,
Instructions text not null
); 

create table ingredient (
ingredientID int auto_increment primary key,
ingredientName varchar(50) not null,
allergen boolean not null
);

create table unit (
unitID int auto_increment primary key,
unitName varchar(50) not null
);

create table quantity (
quantityID int auto_increment primary key,
quantityAmount float not null
);

create table cuisine (
cuisineID int auto_increment primary key,
cuisine_type varchar(100) not null
);

create table duration (
durationID int auto_increment primary key,
durationLength time not null
);

create table recipeStep (
stepID int auto_increment primary key,
recipeID int not null,
stepNumber int not null,
stepDescription text not null
);

