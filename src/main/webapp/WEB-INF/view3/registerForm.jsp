<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <link rel="icon" href="static/images/logo.png" type="image/png">
    <!-- CSS Imports -->
    <link rel="stylesheet" href="static/css/styles.css">
    <link rel="stylesheet" href="static/css/auth-styles.css">
    <link rel="stylesheet" href="static/css/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .error-message {
            color: red;
            font-size: 0.8em;
            margin-top: 5px;
            display: none;
        }
        .input-field {
            margin-bottom: 15px;
            position: relative;
        }
        .invalid-input {
            border: 1px solid red !important;
        }
        .valid-input {
            border: 1px solid green !important;
        }
        .password-field {
            position: relative;
            display: flex;
            align-items: center;
        }
        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
            z-index: 1;
            background: white;
            padding: 5px;
        }
        .register-button:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }
        .register-button.enabled {
            background-color: #007bff;
            cursor: pointer;
        }
        .form-control {
            width: 100%;
            padding-right: 35px; /* Make space for the eye icon */
        }
    </style>
</head>
<body>
    <jsp:include page="include/navbar.jsp"/>
    <div class="register-card">
        <h2>Register</h2> <br>
        <f:form action="register_user" modelAttribute="command" id="registrationForm" onsubmit="return validateForm()">
            <div class="input-field">
                <label for="name">Name</label>
                <f:input path="user.name" id="name" cssClass="form-control" oninput="validateField('name')"/>
                <div id="nameError" class="error-message"></div>
            </div>

            <div class="input-field">
                <label for="phone">Phone</label>
                <f:input path="user.phone" id="phone" oninput="validateField('phone')"/>
                <div id="phoneError" class="error-message"></div>
            </div>

            <div class="input-field">
                <label for="email">Email</label>
                <f:input path="user.email" id="email" cssClass="form-control" oninput="validateField('email')"/>
                <div id="emailError" class="error-message"></div>
            </div>

            <div class="input-field">
                <label for="address">Address</label>
                <f:textarea path="user.address" id="address" cssClass="form-control" rows="4" />
            </div>

            <div class="input-field">
                <label for="id_username">Username</label>
                <f:input path="user.loginName" id="id_username" cssClass="form-control" oninput="validateField('username')"/>
                <div id="id_usernameError" class="error-message"></div>
                <div id="id_res_div"></div>
            </div>

            <div class="input-field">
                <label for="password">Password</label>
                <div class="password-field">
                    <f:password path="user.password" id="password" cssClass="form-control" oninput="validateField('password')"/>
                    <i class="password-toggle fas fa-eye" id="togglePassword" onclick="togglePasswordVisibility('password')"></i>
                </div>
                <div id="passwordError" class="error-message"></div>
            </div>

            <div class="input-field">
                <label for="confirmPassword">Confirm Password</label>
                <div class="password-field">
                    <input type="password" id="confirmPassword" class="form-control" oninput="validateField('confirmPassword')"/>
                    <i class="password-toggle fas fa-eye" id="toggleConfirmPassword" onclick="togglePasswordVisibility('confirmPassword')"></i>
                </div>
                <div id="confirmPasswordError" class="error-message"></div>
            </div>

            <div class="input-field">
                <label for="panNumber">Pan Card Number</label>
                <f:input path="user.panNumber" id="panNumber" cssClass="form-control" oninput="validateField('panNumber')"/>
                <div id="panNumberError" class="error-message"></div>
            </div>

            <button type="submit" class="register-button" id="submitButton" disabled>Register</button>
        </f:form>
    </div>

    <script>
        let validations = {
            name: null,
            phone: null,
            email: null,
            username: null,
            password: null,
            confirmPassword: null,
            panNumber: null
        };

        let touched = {
            name: false,
            phone: false,
            email: false,
            username: false,
            password: false,
            confirmPassword: false,
            panNumber: false
        };

        function updateSubmitButton() {
            const submitButton = document.getElementById('submitButton');
            const allValid = Object.values(validations).every(value => value === true);
            submitButton.disabled = !allValid;
            submitButton.className = `register-button ${allValid ? 'enabled' : ''}`;
        }

        function showError(elementId, message) {
            const errorElement = document.getElementById(elementId);
            const inputId = elementId.replace('Error', '');
            const inputElement = document.getElementById(inputId);

            if (errorElement && inputElement) {
                errorElement.style.display = 'block';
                errorElement.textContent = message;
                inputElement.classList.remove('valid-input');
                inputElement.classList.add('invalid-input');
            }
        }

        function showSuccess(elementId) {
            const errorElement = document.getElementById(elementId);
            const inputId = elementId.replace('Error', '');
            const inputElement = document.getElementById(inputId);

            if (errorElement && inputElement) {
                errorElement.style.display = 'none';
                inputElement.classList.remove('invalid-input');
                inputElement.classList.add('valid-input');
            }
        }

        function clearValidation(elementId) {
            const errorElement = document.getElementById(elementId);
            const inputId = elementId.replace('Error', '');
            const inputElement = document.getElementById(inputId);

            if (errorElement && inputElement) {
                errorElement.style.display = 'none';
                inputElement.classList.remove('invalid-input');
                inputElement.classList.remove('valid-input');
            }
        }

        function togglePasswordVisibility(fieldId) {
            const passwordField = document.getElementById(fieldId);
            const toggleIcon = document.getElementById(`toggle${fieldId.charAt(0).toUpperCase() + fieldId.slice(1)}`);

            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }

        function validateField(fieldName) {
            touched[fieldName] = true;

            switch(fieldName) {
                case 'name':
                    validateName();
                    break;
                case 'phone':
                    validatePhone();
                    break;
                case 'email':
                    validateEmail();
                    break;
                case 'username':
                    validateUsername();
                    break;
                case 'password':
                    validatePassword();
                    break;
                case 'confirmPassword':
                    validateConfirmPassword();
                    break;
                case 'panNumber':
                    validatePanNumber();
                    break;
            }
        }

        function validateName() {
            const name = document.getElementById('name').value;
            if (!touched.name && name === '') {
                clearValidation('nameError');
                validations.name = null;
                return;
            }
            if (name.length < 5 || name.length > 20) {
                showError('nameError', 'Name must be between 5 and 20 characters');
                validations.name = false;
            } else {
                showSuccess('nameError');
                validations.name = true;
            }
            updateSubmitButton();
        }

        function validatePhone() {
            const phone = document.getElementById('phone').value;
            if (!touched.phone && phone === '') {
                clearValidation('phoneError');
                validations.phone = null;
                return;
            }
            const phoneRegex = /^[0-9]{10}$/;
            if (!phoneRegex.test(phone)) {
                showError('phoneError', 'Please enter a valid 10-digit phone number');
                validations.phone = false;
            } else {
                showSuccess('phoneError');
                validations.phone = true;
            }
            updateSubmitButton();
        }

        function validateEmail() {
            const email = document.getElementById('email').value;
            if (!touched.email && email === '') {
                clearValidation('emailError');
                validations.email = null;
                return;
            }
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                showError('emailError', 'Please enter a valid email address');
                validations.email = false;
            } else {
                showSuccess('emailError');
                validations.email = true;
            }
            updateSubmitButton();
        }

        function validateUsername() {
            const username = document.getElementById('id_username').value;
            if (!touched.username && username === '') {
                clearValidation('id_usernameError');
                validations.username = null;
                return;
            }
            if (username.length < 4) {
                showError('id_usernameError', 'Username must be at least 4 characters long');
                validations.username = false;
            } else {
                showSuccess('id_usernameError');
                validations.username = true;
            }
            updateSubmitButton();
        }

        function validatePassword() {
            const password = document.getElementById('password').value;
            if (!touched.password && password === '') {
                clearValidation('passwordError');
                validations.password = null;
                return;
            }
            const passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

            if (!passwordRegex.test(password)) {
                showError('passwordError',
                    'Password must contain at least 8 characters, including uppercase, lowercase, number and special character');
                validations.password = false;
            } else {
                showSuccess('passwordError');
                validations.password = true;
            }
            if (touched.confirmPassword) {
                validateConfirmPassword();
            }
            updateSubmitButton();
        }

        function validateConfirmPassword() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (!touched.confirmPassword && confirmPassword === '') {
                clearValidation('confirmPasswordError');
                validations.confirmPassword = null;
                return;
            }
            if (password !== confirmPassword) {
                showError('confirmPasswordError', 'Passwords do not match');
                validations.confirmPassword = false;
            } else {
                showSuccess('confirmPasswordError');
                validations.confirmPassword = true;
            }
            updateSubmitButton();
        }

        function validatePanNumber() {
            const pan = document.getElementById('panNumber').value.toUpperCase();
            if (!touched.panNumber && pan === '') {
                clearValidation('panNumberError');
                validations.panNumber = null;
                return;
            }
            document.getElementById('panNumber').value = pan;
            const panRegex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;

            if (!panRegex.test(pan)) {
                showError('panNumberError', 'Please enter a valid PAN number (e.g., ABCDE1234F)');
                validations.panNumber = false;
            } else {
                showSuccess('panNumberError');
                validations.panNumber = true;
            }
            updateSubmitButton();
        }

        function validateForm() {
            // Trigger validation for all untouched fields
            Object.keys(touched).forEach(field => {
                if (!touched[field]) {
                    touched[field] = true;
                    validateField(field);
                }
            });
            return Object.values(validations).every(value => value === true);
        }
    </script>
</body>
</html>