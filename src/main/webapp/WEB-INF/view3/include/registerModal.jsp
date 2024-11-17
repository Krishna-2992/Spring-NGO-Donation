<div id="registerModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeModal('registerModal')">&times;</span>
        <form class="auth-form" action="register" method="POST">
            <h2 class="form-title">Create Account</h2>
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="name" required placeholder="Enter your full name">
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="tel" id="phone" name="phone" required placeholder="Enter your phone number">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required placeholder="Enter your address">
            </div>
            <div class="form-group">
                <label for="loginName">Login Name</label>
                <input type="text" id="loginName" name="loginName" required placeholder="Choose your login name">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Create a password">
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">
            </div>
            <button type="submit" class="auth-btn">Register</button>
            <div class="auth-links">
                <p>Already have an account? <a href="login_form" onclick="switchModal('registerModal', 'loginModal')">Login</a></p>
            </div>
        </form>
    </div>
</div>
