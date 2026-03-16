# Chrome Burger MongoDB Project

This project contains a series of MongoDB playground scripts used to define the schema, seed mock data, and perform initial queries for a restaurant management system called "Chrome Burger".

## Project Overview

- **Database Name:** `chrome_burger`
- **Technology:** MongoDB, JavaScript (MongoDB Playground)
- **Core Collections:**
  - `suppliers`: Details about ingredient providers.
  - `staff`: Information about employees (Cashiers, Cooks).
  - `ingredients`: Raw materials with stock levels and supplier links.
  - `menu_items`: Products for sale, including embedded recipes.
  - `orders`: Customer transactions with embedded menu items and staff references.

## Schema & Data Relationships

The project demonstrates several MongoDB data modeling patterns:
- **Referencing (Manual IDs):** Hardcoded `ObjectId` values are used across scripts to maintain relationships between suppliers and ingredients, staff and orders, etc.
- **Embedding:** Recipes are embedded within `menu_items`, and purchased items are embedded within `orders`.
- **Aggregation:** Examples of `$lookup` and `$unwind` are used in `03_ingredients.mongodb.js` and `05_orders.mongodb.js` to join data across collections.

## Usage

### Prerequisites
- MongoDB Server (Local or Atlas)
- MongoDB VS Code Extension (Recommended) or `mongosh`

### Running the Scripts
These scripts are designed to be run as MongoDB Playgrounds.
1. Open any `.mongodb.js` file in VS Code.
2. Ensure you are connected to your MongoDB instance.
3. Click the "Play" icon (Execute All Documents) in the top-right corner of the editor.

The scripts follow a sequential setup:
1. `01_suppliers.mongodb.js`: Sets up suppliers.
2. `02_staff.mongodb.js`: Sets up staff.
3. `03_ingredients.mongodb.js`: Sets up ingredients (references suppliers).
4. `04_menu_items.mongodb.js`: Sets up menu items (references ingredients).
5. `05_orders.mongodb.js`: Sets up orders (references staff and menu items).

## Key Files
- `query.mongodb.js`: Placeholder for custom queries and data analysis.
- `mongodb-summary.md`: General documentation or summary of the database state.

## Development Conventions
- **Clean Slate:** Each script starts with `db.collection.deleteMany({})` to ensure a clean state before inserting mock data.
- **Consistency:** Use the `use('chrome_burger')` command at the top of every script to ensure the correct database context.
- **Mock Data:** Mock data uses standardized `ObjectId` patterns (e.g., `65f0...`, `65f1...`) to facilitate manual linking during development.
