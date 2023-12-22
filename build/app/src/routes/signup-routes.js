const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser');
const urlencodedParser = bodyParser.urlencoded({ extended: false })  

const pool = require('../db');

router.post('/signup', urlencodedParser, async (req, res) => {
    new_user = {
        firstname: req.body.firstname,
        lastname: req.body.lastname,
        grade: req.body.grade,
        password: await bcrypt.hash(req.body.password, 12),
    };
    
    //Create a database connection
    const connection = await pool.getConnection();

    // write user into database
    
    const [user] = await connection.query('INSERT INTO benutzer(name, vorname, passwort, klasse_id) VALUES(?, ?, ?, ?)', 
    [new_user.lastname], [new_user.firstname], [new_user.grade], [new_user.password]);

    // Close the connection
    connection.release();

    console.log(new_user);
});

module.exports = router;