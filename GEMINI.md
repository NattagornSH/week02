# Workspace Overview: Week 02 Database Projects

This workspace contains multiple database-related projects and assignments focused on both relational (PostgreSQL) and non-relational (MongoDB) database design and implementation.

## Projects and Subdirectories

### 1. [01_my-ecommerce](./01_my-ecommerce/)
- **Focus:** Planning and design for a specialized Japanese green tea e-commerce platform.
- **Key Concepts:** Problem statement, solution analysis, business model canvas, use case diagrams, and ER diagrams.
- **Main Files:**
  - `01_my-ecommerce.md`: Project overview and solution.
  - `05_product-backlog.md`: List of features and user stories.
  - `06_bring-it-to-javascript.js`: Initial JavaScript data structure prototype.
  - `GEMINI.md`: Detailed documentation for this sub-project.

### 2. [02_postgresql](./02_postgresql/)
- **Focus:** Relational database implementation for "Greentea" cafe/restaurant.
- **Key Concepts:** PostgreSQL schema design, join tables, and relational queries.
- **Main Files:**
  - `create-tables.sql`: SQL script to create the database schema (Suppliers, Staff, Ingredients, MenuItems, RecipeItems, Orders, OrderItems).
  - `01_suppliers.sql` to `07_order_items.sql`: Individual scripts for data insertion.
  - `query.sql`: Sample queries for the database.
  - `screenshot/`: Visual confirmations of the database implementation.

### 3. [03_mongodb-chrome-burger](./03_mongodb-chrome-burger/)
- **Focus:** Non-relational database implementation for "Chrome Burger" using MongoDB.
- **Key Concepts:** NoSQL document structure, CRUD operations in MongoDB, and schema-less design.
- **Main Files:**
  - `01_suppliers.mongodb.js` to `05_orders.mongodb.js`: MongoDB scripts for database setup and data population.
  - `query.mongodb.js`: Sample queries for the MongoDB collections.
  - `mongodb-summary.md`: Overview of the MongoDB implementation.

## Technology Stack
- **Databases:** PostgreSQL, MongoDB.
- **Languages:** SQL, JavaScript (Node.js/MongoDB Shell).
- **Tools:** Excalidraw (for diagrams), Markdown.

## How to Use This Workspace
1. **Explore Planning:** Start with `01_my-ecommerce` to understand the conceptual design phase of a project.
2. **PostgreSQL Implementation:** Navigate to `02_postgresql` and its subfolder `greentea-postgresql` to see a full relational database setup.
3. **MongoDB Implementation:** Navigate to `03_mongodb-chrome-burger` to see how a similar domain can be implemented using a NoSQL approach.

## Future Development
- Integrate the e-commerce planning with an actual backend implementation.
- Expand the "Greentea" and "Chrome Burger" projects with more complex queries and possibly a REST API interface.
