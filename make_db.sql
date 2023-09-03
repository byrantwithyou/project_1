-- Remove the DB if it exists
DROP DATABASE IF EXISTS projectdb;

-- Create the DB
CREATE DATABASE projectdb;

USE projectdb;

-- Creates the `companies` table
CREATE TABLE companies (
	Id integer PRIMARY KEY,
	Name VARCHAR(50) UNIQUE NOT NULL
);

-- Creates the `jobs` table
CREATE TABLE jobs (
	Id integer PRIMARY KEY,
	Company_Id integer NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Salary integer NOT NULL,
	CONSTRAINT Company_Id_FK FOREIGN KEY (Company_Id)
	REFERENCES companies (Id) MATCH simple
	ON UPDATE CASCADE ON DELETE CASCADE
);

-- Creates the `employees` table
CREATE TABLE employees (
	Id integer PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Job_Id integer NOT NULL,
	CONSTRAINT Job_Id_FK FOREIGN KEY (Job_Id)
	REFERENCES jobs (Id) MATCH simple
	ON UPDATE CASCADE ON DELETE CASCADE
);
