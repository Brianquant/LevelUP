const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');

const pool = require('../db'); //Database connection


router.get('/login', function(req, res) {
  res.render('login', {pageTitle: "Login"});
});

// Login route
router.post('/login', async (req, res) => {
  const { username, password } = req.body;
  //console.log(req.body);
  try {
    // Create a new connection
    const connection = await pool.getConnection();

    // Fetch user from the database
    const [user] = await connection.query('SELECT * FROM benutzer WHERE username = ?', [username]);
    //console.log(user);
    
    // Close the connection
    connection.release();

    if (!user || !bcrypt.compareSync(password, user[0].passwort)) {
      // Authentication failed
      res.status(401).json({ message: 'Invalid credentials' });
    } else {
      // Authentication successful
      // Set session data
      req.session.user = {
        user_id: user[0].user_id,
        username: user[0].username,
        firstname: user[0].vorname,
        lastname: user[0].name
      }
      //console.log('Session Data:', req.session);
      
      res.status(200).json({ message: 'Login successful' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Logout route
router.get('/logout', (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: 'Internal Server Error' });
    }
    //console.log('User successfully logged out');
    res.redirect('/login'); // Redirect to the login page or another page after logout
  });
});

module.exports = router;