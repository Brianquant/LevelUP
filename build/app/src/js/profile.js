var showButton = document.getElementById('profilBearbeitenDialogS');

$(document).ready(function ()  {
    var changeUserDataDialog = document.getElementById('chProfileDialog');
    var confirmPasswd = document.getElementById('newPwdConfimationDialog');
    var newUserName = document.getElementById('newNameDialog');
    var oldPasswd = document.getElementById('oldPwdDialog');
    var newPasswd = document.getElementById('newPwdDialog');
    var username = document.getElementById('username').innerHTML;

    $('#profilBearbeitenDialogS').on("click", function () {
        //Initialise the inputfields and clear the values
        newUserName.value = "";
        oldPasswd.value = "";
        newPasswd.value = "";
        confirmPasswd.value = "";

        //remove invalid fields if there where any
        $('#oldPwdDialog').removeClass('is-invalid');
        $('#newPwdDialog').removeClass('is-invalid');
        $('#newPwdConfimationDialog').removeClass('is-invalid');

        //Open the Dialog window
        changeUserDataDialog.showModal();

        changeUserDataDialog.addEventListener("keydown", function(event) {
            //console.log(event);
            if (event.keyCode === 13) {
                event.preventDefault();
                handleUserDataChanges(newUserName.value, oldPasswd.value, newPasswd.value);
            }
        });

        $('#confirmBtnDialog').on("click", function () {
            handleUserDataChanges(newUserName.value, oldPasswd.value, newPasswd.value);
        });

        $('#cancelButtonDialog').on("click", function () {
            changeUserDataDialog.close();
        });
    });

    async function changeUserData(newUserName, password, newPassword) {
        try {
            const response = await fetch('/profil', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({username, newUserName, password, newPassword}),
            });
            
            if (response.ok) {
                const data = await response.json();
                
                console.log("Authentication successful");
                $('#oldPwdDialog').removeClass('is-invalid');
                changeUserDataDialog.close();
                if (data.username !== '') {
                    document.getElementById('username').innerHTML = data.username;
                    username = data.username;
                }
                return true;
                
            } else {
                console.log("Authentication failed");
                $('#oldPwdDialog').addClass('is-invalid');
                return false;
            }
        } catch (error) {
            console.error('Authentication failed:', error);
            return false;
        }
    }

    function handleUserDataChanges(newUserName, password, newPassword) {
        //console.log(newPassword);
        if (newUserName == "" && password == "" && newPassword == "" && confirmPasswd.value == "") {
            changeUserDataDialog.close();
        }
        if (newPassword !== confirmPasswd.value) {
            $('#newPwdDialog').addClass('is-invalid');
            $('#newPwdConfimationDialog').addClass('is-invalid');
        } else {
            $('#newPwdDialog').removeClass('is-invalid');
            $('#newPwdConfimationDialog').removeClass('is-invalid');
            changeUserData(newUserName, password, newPassword);
        }
    }
});