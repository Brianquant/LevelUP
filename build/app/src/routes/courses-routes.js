const express = require('express');
const router = express.Router();

const pool = require('../db'); //Database connection

//Get Courses overview Page
router.get('/courses', async (req, res) => {
  var userData = req.session.user;
  const connection = await pool.getConnection();
  var [courseData] = await connection.query('SELECT k.kurs_id, k.bezeichnung FROM kurs AS k INNER JOIN benutzer_kurs AS bk ON k.kurs_id = bk.kurs_id WHERE bk.user_id = ?;', [userData.user_id]);
  res.render('courses', { kursData: courseData, pageTitle: "Courses Overview", loggedInUserId: req.session.user.user_id });
});

// Course Overview route
router.post('/courses', async (req, res) => {

});

module.exports = router;