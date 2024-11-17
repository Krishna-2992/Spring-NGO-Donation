<style>
    .form-group input,
            .form-group textarea {
                width: 100%;
                padding: 0.8rem;
                border: 2px solid #DFE6E9;
                border-radius: 10px;
                font-size: 1rem;
                transition: border-color 0.3s;
            }

            .form-group input:focus,
            .form-group textarea:focus {
                border-color: #FF6B6B;
                outline: none;
            }

            .form-group input {
                width: 100%;
                padding: 0.8rem;
                border: 2px solid #DFE6E9;
                border-radius: 10px;
                font-size: 1rem;
                transition: border-color 0.3s;
            }

            .form-group input:focus {
                border-color: #FF6B6B;
                outline: none;
                box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.1);
            }
</style>

<div id="loginModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeModal('loginModal')">&times;</span>
        <form class="auth-form" action="login" method="POST">
            <h2 class="form-title">Login Page!</h2>
            <div class="form-group">
                <label for="loginEmail">Email</label>
                <input type="email" id="loginEmail" name="email" required placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label for="loginPassword">Password</label>
                <input type="password" id="loginPassword" name="password" required placeholder="Enter your password">
            </div>
            <button type="submit" class="auth-btn">Login</button>
            <div class="auth-links">
                <a href="#forgot-password">Forgot Password?</a>
                    <p>Don't have an account? <a href="register_form" onclick="switchModal('loginModal', 'registerModal')">Register</a></p>
                    <p>Don't have an account? <a onclick="switchModal('loginModal', 'registerModal')">Register</a></p>fds
                    <p>Don't have an account? <a href="register_form" onclick="console.log('Switch Modal clicked'); switchModal('loginModal', 'registerModal')">Register</a></p>
            </div>
        </form>
    </div>
</div>