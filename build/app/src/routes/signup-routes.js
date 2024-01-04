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
        username: req.body.firstname.slice(0, 9) + '_' + req.body.lastname.slice(0, 9),
        password: await bcrypt.hash(req.body.password, 12),
    };
    
    //Create a database connection
    const connection = await pool.getConnection();

    // write user into database
    const userCount = await connection.query('SELECT COUNT(*) AS count FROM benutzer WHERE name = ? AND vorname = ?', [new_user.lastname, new_user.firstname]);
    //console.log(new_user.username, userCount[0][0].count);

    if (userCount[0][0].count > 0) {
        const [user] = await connection.query('INSERT INTO benutzer(name, vorname, klasse_id, passwort, username) VALUES(?, ?, ?, ?, ?)', 
        [new_user.lastname, new_user.firstname, new_user.grade, new_user.password, new_user.firstname.slice(0, 9) + '_' + new_user.lastname.slice(0, 9) + userCount[0][0].count]);
    } else {
        const [user] = await connection.query('INSERT INTO benutzer(name, vorname, klasse_id, passwort, username) VALUES(?, ?, ?, ?, ?)', 
        [new_user.lastname, new_user.firstname, new_user.grade, new_user.password, new_user.username]);
    }

    // Close the connection
    connection.release();
    res.redirect('/login');
});

module.exports = router;