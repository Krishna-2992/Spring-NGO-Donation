class ToastNotification {
    constructor() {
        // Create toast container if it doesn't exist
        if (!document.getElementById('toast-container')) {
            const container = document.createElement('div');
            container.id = 'toast-container';
            document.body.appendChild(container);
        }
    }

    show(message, type = 'success', duration = 5000) {
        // Create toast element
        const toast = document.createElement('div');
        toast.classList.add('toast-notification', type, 'show');

        // Define icons based on type
        const icons = {
            success: `
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
            `,
            error: `
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            `,
            warning: `
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                </svg>
            `
        };

        // Construct toast HTML
        toast.innerHTML = `
            <div class="toast-icon">${icons[type] || icons.success}</div>
            <div class="toast-content">${message}</div>
            <div class="toast-close">&times;</div>
            <div class="toast-progress"></div>
        `;

        // Add close functionality
        const closeBtn = toast.querySelector('.toast-close');
        closeBtn.addEventListener('click', () => this.remove(toast));

        // Append to container
        const container = document.getElementById('toast-container');
        container.appendChild(toast);

        // Auto remove
        setTimeout(() => this.remove(toast), duration);
    }

    remove(toast) {
        toast.classList.remove('show');
        setTimeout(() => {
            toast.remove();
        }, 400);
    }

    // Specific methods for different types
    success(message, duration = 5000) {
        this.show(message, 'success', duration);
    }

    error(message, duration = 5000) {
        this.show(message, 'error', duration);
    }

    warning(message, duration = 5000) {
        this.show(message, 'warning', duration);
    }
}

// Global toast instance
const toast = new ToastNotification();

// Function to show popup based on URL parameters
function showActionPopup() {
    const urlParams = new URLSearchParams(window.location.search);
    const actionType = urlParams.get('act');

    // Define message mapping
    const actionMessages = {
        'ds': {
            message: 'Donation successful! Thanks for donating for a bright future.',
            type: 'success'
        },
        'ls': {
            message: 'Login successful!',
            type: 'success'
        },
        're': {
            message: 'Registration successful!',
            type: 'success'
        },
        'err': {
            message: 'An error occurred. Please try again.',
            type: 'error'
        }
        // Add more action types as needed
    };

    if (actionType && actionMessages[actionType]) {
        const { message, type } = actionMessages[actionType];
        toast[type](message);
    }
}

// Call popup function when page loads
window.addEventListener('load', showActionPopup);