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
FROM emoloyee
JOIN role ON employee role.department_id = department.id
LEFT JOIN employee manager ON manager.id = employee.manager_id
`;

function addDept() {
  inquirer
    .prompt([
      {
        type: "input",
        message: "Please enter a department name:",
        name: "newDept",
      },
    ])
    .then((answer) => {
      db.query(
        "INSERT INTO dept (deptName) VALUES (?)",
        [answer.newDept],
        (err, res) => {
          mainMenu();
        }
      )
    })
}
