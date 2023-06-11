-- database set up 
DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;
USE employees_db;

-- department table
CREATE TABLE dept (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    departmentName VARCHAR(30) NOT NULL
);

-- role table
CREATE TABLE role (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR (30),
    salary DECIMAL,
    deptartment_ID INT,
    FOREIGN KEY (department_ID)
    REFERENCES department(id)
);

-- employee table
CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    roleID INT,
    FOREIGN KEY (roleID)
    REFERENCES role(id),
    managerID INT,
    FOREIGN KEY (managerID)
    REFERENCES employee(id)
);