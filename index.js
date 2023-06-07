const inquirer = require("inquirer");
const mysql = require("mysql2");
require("console.table");

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "oddone",
  database: "employee_db",
});

const viewTitles = `
SELECT role.title, role.salary, department.department_id
FROM role
JOIN department_id = role.department_id
`;

const viewEmployees = `
SELECT employee.first_name, employee.last_name, role.title, department.department_area, concat(employees.first_name, ' ', employees.last_name) AS manager_name
`