# Project Overview: MongoDB Sample Mflix Exercises

This project is a collection of MongoDB exercise scripts designed for practicing database queries. It appears to be part of a training course (jsd12 week 02) focused on the `sample_mflix` dataset, which includes collections for movies, comments, and other related cinema data.

## Main Technologies
- **MongoDB**: The primary database management system.
- **JavaScript (.mongodb.js)**: Scripts are written in the `.mongodb.js` format, which is optimized for the MongoDB VS Code extension.
- **sample_mflix Database**: A standard MongoDB sample dataset used for demonstration and practice.

## Directory Structure
The repository contains several exercise files:
- `exercise_01.mongodb.js` to `exercise_05.mongodb.js`: Progressive query exercises.
- `query.mongodb.js`: A scratchpad or general query file.

## Building and Running
These scripts are intended to be executed against a MongoDB instance (likely MongoDB Atlas or a local setup containing the `sample_mflix` database).

### Prerequisites
- [MongoDB VS Code Extension](https://marketplace.visualstudio.com/items?itemName=mongodb.mongodb-vscode) (Recommended)
- A running MongoDB instance with the `sample_mflix` dataset loaded.

### Running Scripts
1. Open a `.mongodb.js` file in VS Code.
2. Ensure you are connected to your MongoDB instance via the extension.
3. Click the "Play" button (Execute All Documents) in the top right of the editor, or use the command palette to run the script.
4. The results will appear in a separate "Playground Results" tab.

Alternatively, you can copy the queries and run them directly in `mongosh`.

## Development Conventions
- **Database Selection**: Scripts typically start with `use("sample_mflix");` to ensure they target the correct database.
- **Query Patterns**:
    - Use `db.collection.find({})` for fetching multiple documents.
    - Use `db.collection.findOne({})` for single document retrieval.
    - Use `ObjectId()` for matching `_id` fields.
    - Use `.sort()`, `.limit()`, and `.countDocuments()` for result manipulation and analysis.
- **Language**: Comments and explanations within some files are in Thai, reflecting the local educational context.
