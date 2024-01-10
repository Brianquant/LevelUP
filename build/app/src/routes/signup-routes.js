const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser');
const urlencodedParser = bodyParser.urlencoded({ extended: false })  

const pool = require('../db');

router.get('/signup', (req, res) => {
    res.render('signup', {pageTitle: 'Registrieren'});
})

router.post('/signup', urlencodedParser, async (req, res) => {
    new_user = {
        firstname: req.body.firstname.toLowerCase(),
        lastname: req.body.lastname.toLowerCase(),
        grade: req.body.grade.toUpperCase(),
        username: req.body.firstname.slice(0, 9) + '_' + req.body.lastname.slice(0, 9),
        password: await bcrypt.hash(req.body.password, 12),
    };
    
    // Create a database connection
    const connection = await pool.getConnection();

    // Check if a user with the same name exists
    const [userCount] = await connection.query('SELECT COUNT(*) AS count FROM benutzer WHERE name = ? AND vorname = ?', [new_user.lastname, new_user.firstname]);
    //console.log(new_user.username, userCount[0].count);

    req.session.user = new_user;

    if (userCount[0].count > 0) {
        req.session.user.username = new_user.firstname.slice(0, 9) + '_' + new_user.lastname.slice(0, 9) + userCount[0].count;
    }

    req.session.user = {
        ...new_user,
        firstname: new_user.firstname.toLowerCase().replace(/\b\w/g, s => s.toUpperCase()),
        lastname: new_user.lastname.toLowerCase().replace(/\b\w/g, s => s.toUpperCase())
    };

    // Close the connection
    connection.release();
    res.redirect('/postsignup');
});

router.get('/postsignup', (req, res) => {
    res.render('postsignup', {pageTitle: 'Registrierung bestätigen'});
});

router.post('/postsignup', urlencodedParser, async (req, res) => {
    try {
        const secret = req.body.secret;
        const connection = await pool.getConnection();
        //console.log(req.session.user);

        const [gradeID] = await connection.query('SELECT klasse_id FROM klasse WHERE bezeichnung = ?', [req.session.user.grade]);

        const [grade] = await connection.query('SELECT * FROM klasse WHERE klasse_id = ?', [gradeID[0].klasse_id]);
        //console.log(secret, grade[0].secret);

        if(!grade || !bcrypt.compareSync(secret, grade[0].secret)) {
            res.status(401).json({ message: 'Invalid code' });
        } else {
            const [user] = await connection.query('INSERT INTO benutzer(name, vorname, klasse_id, passwort, username) VALUES(?, ?, ?, ?, ?)', 
            [req.session.user.lastname, req.session.user.firstname, gradeID[0].klasse_id, req.session.user.password, req.session.user.username]);

            connection.release();
            res.send("<script>alert(\"Your Account has been created successfully\"); window.location.href = \"/login\"; </script>");
        }
        
        //console.log(new_user.grade, gradeID[0].klasse_id);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
});

module.exports = router;