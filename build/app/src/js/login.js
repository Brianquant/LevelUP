document.addEventListener('DOMContentLoaded', function () {
    var form = document.querySelector('form');
    form.addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent the default form submission
        var username = document.getElementById('login-username').value;
        var password = document.getElementById('login-pwd').value;
        // Call your authentication function here
        authenticateUser(username, password);
    });

    function authenticateUser(username, password) {
        fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ username, password }),
        })
        .then(response => {
            if (response.ok) {
                // Authentication successful
                window.location.href = '/'; // Redirect to the index page
            } else {
                $('#login-username').addClass('is-invalid');
                $('#login-pwd').addClass('is-invalid');
                // Authentication failed
                return response.json();
            }
        })
        .catch(error => {
            console.error('Authentication failed:', error);
        });
    }
});