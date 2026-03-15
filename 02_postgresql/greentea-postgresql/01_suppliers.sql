-- Clear existing data to prevent duplication
TRUNCATE TABLE Suppliers RESTART IDENTITY CASCADE;

-- Mock Data for Suppliers
INSERT INTO Suppliers (supplier_id, name, contact_person, phone_number) VALUES
(1, 'Fontaine tea shop', 'Furina', '555-0101'),
(2, 'Sumeru tea shop', 'Nahida', '555-0102'),
(3, 'Inazuma tea shop', 'Kamisato Ayaka', '555-0103');