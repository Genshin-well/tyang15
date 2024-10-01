// Import required modules
const express = require('express');
const cors = require('cors');
const mysql = require('mysql');

// Initialize the application and define the port
const app = express();
const port = 3000;

// Configure CORS to allow cross-origin requests
app.use(cors());

// Create a connection to the MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Yuweiyuan0.',
    database: 'crowdfunding_db'
});

// Start the server and listen on the specified port
app.listen(port, () => {
    console.log(`Running on port ${port}`);
});

// Route to fetch all active fundraisers
app.get('/fundraisers', (req, res) => {
    //filter the active users.
    const query = 'SELECT * FROM FUNDRAISER WHERE ACTIVE = 1';
    db.query(query, (err, results) => {
        if (err) return res.status(500).json({ error: err });
        res.json(results);
    });
});

// Route to search fundraisers by organizer, city, or category
app.get('/search', (req, res) => {
    const { organizer, city, category } = req.query;
    let preQuery = 'SELECT * FROM FUNDRAISER WHERE ACTIVE = 1';
    let filters = [];

    // Build the search conditions based on query parameters
    if (organizer) filters.push(`ORGANIZER LIKE '%${organizer}%'`);
    if (city) filters.push(`CITY LIKE '%${city}%'`);
    if (category) filters.push(`CATEGORY_ID = (SELECT CATEGORY_ID FROM CATEGORY WHERE NAME = '${category}')`);

    // Append conditions to the base query if any exist
    if (filters.length > 0) preQuery += ' AND ' + filters.join(' AND ');

    // Execute the query and return results
    db.query(preQuery, (err, results) => {
        if (err) return res.status(500).json({ error: err });
        res.json(results);
    });
});

// Route to get detailed information of a fundraiser by its ID
app.get('/fundraiser/:id', (req, res) => {
    const query = 'SELECT * FROM FUNDRAISER WHERE FUNDRAISER_ID = ?';
    db.query(query, [req.params.id], (err, results) => {
        if (err || results.length === 0) return res.status(404).json({ error: 'Not found' });
        res.json(results[0]);
    });
});


