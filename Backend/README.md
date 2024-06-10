# Survey App Backend

This is the backend server for the Survey App project, built with Node.js, Express, and MySQL.

## Dependencies

This project uses the following dependencies:

- Express: Web framework for Node.js used to create the RESTful API endpoints.
- MySQL2: MySQL client for Node.js used to interact with the MySQL database.
- Cors: Middleware for Express to enable CORS (Cross-Origin Resource Sharing).

## Installation

1. Clone the repository:

git clone <repository-url>


2. Navigate to the backend directory:

cd backend


3. Install dependencies using npm:

npm install

or

npm i axios cors express


4. Set up the MySQL database:
   - Make sure MySQL server is running on your local machine.
    - Make Database With Name `survey_db`
   - Import the provided `survey_db.sql` file into your MySQL database. This will create the necessary tables and insert some sample data.

5. Update MySQL connection details:
   - Open `index.js` file in the backend directory.
   - Modify the `db` object to match your MySQL database connection details (host, user, password, database).

## Usage

1. Start the server:

node index.js

sql
Copy code

2. The server will start running on port 3000 by default. You can change the port in the `index.js` file if needed.

3. The backend server provides the following API endpoints:
   - `/api/questions`: GET request to fetch survey questions from the database.
   - `/api/options`: GET request to fetch options for each question from the database.
   - `/api/responses`: POST request to store user responses in the database.

4. Use a REST client like Postman or curl to interact with the API endpoints.