-- Clear existing data to prevent duplication
TRUNCATE TABLE RecipeItems RESTART IDENTITY CASCADE;

-- Mock Data for RecipeItems (Green Tea Recipes)

-- Recipe for Premium Matcha Latte (item_id 1)
INSERT INTO RecipeItems (item_id, ingredient_id, quantity_needed) VALUES
(1, 5, 2),    -- 2 units of Matcha
(1, 6, 1),    -- 1 unit of Sugar
(1, 1, 0.5);  -- 0.5 unit of Pure water (for whisking)

-- Recipe for Roasted Hojicha Tea (item_id 2)
INSERT INTO RecipeItems (item_id, ingredient_id, quantity_needed) VALUES
(2, 3, 3),    -- 3 units of Hojicha
(2, 1, 1.5);  -- 1.5 units of Pure water

-- Recipe for Classic Sencha (item_id 3)
INSERT INTO RecipeItems (item_id, ingredient_id, quantity_needed) VALUES
(3, 4, 2),    -- 2 units of Chensa (Sencha)
(3, 1, 1.2);  -- 1.2 units of Pure water

-- Recipe for Honey Matcha Cold Brew (item_id 4)
INSERT INTO RecipeItems (item_id, ingredient_id, quantity_needed) VALUES
(4, 5, 2),    -- 2 units of Matcha
(4, 7, 1),    -- 1 unit of Honney
(4, 2, 0.1),  -- 0.1 unit of Pink Salt
(4, 8, 2),    -- 2 units of Ice
(4, 1, 1);    -- 1 unit of Pure water

-- Recipe for Matcha Silky Pudding (item_id 5)
INSERT INTO RecipeItems (item_id, ingredient_id, quantity_needed) VALUES
(5, 9, 1),    -- 1 unit of Pudding base
(5, 5, 0.5);  -- 0.5 unit of Matcha (for topping)

-- Recipe for Green Tea Signature Cake (item_id 6)
INSERT INTO RecipeItems (item_id, ingredient_id, quantity_needed) VALUES
(6, 10, 1),   -- 1 unit of Cake base
(6, 5, 1);    -- 1 unit of Matcha (for cream/flavor)