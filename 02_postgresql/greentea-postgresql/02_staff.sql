-- Clear existing data to prevent duplication
TRUNCATE TABLE Staff RESTART IDENTITY CASCADE;

-- Mock Data for Staff
INSERT INTO Staff (staff_id, first_name, last_name, role) VALUES
(1, 'Ren', 'Amamiya', 'Cashier'),
(2, 'Ann', 'Takamaki', 'Barista'),
(3, 'Ryuji', 'Sakamoto', 'Cashier'),
(4, 'Yuzuke', 'Kitagawa', 'Bartender');