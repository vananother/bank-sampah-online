function usernameValidation(input) {
    if (input.value.length < 4) {
        input.setCustomValidity('Username harus 4 karakter atau lebih.');
    } else {
        // input is valid -- reset the error message
        input.setCustomValidity('');
    }
}

function passwordValidation(input) {
    if (input.value.length < 6) {
        input.setCustomValidity('Password harus 6 karakter atau lebih.');
    } else {
        // input is valid -- reset the error message
        input.setCustomValidity('');
    }
}
function normalInputValidation(input) {
    if (input.value.length == 0) {
        input.setCustomValidity('Tidak boleh kosong.');
    } else {
        // input is valid -- reset the error message
        input.setCustomValidity('');
    }
}

function phoneValidation(input) {
    if (input.value.length == 0) {
        input.setCustomValidity('Tidak boleh kosong.');
    } else if (isNaN(input.value)) {
        input.setCustomValidity('Nomor telepon tidak valid.');
    } else {
        // input is valid -- reset the error message
        input.setCustomValidity('');
    }
}

function confirmPassword(input) {
    if (input.value != document.getElementById('password').value) {
        input.setCustomValidity('Harus sama dengan password.');
    } else {
        // input is valid -- reset the error message
        input.setCustomValidity('');
    }
}

function submitForm() {
    document.registerform.submit();
}

function jemputDropdown() {
    var kategori = document.getElementById("kategori");
    var s = document.getElementsByName("jenisSampah");
    var j = document.getElementById("jenisSampah");
    s.value = kategori.innerHTML;
}
