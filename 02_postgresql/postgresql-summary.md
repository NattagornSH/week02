# PostgreSQL Comprehensive Summary: From Basic to Advanced

เอกสารฉบับนี้สรุปเนื้อหา PostgreSQL ตั้งแต่ระดับพื้นฐานจนถึงระดับสูง โดยใช้โครงสร้างฐานข้อมูลจากโปรเจกต์ (Suppliers, Ingredients, MenuItems, Orders) เป็นตัวอย่างประกอบ

---

## 1. พื้นฐาน (Basic SQL)

### 1.1 การสร้างตารางและชนิดข้อมูล (Data Types)
- `SERIAL`: เลขรันอัตโนมัติ (Auto-increment) มักใช้เป็น Primary Key
- `VARCHAR(n)`: ข้อความที่มีความยาวจำกัด
- `TEXT`: ข้อความยาวไม่จำกัด
- `DECIMAL(p, s)`: ตัวเลขทศนิยมแม่นยำสูง (เช่น ราคา, สต็อก)
- `TIMESTAMP`: วันที่และเวลา

```sql
CREATE TABLE Staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role VARCHAR(50)
);
```

### 1.2 การจัดการข้อมูล (CRUD Operations)
- **INSERT**: เพิ่มข้อมูล
- **SELECT**: ดึงข้อมูล
- **UPDATE**: แก้ไขข้อมูล
- **DELETE**: ลบข้อมูล

```sql
-- เพิ่มข้อมูล
INSERT INTO Suppliers (name, contact_person, phone_number) 
VALUES ('Farm Fresh', 'Somchai', '081-234-5678');

-- ดึงข้อมูลพร้อมเงื่อนไขและการเรียงลำดับ
SELECT name, price 
FROM MenuItems 
WHERE price > 50 
ORDER BY price DESC 
LIMIT 5;

-- แก้ไขข้อมูล
UPDATE Ingredients 
SET stock_level = stock_level + 10 
WHERE name = 'Milk';

-- ลบข้อมูล
DELETE FROM OrderItems WHERE quantity = 0;
```

---

## 2. ระดับกลาง (Intermediate SQL)

### 2.1 การเชื่อมตาราง (JOINs)
การดึงข้อมูลจากหลายตารางที่มีความสัมพันธ์กัน

- **INNER JOIN**: เอาข้อมูลที่ตรงกันทั้งสองฝั่ง
- **LEFT JOIN**: เอาข้อมูลฝั่งซ้ายทั้งหมด แม้ฝั่งขวาจะไม่มีข้อมูลที่ตรงกัน

```sql
-- ดูว่าวัตถุดิบแต่ละอย่างส่งโดย Supplier เจ้าไหน
SELECT i.name AS ingredient, s.name AS supplier
FROM Ingredients i
INNER JOIN Suppliers s ON i.supplier_id = s.supplier_id;
```

### 2.2 การจัดกลุ่มและคำนวณ (Aggregate Functions & Group By)
- `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- `GROUP BY`: จัดกลุ่มข้อมูล
- `HAVING`: กรองข้อมูลหลังจากจัดกลุ่มแล้ว (คล้าย WHERE แต่ใช้กับ Aggregate)

```sql
-- สรุปยอดขายรวมของพนักงานแต่ละคน
SELECT s.first_name, SUM(o.total_price) as total_sales
FROM Staff s
JOIN Orders o ON s.staff_id = o.staff_id
GROUP BY s.first_name
HAVING SUM(o.total_price) > 1000;
```

---

## 3. ระดับสูง (Advanced SQL)

### 3.1 Common Table Expressions (CTE) หรือ `WITH` clause
ช่วยให้ Query ที่ซับซ้อนอ่านง่ายขึ้น โดยการสร้างตารางเสมือนชั่วคราว

```sql
WITH TopSellingItems AS (
    SELECT item_id, SUM(quantity) as total_qty
    FROM OrderItems
    GROUP BY item_id
    HAVING SUM(quantity) > 10
)
SELECT m.name, t.total_qty
FROM MenuItems m
JOIN TopSellingItems t ON m.item_id = t.item_id;
```

### 3.2 Window Functions
การคำนวณที่อ้างอิงกับแถวอื่นๆ ในชุดข้อมูล โดยไม่ทำให้จำนวนแถวลดลง (ต่างจาก GROUP BY)
- `ROW_NUMBER()`, `RANK()`, `SUM() OVER()`

```sql
-- เรียงลำดับเมนูที่แพงที่สุดในแต่ละหมวดหมู่ (Category)
SELECT name, category, price,
       RANK() OVER(PARTITION BY category ORDER BY price DESC) as price_rank
FROM MenuItems;
```

### 3.3 การจัดการ Performance (Indexing)
การสร้าง Index ช่วยให้ค้นหาข้อมูลได้เร็วขึ้นอย่างมากในตารางที่มีข้อมูลจำนวนมาก

```sql
-- สร้าง Index สำหรับชื่อเมนูเพราะมีการค้นหาบ่อย
CREATE INDEX idx_menu_items_name ON MenuItems(name);

-- ตรวจสอบประสิทธิภาพการทำงานของ Query
EXPLAIN ANALYZE SELECT * FROM MenuItems WHERE name = 'Green Tea';
```

### 3.4 Transactions (ACID)
เพื่อให้มั่นใจว่าชุดของคำสั่ง SQL จะทำงานสำเร็จทั้งหมด หรือไม่สำเร็จเลย (Rollback) เพื่อป้องกันข้อมูลผิดพลาด

```sql
BEGIN;
    UPDATE Ingredients SET stock_level = stock_level - 1 WHERE ingredient_id = 1;
    INSERT INTO Orders (total_price, staff_id) VALUES (50, 1);
COMMIT; -- หรือใช้ ROLLBACK; หากเกิดข้อผิดพลาด
```

---

## 4. เคล็ดลับเพิ่มเติม (PostgreSQL Specific)
- **DISTINCT ON**: เลือกแถวแรกที่ไม่ซ้ำกันตามคอลัมน์ที่กำหนด (เฉพาะ Postgres)
- **JSONB**: จัดเก็บข้อมูลรูปแบบ JSON ที่สามารถทำ Index ได้
- **Views**: สร้าง Virtual Table จาก Query ที่ใช้บ่อยเพื่อความสะดวก

```sql
-- การสร้าง View สำหรับรายงานยอดขายรายวัน
CREATE VIEW DailySalesReport AS
SELECT order_date::DATE, SUM(total_price)
FROM Orders
GROUP BY order_date::DATE;
```
