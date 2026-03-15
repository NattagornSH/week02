-- Clear existing data to prevent duplication
TRUNCATE TABLE Ingredients RESTART IDENTITY CASCADE;

-- Mock Data for Ingredients
INSERT INTO Ingredients (ingredient_id, name, stock_level, unit, supplier_id) VALUES
(1, 'Pure water', 200, 'units', 1),
(2, 'Pink Salt', 100, 'units', 1),
(3, 'Hojicha', 300, 'units', 2),
(4, 'Chensa', 20, 'units', 3),
(5, 'Matcha', 50, 'units', 3),
(6, 'Sugar', 400, 'units', 1),
(7, 'Honney', 150, 'units', 1),
(8, 'Ice', 10, 'units', 3),
(9, 'Pudding', 100, 'units', 3),
(10, 'Cake', 25, 'units', 3);