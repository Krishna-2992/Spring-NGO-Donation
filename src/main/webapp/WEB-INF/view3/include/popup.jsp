<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Existing head content -->
    <link rel="stylesheet" href="static/css/popup.css">
    <script src="static/js/popup.js" defer></script>
</head>
<body>
    <!-- Existing body content -->

    <!-- Action Message Popup -->
    <div id="action-popup" class="popup">
        <div class="popup-content">
            <div class="popup-icon" id="popup-icon">
                <!-- Dynamic SVG icon will be inserted here -->
            </div>
            <div id="popup-message"></div>
            <div class="popup-actions">
                <button class="popup-btn popup-btn-primary" onclick="document.getElementById('action-popup').classList.remove('show')">
                    Close
                </button>
            </div>
        </div>
    </div>

    <script>
        // Function to show popup based on URL parameters
        function showActionPopup() {
            const urlParams = new URLSearchParams(window.location.search);
            const actionType = urlParams.get('act');
            const popupElement = document.getElementById('action-popup');
            const popupMessage = document.getElementById('popup-message');

            // Define message mapping
            const actionMessages = {
                'ds': 'Donation successful! Thanks for donating for a bright future.',
                'ls': 'Login successful!',
                're': 'Registration successful!',
                'up': 'Profile updated successfully!',
                'pf': 'Payment failed. Kindly try to donate again!'
                // Add more action types and messages as needed
            };

            if (actionType && actionMessages[actionType]) {
                popupMessage.textContent = actionMessages[actionType];
                popupElement.classList.add('show');
            }

            // Close popup when close button is clicked
            document.querySelector('.close-popup').addEventListener('click', () => {
                popupElement.classList.remove('show');
            });

            // Close popup when clicking outside
            popupElement.addEventListener('click', (event) => {
                if (event.target === popupElement) {
                    popupElement.classList.remove('show');
                }
            });
        }

        // Call popup function when page loads
        window.addEventListener('load', showActionPopup);
    </script>
</body>
</html>