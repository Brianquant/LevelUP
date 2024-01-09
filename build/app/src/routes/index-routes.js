const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth-middleware');

router.get('/', auth.isAuthenticated, (req, res, next) => {
    res.render('index', {pageTitle: 'Home'});
});
