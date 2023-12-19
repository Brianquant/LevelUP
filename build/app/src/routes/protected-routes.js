const express = require('express');
const router = express.Router();
const { isAuthenticated } = require('../middleware/auth-middleware');

router.get('/protected-resource', isAuthenticated, (req, res) => {
    res.json({ message: 'This is a protected resource' });
});

module.exports = router;