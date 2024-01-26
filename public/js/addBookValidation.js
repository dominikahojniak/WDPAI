const form = document.querySelector("form");
const authorInput = form.querySelector('input[name="author"]');
const isbnInput = form.querySelector('input[name="ISBN"]');
const dateInput = form.querySelector('input[name="date"]');
const languageInput = form.querySelector('input[name="language"]');
const descriptionInput = form.querySelector('input[name="description"]');
function hasValidAuthor(value) {
    return /^[A-Za-ząćęłńóśźżĄĆĘŁŃÓŚŹŻ,.\s]+$/.test(value);
}
function hasValidISBN(value) {
    // Sprawdź, czy ISBN składa się tylko z cyfr i ma dokładnie 13 znaków
    return /^\d{13}$/.test(value);
}
function hasValidDate(value) {
    // Sprawdź, czy data ma poprawny format YYYY-MM-DD
    return /^\d{4}-\d{2}-\d{2}$/.test(value);
}
function hasValidLanguage(value) {
    // Sprawdź, czy język składa się tylko z liter
    return /^[A-Za-z]+$/.test(value);
}
function hasValidDescription(value) {
    return value.length <= 2000;
}
function markValidation(element, condition) {
    !condition ? element.classList.add('no-valid') : element.classList.remove('no-valid');
}
function validateAuthor() {
    setTimeout(function () {
        markValidation(authorInput, hasValidAuthor(authorInput.value));
    }, 1000);
}
function validateISBN() {
    setTimeout(function () {
        markValidation(isbnInput, hasValidISBN(isbnInput.value));
    }, 1000);
}
function validateDate() {
    setTimeout(function () {
        markValidation(dateInput, hasValidDate(dateInput.value));
    }, 1000);
}
function validateLanguage() {
    setTimeout(function () {
        markValidation(languageInput, hasValidLanguage(languageInput.value));
    }, 1000);
}
function validateDescription() {
    setTimeout(function () {
        markValidation(descriptionInput, hasValidDescription(descriptionInput.value));
    }, 1000);
}
function hasOptionsSelected(groupId) {
    const group = document.getElementById(groupId);
    const checkboxes = group.querySelectorAll('input[type="checkbox"]');
    return Array.from(checkboxes).some(checkbox => checkbox.checked);
}
authorInput.addEventListener('keyup', validateAuthor);
isbnInput.addEventListener('keyup', validateISBN);
dateInput.addEventListener('keyup', validateDate);
languageInput.addEventListener('keyup', validateLanguage);
descriptionInput.addEventListener('keyup', validateDescription);

function validateForm() {
    const validations = [
        hasValidAuthor(authorInput.value),
        hasValidISBN(isbnInput.value),
        hasValidDate(dateInput.value),
        hasValidLanguage(languageInput.value),
        hasValidDescription(descriptionInput.value),
        hasOptionsSelected('subscription-platforms'),
        hasOptionsSelected('purchase-platforms')
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
const signUpButton = form.querySelector('button[id="add-button"]');
signUpButton.addEventListener('click', handleSignUpButtonClick);