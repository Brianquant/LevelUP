const express = require('express');
const router = express.Router();

const pool = require('../db'); //Database connection

//Get Profil Page
router.get('/', async (req, res) => {
  var userData = req.session.user;
  const connection = await pool.getConnection();

  var [homeData] = await connection.query('SELECT k.kurs_id, k.bezeichnung FROM kurs AS k INNER JOIN benutzer_kurs AS bk ON k.kurs_id = bk.kurs_id WHERE bk.user_id = ?;', [userData.user_id]);
  res.render('index', { home: homeData, pageTitle: "Home", loggedInUserId: req.session.user.user_id });
});

// Login route
router.post('/', async (req, res) => {

});

module.exports = router;