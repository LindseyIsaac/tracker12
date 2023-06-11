-- database set up 
DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;
USE employee_db;

-- department table
CREATE TABLE department (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    departmentName VARCHAR(30) NOT NULL
);

-- role table
CREATE TABLE role (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR (30),
    salary DECIMAL,
    departmentId INT,
    FOREIGN KEY (departmentId)
    REFERENCES department(id)
);

-- employee table
CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    roleId INT,
    FOREIGN KEY (roleId)
    REFERENCES role(id),
    managerId INT,
    FOREIGN KEY (managerId)
    REFERENCES employee(id)
);