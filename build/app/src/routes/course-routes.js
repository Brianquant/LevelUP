const express = require('express');
const { get_current_course_ids, get_current_courses } = require('../helper-functions/course');
const router = express.Router();

//Get Courses Page
router.get('/course', async (req, res) => {
  const current_user_id = req.session.user.user_id;
  const course_ids = await get_current_course_ids(current_user_id);
  const course = await get_current_courses(course_ids);
  res.render('course', { kursData: course, pageTitle: "Course", loggedInUserId: req.session.user.user_id });          
});

module.exports = router;