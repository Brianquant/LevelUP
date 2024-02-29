const express = require('express');
var moment = require('moment');
const router = express.Router();

const pool = require('../db'); //Database connection

//Get Profil Page
router.get('/', async (req, res) => {
  var userData = req.session.user;
  const connection = await pool.getConnection();

  var [courseData] = await connection.query('SELECT k.kurs_id, k.bezeichnung FROM kurs AS k INNER JOIN benutzer_kurs AS bk ON k.kurs_id = bk.kurs_id WHERE bk.user_id = ? LIMIT 3;', [userData.user_id]);
  var [attendanceData] = await connection.query('SELECT * FROM verspaetung WHERE user_id = ?', [userData.user_id]);
  const formattedResults = attendanceData.map(row => ({
    uhrzeit: moment(row.zeitpunkt).format('hh:mm'),
    datum: moment(row.zeitpunkt).format('DD.MM.YYYY'),
    id: row.user_id,
    entschuldigt: row.entschuldigt
  }));
  res.render('index', { course: courseData, attendance: formattedResults, pageTitle: "Home", loggedInUserId: req.session.user.user_id });
});

// Home route
router.post('/', async (req, res) => {

});

module.exports = router;