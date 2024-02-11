const express = require('express');
const { get_current_kurs_ids, get_current_kurse } = require('../helper-functions/course');
const router = express.Router();

//Get Courses Page
router.get('/kurse', async (req, res) => {
  const current_user_id = req.session.user.user_id;
  const kurs_ids = await get_current_kurs_ids(current_user_id);
  const kurse = await get_current_kurse(kurs_ids);    
  res.render('kurse', { kursData: kurse, pageTitle: "Kurse", loggedInUserId: req.session.user.user_id });          
});

module.exports = router;