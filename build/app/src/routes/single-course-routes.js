const express = require('express');
const router = express.Router();

const pool = require('../db'); //Database connection
//Get Profil Page
router.get('/single-course', async (req, res) => {
  const connection = await pool.getConnection();
  var userData = req.session.user;
  var [courseData] = await connection.query('SELECT k.kurs_id, k.bezeichnung, k.anz_der_klausuren, k.intro , bk.exp, kl.klassen_bezeichnung, kl.klassenlehrer FROM kurs AS k INNER JOIN klasse_kurs AS kk ON k.kurs_id = kk.kurs_id INNER JOIN klasse AS kl ON kl.klasse_id = kk.klasse_id INNER JOIN benutzer_kurs AS bk ON k.kurs_id = bk.kurs_id WHERE bk.user_id = ?;', [userData.user_id])
  res.render('single-course', {pageTitle: "Single-Course", user: userData, courses: courseData, query: req.query });
});

// Login route
router.post('/single-course', async (req, res) => {

});

module.exports = router;