const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');

const pool = require('../db'); //Database connection

//Get Profil Page
router.get('/profil', async (req, res) => {
  var userData = req.session.user;
  const connection = await pool.getConnection();

  var [courseData] = await connection.query('SELECT k.bezeichnung, k.anz_der_klausuren, exp FROM kurs AS k INNER JOIN klasse_kurs AS kk ON k.kurs_id = kk.kurs_id INNER JOIN klasse AS kl ON kl.klasse_id = kk.klasse_id INNER JOIN benutzer_kurs AS bk ON k.kurs_id = bk.kurs_id WHERE bk.user_id = ?;', [userData.user_id]);

  res.render('profil', { pageTitle: "Profil", user: userData, courses: courseData });
});

// Post updates of the userdata
router.post('/profil', async (req, res) => {
  userData = req.body;

  if (userData.password !== '') {
    try {
      const connection = await pool.getConnection();
      const [user] = await connection.query('SELECT * FROM benutzer WHERE username = ?', [userData.username]);
      const [grade] = await connection.query('SELECT * FROM klasse WHERE klasse_id = ?', [user[0].klasse_id]);

      if (!user || !bcrypt.compareSync(userData.password, user[0].passwort)) {
        // Authentication failed
        res.status(500).json({ message: 'Internal Server Error', passwordMissingOrIncorrect: true});
      } else {
        if (userData.newUserName !== '' && userData.newPassword === '') {
          //console.log("Changing Username %s to %s", userData.username, userData.newUserName);
          const [result] = await connection.query('UPDATE benutzer SET username = \'' + userData.newUserName + '\' WHERE user_id = ?', [user[0].user_id]);
          connection.release();
          
          //Update the session User
          req.session.user = {
            user_id: user[0].user_id,
            username: userData.newUserName,
            firstname: user[0].vorname,
            lastname: user[0].name,
            grade: grade[0].bezeichnung,
            teacher: grade[0].klassenlehrer,
            role: user[0].rolle,
          }

          res.send(
            { 
              username: req.session.user.username,
              passwordMissingOrIncorrect: false
            });
        } 
        
        else if (userData.newUserName === '' && userData.newPassword !== '') {
          //console.log("Changing Password %s to %s", userData.password, userData.newPassword);
          var newPasswd = await bcrypt.hash(userData.newPassword, 12);
          const [result] = await connection.query('UPDATE benutzer SET passwort = \'' + newPasswd + '\' WHERE user_id = ?', [user[0].user_id]);
          connection.release();
          res.send(
            { 
              username: '',
              passwordMissingOrIncorrect: false
            });
        } 
        
        else {
          //console.log("Changing Username %s to %s and Password %s to %s", userData.username, userData.newUserName, userData.password, userData.newPassword);
          var newPasswd = await bcrypt.hash(userData.newPassword, 12);
          const [result] = await connection.query('UPDATE benutzer SET username = \'' + userData.newUserName 
          + ', passwort = \'' + newPasswd + '\' WHERE user_id = ?', [user[0].user_id]);
          connection.release();
          
          //Update the session User
          req.session.user = {
            user_id: user[0].user_id,
            username: userData.newUserName,
            firstname: user[0].vorname,
            lastname: user[0].name,
            grade: grade[0].bezeichnung,
            teacher: grade[0].klassenlehrer,
            role: user[0].rolle,
          }

          res.send(
            { 
              username: req.session.user.username,
              passwordMissingOrIncorrect: false
            });
        }
        //var [changedUserData] = connection.query();
      }
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal Server Error' });
    }
  } else {
    res.status(500).json({ message: 'Internal Server Error' });
  }

});

module.exports = router;