document.addEventListener('DOMContentLoaded', function () {
    var form = document.querySelector('form');
    form.addEventListener('submit', function (event) {
        event.preventDefault();
        var password = document.getElementById('passwordSignup');
        var passwordChek = document.getElementById('passwordCheckSignup');
        if (password.value != passwordChek.value) {
            alert('Passwörter stimmen nicht überein');
        } else {
            form.submit();
        }
    });
});