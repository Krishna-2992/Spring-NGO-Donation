<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Campaign</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .form-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            color: #ff6b6b;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 500;
        }

        .input {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .input:focus {
            outline: none;
            border-color: #ff6b6b;
        }

        textarea.input {
            resize: vertical;
            min-height: 120px;
        }

        button {
            background-color: #ff6b6b;
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 1rem;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #ff5252;
        }

        .error {
            color: #ff6b6b;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Create New Campaign</h2>
        <f:form action="addCampaign" method="POST">
            <div class="form-group">
                <label for="title">Campaign Title*</label>
                <f:input path="title" id="title" cssClass="input" placeholder="Enter campaign title"/>
            </div>

            <div class="form-group">
                <label for="description">Campaign Description*</label>
                <f:textarea path="description" id="description" cssClass="input"
                    placeholder="Enter campaign description"/>
            </div>

            <div class="form-group">
                <label for="targetAmount">Target Amount* ($)</label>
                <f:input path="targetAmount" id="targetAmount" cssClass="input"
                    type="number" min="1"
                    placeholder="Enter target amount"/>
            </div>

            <div class="form-group">
                <label for="endDate">End Date*</label>
                <f:input path="endDate" id="endDate" cssClass="input"
                    type="date"/>
            </div>

            <button type="submit">Create Campaign</button>
        </f:form>
    </div>

    <script>
        // Set minimum date to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('endDate').setAttribute('min', today);

        // Form validation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {
            let isValid = true;
            const errors = {};

            // Title validation
            const title = document.getElementById('title').value.trim();
            if (!title) {
                errors.title = 'Title is required';
                isValid = false;
            } else if (title.length < 5) {
                errors.title = 'Title must be at least 5 characters long';
                isValid = false;
            }

            // Description validation
            const description = document.getElementById('description').value.trim();
            if (!description) {
                errors.description = 'Description is required';
                isValid = false;
            } else if (description.length < 20) {
                errors.description = 'Description must be at least 20 characters long';
                isValid = false;
            }

            // Target amount validation
            const targetAmount = document.getElementById('targetAmount').value;
            if (!targetAmount) {
                errors.targetAmount = 'Target amount is required';
                isValid = false;
            } else if (targetAmount <= 0) {
                errors.targetAmount = 'Target amount must be greater than 0';
                isValid = false;
            }

            // End date validation
            const endDate = document.getElementById('endDate').value;
            if (!endDate) {
                errors.endDate = 'End date is required';
                isValid = false;
            } else {
                const selectedDate = new Date(endDate);
                const currentDate = new Date();
                if (selectedDate <= currentDate) {
                    errors.endDate = 'End date must be in the future';
                    isValid = false;
                }
            }

            // Clear previous errors
            document.querySelectorAll('.error').forEach(el => el.remove());

            // Show new errors if any
            if (!isValid) {
                e.preventDefault();
                Object.keys(errors).forEach(fieldId => {
                    showError(fieldId, errors[fieldId]);
                });
            }
        });

        function showError(fieldId, message) {
            const field = document.getElementById(fieldId);
            const errorDiv = document.createElement('div');
            errorDiv.className = 'error';
            errorDiv.textContent = message;
            field.parentNode.insertBefore(errorDiv, field.nextSibling);
            field.style.borderColor = '#ff6b6b';
        }

        // Reset border color on input
        document.querySelectorAll('.input').forEach(input => {
            input.addEventListener('input', function() {
                this.style.borderColor = '#e0e0e0';
                const errorDiv = this.parentNode.querySelector('.error');
                if (errorDiv) {
                    errorDiv.remove();
                }
            });
        });
    </script>
</body>
</html>