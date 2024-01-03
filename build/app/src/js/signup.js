document.addEventListener('DOMContentLoaded', function () {    
    (function () {
        'use strict'
        
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {

                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated');

                let password=$('#passwordSignup').val();
                let confirm_password=$('#passwordCheckSignup').val();
    
                if(confirm_password===password)
                {
                    $('#passwordSignup').removeClass('is-invalid');
                    $('#passwordSignup').addClass('is-valid');
                    $('#passwordCheckSignup').removeClass('is-valid');
                    $('#passwordCheckSignup').addClass('is-valid');
                }
                else{
                    event.preventDefault();
                    form.classList.remove('was-validated');
                    $('#passwordSignup').removeClass('is-valid');
                    $('#passwordSignup').addClass('is-invalid');
                    $('#passwordCheckSignup').removeClass('is-valid');
                    $('#passwordCheckSignup').addClass('is-invalid');
                }
            }, false)
        })
    })()
});