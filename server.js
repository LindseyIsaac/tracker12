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
SELECT role.title, role.salary, department.departmentName
FROM role
JOIN department ON department.id = role.departmentId
`;

const viewEmployee = `
SELECT employee.firstName, employee.lastName, role.title, role.salary, department.departmentName, 
concat(manager.firstName, ' ', manager.lastName) AS managerName
FROM employee
JOIN role ON role.id = employee.roleId
JOIN department ON department.id = role.departmentId
LEFT JOIN employee manager ON manager.id = employee.mangerId
`;

function addDepartment() {
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
        "INSERT INTO departmentt (departmentName) VALUES (?)",
        [answer.newDepartment],
        (err, res) => {
          main();
        }
      )
    })
}
function addRole() {
  inquirer
    .prompt([
      {
        type: "input",
        message: "What is your position?",
        name: "role",
      },
      {
        type: "input",
        message: "What is your pay?",
        name: "salary",
      },
      {
        type: "input",
        message: "What is your department Id?",
        name: "deptId",
      },
    ])
    .then((answers) => {
      db.query(
        "INSERT INTO ROLE (title, salary, deptartmentId) VALUES (?, ?, ?)",
        [answers.role, answers.salary, answers.departmentId],
        (err, dataRes) => {
          main();
        }
      );
    });
}

function addEmployee() {
  db.query("SELECT * FROM ROLE", (err, data) => {
    const roles = data.map((row) => {
      return { name: row.title, value: row.id };
    });
    inquirer
      .prompt([
        {
          type: "input",
          message: "Employees first name?",
          name: "firstName",
        },
        {
          type: "input",
          message: "Employees last name?",
          name: "lastName",
        },
        {
          type: "list",
          message: "Employee's role?",
          name: "roleId",
          choices: roles,
        },
        {
          type: "input",
          message: "Manager id?",
          name: "managerId",
        },
      ])
      .then((answers) => {
        db.query(
          "INSERT INTO employee (firstName, lastName, roleId, managerId) VALUES (?, ?, ?, ?)",
          [
            answers.firstName,
            answers.lastName,
            answers.roleId,
            answers.managerId,
          ],
          (err, dataRes) => {
            main();
          }
        );
      });
  });
}

function updateRole() {
  db.query("SELECT * FROM employee", (err, data) => {
    const employees = data.map((row) => {
      return { name: `${row.firstName} ${row.lastName}`, value: row.id };
    });
    db.query("SELECT * FROM role", (err, data) => {
      const newRole = data.map((row) => {
        return { name: row.title, value: row.id };
      });
      console.log(employees);
      inquirer
        .prompt([
          {
            type: "list",
            message: "What employee role would you like to update?",
            name: "employeeUpdate",
            choices: employees,
          },
          {
            type: "list",
            message:
              "What new role would you like to assign?",
            name: "newRole",
            choices: newRole,
          },
        ])
        .then((answers) => {
          console.log(answers);
          db.query(
            "UPDATE employee SET roleId = ? WHERE id = ?",
            [answers.newRole, answers.employeeUpdate],
            (err, data) => {
              main();
            }
          );
        });
    });
  });
}

function main() {
  inquirer
    .prompt([
      {
        type: "list",
        message: "What would you like to choose?",
        name: "action",
        choices: [
          "View all departments",
          "View all roles",
          "View all employees",
          "Add a department",
          "Add a role",
          "Add a employee",
          "Update a employee role",
        ],
      },
    ])
    .then((answers) => {
      switch (answers.action) {
        case "View all departments":
          db.query("SELECT * FROM department", (err, dataRes) => {
            console.table(dataRes);
            main();
          });
          break;
        case "View all roles":
          db.query(viewTitles, (err, dataRes) => {
            console.table(dataRes);
            main();
          });
          break;
        case "View all employees":
          db.query(viewEmployee, (err, dataRes) => {
            console.table(dataRes);
            main();
          });
          break;
        case "add a department":
          addDept();
          break;
        case "add a role":
          addRole();
          break;
        case "add a employee":
          addEmployee();
          break;
        case "update a employee role":
          updateRole();
          break;
        default:
          console.log("Didnt work did it? boooo ugh grrrr");
          main();
          break;
      }
    });
}
main();