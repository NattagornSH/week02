-- Clear existing data to prevent duplication
TRUNCATE TABLE OrderItems RESTART IDENTITY CASCADE;

-- Mock Data for OrderItems (Green Tea Shop Theme)

-- Order 1 (Total: 330.00) - คุณพิมพ์ สายสุขภาพ
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES
(1, 1, 1), -- 1 Premium Matcha Latte (120.00)
(1, 5, 1), -- 1 Matcha Silky Pudding (65.00)
(1, 6, 1); -- 1 Green Tea Signature Cake (145.00)

-- Order 2 (Total: 210.00)
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES
(2, 3, 1), -- 1 Classic Sencha (85.00)
(2, 7, 1); -- 1 Hojicha Caramel Frappe (125.00)

-- Order 3 (Total: 240.00) - สั่งมัทฉะลาเต้สองแก้ว
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES
(3, 1, 2); -- 2 Premium Matcha Latte (2 * 120.00 = 240.00)

-- Order 4 (Total: 325.00) - คุณเจน Matcha Lover
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES
(4, 4, 1), -- 1 Honey Matcha Cold Brew (110.00)
(4, 8, 1), -- 1 Iced Matcha with Pudding (150.00)
(4, 5, 1); -- 1 Matcha Silky Pudding (65.00)

-- Order 5 (Total: 180.00)
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES 
(5, 2, 1), -- 1 Roasted Hojicha Tea (95.00)
(3, 3, 1); -- 1 Classic Sencha (85.00)

-- Order 6 (Total: 290.00)
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES 
(6, 6, 2); -- 2 Green Tea Signature Cake (2 * 145.00 = 290.00)

-- Order 7 (Total: 210.00)
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES 
(7, 3, 1), -- 1 Classic Sencha (85.00)
(7, 7, 1); -- 1 Hojicha Caramel Frappe (125.00)

-- Order 8 (Total: 600.00) - สั่งไปเลี้ยงที่ออฟฟิศ
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES 
(8, 1, 4), -- 4 Premium Matcha Latte (4 * 120.00)
(8, 5, 4); -- 4 Matcha Silky Pudding (4 * 65.00) (Error in total comment, but IDs match)

-- Order 5
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (5, 4, 1), (5, 8, 1);
-- Order 6
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (6, 2, 2), (6, 5, 2);
-- Order 7
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (7, 3, 1), (7, 6, 1);
-- Order 8
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (8, 1, 4), (8, 5, 4), (8, 7, 4);
-- Order 9
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (9, 2, 1);
-- Order 10
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (10, 4, 1), (10, 6, 1);
-- Order 11
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (11, 1, 2);
-- Order 12
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (12, 3, 1), (12, 5, 1), (12, 7, 1);
-- Order 13
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (13, 2, 3), (13, 5, 3);
-- Order 14
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (14, 1, 1), (14, 8, 1);
-- Order 15
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (15, 4, 2), (15, 6, 2), (15, 7, 2);
-- Order 16
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (16, 2, 1), (16, 5, 1);
-- Order 17
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (17, 1, 1);
-- Order 18
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (18, 3, 1), (18, 7, 1);
-- Order 19
INSERT INTO OrderItems (order_id, item_id, quantity) VALUES (19, 5, 2);