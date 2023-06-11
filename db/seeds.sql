-- Seed data for application 
INSERT INTO department(departmentName)
VALUES  ('front'),
        ('back'),
        ('goobers');

INSERT INTO role(title, salary, departmentId)
VALUES  ('Burger Man', 150000, 1),
        ('Grill Master', 42000, 1),
        ('Bun Wearer', 33000, 2),
        ('Musical master', 160000, 2),
        ('Terror', 520000, 3),
        ('UHHHHHHH', 220000, 3),
        ('Candy', 666000, 3);

INSERT INTO employee(firstName, lastName, roleId, managerId)
VALUES  ('Bob', 'Belcher', 1, NULL),
        ('Linda', 'Belcher', 4, 1),
        ('Tina', 'Belcher', 6, 3),
        ('Gene', 'Belcher', 3, 3),
        ('Louise', 'Belcher', 5, 3),
        ('Teddy', 'Handyman', 6, 2),
        ('Mr', 'Fishowner', 5, NULL),
        ('Jimmy', 'Pesto Jr', 7, 3);