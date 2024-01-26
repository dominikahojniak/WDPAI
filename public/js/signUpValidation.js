const form = document.querySelector("form");
const emailInput = form.querySelector('input[name="email"]');
const passwordInput = form.querySelector('input[name="password"]');
const phoneInput = form.querySelector('input[name="phone"]');
const nameInput = form.querySelector('input[name="name"]');
function isEmail(email) {
    return /\S+@\S+\.\S+/.test(email);
}
function hasValidPassword(password) {
    const passwordRegex = /^(?=.*\d)(?=.*[A-Z]).{8,}$/;
    return passwordRegex.test(password);
}
function hasValidPhone(phone) {
    const phoneRegex = /^\d{9}$/;
    return phoneRegex.test(phone);
}
function hasValidName(value) {
    return /^[A-Za-z]+$/.test(value);
}
function markValidation(element, condition) {
    !condition ? element.classList.add('no-valid') : element.classList.remove('no-valid');
}
function validateEmail() {
    setTimeout(function () {
            markValidation(emailInput, isEmail(emailInput.value));
        },
        1000
    );
}
function validatePassword() {
    setTimeout(function () {
        markValidation(passwordInput, hasValidPassword(passwordInput.value));
    }, 1000);
}
function validatePhone() {
    setTimeout(function () {
        markValidation(phoneInput, hasValidPhone(phoneInput.value));
    }, 1000);
}
function validateName() {
    setTimeout(function () {
        markValidation(nameInput, hasValidName(nameInput.value));
    }, 1000);
}
emailInput.addEventListener('keyup', validateEmail);
passwordInput.addEventListener('keyup', validatePassword);
phoneInput.addEventListener('keyup', validatePhone);
nameInput.addEventListener('keyup', validateName);

function validateForm() {
    const validations = [
        isEmail(emailInput.value),
        hasValidPassword(passwordInput.value),
        hasValidPhone(phoneInput.value),
        hasValidName(nameInput.value)
    ];

    return validations;
}

function showAlert(message) {
    alert(message);
}

function handleSignUpButtonClick(event) {
    const formValidations = validateForm();
    const isFormValid = formValidations.every(validation => validation);

    if (!isFormValid) {
        event.preventDefault();
        showAlert("Please fill in all fields correctly.");
    }
}
const signUpButton = form.querySelector('button[id="signup-button"]');
signUpButton.addEventListener('click', handleSignUpButtonClick);