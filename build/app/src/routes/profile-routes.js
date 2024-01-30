const express = require('express');
const router = express.Router();

const pool = require('../db'); //Database connection

//Get Profil Page
router.get('/profil', async (req, res) => {
  var userData = req.session.user;
  const connection = await pool.getConnection();

  var [courseData] = await connection.query('SELECT k.bezeichnung, k.anz_der_klausuren, exp FROM kurs AS k INNER JOIN klasse_kurs AS kk ON k.kurs_id = kk.kurs_id INNER JOIN klasse AS kl ON kl.klasse_id = kk.klasse_id INNER JOIN benutzer_kurs AS bk ON k.kurs_id = bk.kurs_id WHERE bk.user_id = ?;', [userData.user_id]);
  
  res.render('profil', {pageTitle: "Profil", user: userData, courses: courseData});
});

// Login route
router.post('/profil', async (req, res) => {

});

module.exports = router;