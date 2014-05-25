function passwordValidation(input) {
    //if (input.value.length != 0) {
        if (input.value.length < 6) {
            input.setCustomValidity('Password Baru harus 6 karakter atau lebih.');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
   // }
}

function confirmPassword(input) {
    if (input.value != document.getElementById('newPassword1').value) {
        input.setCustomValidity('Harus sama dengan Password baru.');
    } else {
        // input is valid -- reset the error message
        input.setCustomValidity('');
    }
}