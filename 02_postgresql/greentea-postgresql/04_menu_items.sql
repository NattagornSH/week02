-- Clear existing data to prevent duplication
TRUNCATE TABLE MenuItems RESTART IDENTITY CASCADE;

-- Mock Data for MenuItems (Green Tea Shop Theme)
INSERT INTO MenuItems (item_id, name, description, price, category) VALUES
(1, 'Premium Matcha Latte', 'High-quality Uji matcha whisked with creamy milk and a touch of sweetness.', 120.00, 'Drink'),
(2, 'Roasted Hojicha Tea', 'Earthy and smoky roasted green tea with low caffeine, served hot or cold.', 95.00, 'Drink'),
(3, 'Classic Sencha', 'Refreshing and traditional Japanese steamed green tea with a grassy aroma.', 85.00, 'Drink'),
(4, 'Honey Matcha Cold Brew', 'Ceremonial grade matcha infused with natural honey and a hint of pink salt.', 110.00, 'Drink'),
(5, 'Matcha Silky Pudding', 'Smooth and creamy matcha pudding topped with a light sweet syrup.', 65.00, 'Dessert'),
(6, 'Green Tea Signature Cake', 'Fluffy sponge cake layered with rich green tea cream.', 145.00, 'Dessert'),
(7, 'Hojicha Caramel Frappe', 'Blended roasted tea with caramel sauce and whipped cream.', 125.00, 'Drink'),
(8, 'Iced Matcha with Pudding', 'Signature matcha latte served with a whole matcha pudding topping.', 150.00, 'Drink');