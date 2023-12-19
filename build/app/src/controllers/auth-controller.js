const requireLogin = (req, res, next) => {
    if (req.session && req.session.user) {
        // User is logged in
        return next();
    } else {
        // User is not logged in, redirect to login page
        res.redirect('/login');
    }
};

module.exports = {
    requireLogin,
};