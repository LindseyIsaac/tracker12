-- Seed data for application 

INSERT INTO department(department_name)
VALUES  ('front'),
        ('back'),
        ('children');

Insert INTO role(title, salary, department_id)
VALUES  ('Burger Man', 150000, 1),
        ('Grill Master', 42000, 1),
        ('Bun Wearer', 330000, 2),
        ('Musical master', 160000, 2),
        ('Terror', 520000, 3),
        ('UHHHHHHH', 220000, 3),
        ('Candy', 666000, 4),

Insert INTO employee(first_name, last_name, role_id, manager_id)
VALUES ('Bob', 'Belcher', 1, NULL),
        ('Linda', 'Belcher', 2, 1),
        ('Tina', 'Belcher', 4, NULL),
        ('Gene', 'Belcher', 2, NULL),
        ('Louise', 'Belcher', 3, NULL),
        ('Teddy', 'Handyman', 4, 2),
        ('Mr', 'Fishowner', 3),
        ('Jimmy', 'Pesto Jr', 4, 3);