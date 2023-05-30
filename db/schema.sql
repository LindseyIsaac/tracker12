DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;
USE employees_db;

CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);

CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

-- -- Creates databases
-- DROP DATABASE IF EXISTS role_db;
-- CREATE DATABASE role_db;

-- USE role_db;

-- -- Table for dept
-- CREATE TABLE members (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     band_mates VARCHAR(30) NOT NULL
-- );

-- -- Table for job titles
-- CREATE TABLE role (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(30),
--     salary DECIMAL, 
--     dept_id INT NOT NULL,
    
--     FOREIGN KEY (dept_id)
--     REFERENCES dept(id)
-- );

-- -- Table with individual emp info
-- CREATE TABLE employee (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(30),
--     last_name VARCHAR(30),
--     role_id INT NOT NULL,
--     FOREIGN KEY (role_id)
--     REFERENCES role(id),
--     manager_id INT,
--     FOREIGN KEY (manager_id)
--     REFERENCES employee(id)
-- );