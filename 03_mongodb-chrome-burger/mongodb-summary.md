# สรุปการใช้งาน MongoDB แบบละเอียด (Comprehensive Guide)

เอกสารนี้รวบรวมเนื้อหาสำคัญของ MongoDB ตั้งแต่พื้นฐานไปจนถึงระดับสูง เพื่อใช้สำหรับทบทวนและอ้างอิงในการพัฒนาโปรเจกต์

---

## 1. แนวคิดพื้นฐาน (Core Concepts)
MongoDB เป็นฐานข้อมูลประเภท **NoSQL** แบบ **Document-oriented** ซึ่งมีความแตกต่างจาก Relational Database (SQL) ดังนี้:

| SQL Concepts | MongoDB Concepts | คำอธิบาย |
| :--- | :--- | :--- |
| Database | Database | ฐานข้อมูลระดับบนสุด |
| Table | Collection | กลุ่มของ Document |
| Row | Document | ข้อมูล 1 รายการ (BSON) |
| Column | Field | คู่ Key-Value ภายใน Document |
| Primary Key | _id | Unique Key อัตโนมัติ (ObjectId) |
| Join | Aggregation ($lookup) | การเชื่อมโยงข้อมูลข้าม Collection |

---

## 2. ประเภทข้อมูล (BSON Data Types)
MongoDB เก็บข้อมูลในรูปแบบ **BSON** (Binary JSON) ซึ่งรองรับประเภทข้อมูลมากกว่า JSON ปกติ:
- **String:** ข้อความ (UTF-8)
- **Integer:** ตัวเลขจำนวนเต็ม (32-bit หรือ 64-bit)
- **Double:** ตัวเลขทศนิยม
- **Boolean:** ค่าจริง/เท็จ (`true`/`false`)
- **Date:** เก็บวันที่และเวลา (ISO Date)
- **ObjectId:** ID เฉพาะของ Document (12-byte)
- **Array:** รายการข้อมูลหลายตัวในฟิลด์เดียว `[1, 2, 3]`
- **Object/Embedded Document:** ข้อมูลซ้อนข้อมูล `{ address: { city: "BKK" } }`
- **Null:** ค่าว่าง

---

## 3. การจัดการข้อมูล (CRUD Operations)

### **Create (การเพิ่มข้อมูล)**
```javascript
db.collection.insertOne({ name: "Jay" }); // เพิ่ม 1 รายการ
db.collection.insertMany([{ name: "A" }, { name: "B" }]); // เพิ่มหลายรายการ
```

### **Read (การค้นหา)**
- **Query Operators:**
  - `$eq`: เท่ากับ
  - `$ne`: ไม่เท่ากับ
  - `$gt` / `$gte`: มากกว่า / มากกว่าหรือเท่ากับ
  - `$lt` / `$lte`: น้อยกว่า / น้อยกว่าหรือเท่ากับ
  - `$in`: อยู่ในกลุ่มรายการ `city: { $in: ["BKK", "CNX"] }`
  - `$or` / `$and`: เงื่อนไขทางตรรกะ

```javascript
// ค้นหาเมนูที่ราคามากกว่า 10 และอยู่ในหมวด Burgers
db.menu_items.find({
  price: { $gt: 10 },
  category: "Burgers"
});
```

### **Update (การแก้ไข)**
- `$set`: เปลี่ยนค่าฟิลด์
- `$unset`: ลบฟิลด์ออก
- `$inc`: เพิ่ม/ลด ค่าตัวเลข
- `$push`: เพิ่มข้อมูลลงใน Array

```javascript
db.staff.updateOne(
  { first_name: "Jane" },
  { $set: { role: "Manager" } }
);
```

### **Delete (การลบ)**
```javascript
db.collection.deleteOne({ _id: ObjectId("...") });
db.collection.deleteMany({ status: "inactive" });
```

---

## 4. การออกแบบโครงสร้างข้อมูล (Data Modeling)

### **Embedding (การฝัง)**
เก็บข้อมูลที่เกี่ยวข้องกันไว้ใน Document เดียวกัน
- **เหมาะสำหรับ:** ข้อมูลแบบ 1-to-1 หรือ 1-to-Many ขนาดเล็ก
- **ข้อดี:** อ่านข้อมูลเสร็จในครั้งเดียว (High Performance)

### **Referencing (การอ้างอิง)**
เก็บเฉพาะ ID เพื่ออ้างอิงไปยังอีก Collection หนึ่ง
- **เหมาะสำหรับ:** ข้อมูลที่มีความสัมพันธ์แบบ Many-to-Many หรือข้อมูลที่มีขนาดใหญ่มาก
- **ข้อดี:** ข้อมูลไม่ซ้ำซ้อน (Normalized), จัดการข้อมูลง่ายกว่าเมื่อมีการแก้ไขบ่อย

---

## 5. การใช้ Aggregation Framework (Advance Query)
ทำงานเป็นลำดับขั้นตอน (Pipeline Stages):

1.  **$match:** กรองข้อมูล (เหมือน WHERE)
2.  **$project:** เลือกเฉพาะฟิลด์ที่ต้องการ (เหมือน SELECT)
3.  **$group:** จัดกลุ่มข้อมูล (เหมือน GROUP BY) พร้อมคำนวณ เช่น `$sum`, `$avg`
4.  **$sort:** เรียงลำดับข้อมูล (1: น้อยไปมาก, -1: มากไปน้อย)
5.  **$lookup:** เชื่อมข้อมูลจาก Collection อื่น (เหมือน LEFT OUTER JOIN)
6.  **$unwind:** แผ่ข้อมูลจาก Array ออกเป็นรายการย่อย

**ตัวอย่าง Pipeline:**
```javascript
db.orders.aggregate([
  { $match: { total_price: { $gt: 15 } } }, // 1. กรองยอดซื้อ > 15
  { $lookup: {                             // 2. ดึงข้อมูลพนักงาน
      from: "staff",
      localField: "staff_id",
      foreignField: "_id",
      as: "staff_details"
  }},
  { $unwind: "$staff_details" },           // 3. แผ่ Object พนักงานออก
  { $project: {                            // 4. เลือกฟิลด์ที่จะแสดง
      order_date: 1,
      total_price: 1,
      staff_name: "$staff_details.first_name"
  }}
]);
```

---

## 6. ข้อควรจำและ Best Practices
- **Indexing:** อย่าลืมสร้าง Index ในฟิลด์ที่ใช้ค้นหาบ่อยๆ เพื่อความเร็ว
- **Schema Design:** ออกแบบโดยยึด "วิธีการใช้งานข้อมูล" (Application-Driven) เป็นหลัก
- **Security:** ไม่เก็บ Password เป็นข้อความธรรมดา (ควร Hash) และระวังการเข้าถึง Database โดยไม่มี Password
- **Consistency:** ในสคริปต์ Playground ควรใช้ `use('database_name')` เสมอ
