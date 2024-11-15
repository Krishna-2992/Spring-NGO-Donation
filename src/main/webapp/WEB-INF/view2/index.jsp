<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NGO Donation Website</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f0f2f5;
        }

        /* Navbar styles */
        .navbar {
            background-color: #ffffff;
            padding: 1rem 2rem;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .nav-links {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            color: #FF6B6B;
            font-size: 1.8rem;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-items {
            display: flex;
            gap: 2rem;
        }

        .nav-items a {
            color: #4A4A4A;
            text-decoration: none;
            font-size: 1.1rem;
            font-weight: 500;
            transition: color 0.3s;
            padding: 0.5rem 1rem;
            border-radius: 25px;
        }

        .nav-items a:hover {
            color: #FF6B6B;
            background-color: #FFE3E3;
        }

        /* Hero section */
        .hero {
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
                        url('static/images/bg.webp');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            padding: 0 1rem;
            margin-bottom: 3rem;
        }

        .hero-content {
            max-width: 900px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            color: #ffffff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .hero p {
            font-size: 1.4rem;
            margin-bottom: 2.5rem;
            line-height: 1.6;
        }

        .donate-btn {
            background-color: #FF6B6B;
            color: white;
            padding: 1.2rem 3rem;
            border: none;
            border-radius: 50px;
            font-size: 1.3rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .donate-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(255, 107, 107, 0.4);
        }

        /* Card Sections */
        .section {
            padding: 4rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            color: #2D3436;
            font-size: 2.5rem;
            position: relative;
        }

        .section-title:after {
            content: '';
            display: block;
            width: 100px;
            height: 4px;
            background: #FF6B6B;
            margin: 1rem auto;
            border-radius: 2px;
        }

        .cards-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 1rem;
        }

        .card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-icon {
            width: 60px;
            height: 60px;
            background: #FFE3E3;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            color: #FF6B6B;
            font-size: 1.5rem;
        }

        .card h3 {
            color: #2D3436;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .card p {
            color: #636E72;
            line-height: 1.6;
        }

        /* Impact Numbers */
        .impact-numbers {
            background: #FF6B6B;
            padding: 4rem 2rem;
            margin: 4rem 0;
            color: white;
        }

        .numbers-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
        }

        .number-card {
            padding: 2rem;
        }

        .number-card h3 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        /* Contact Form */
        .contact-form {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2D3436;
        }

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

        /* Footer */
        .footer {
            background-color: #2D3436;
            color: white;
            padding: 3rem 2rem;
            text-align: center;
            margin-top: 4rem;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            text-align: left;
        }

        .footer-section h4 {
            color: #FF6B6B;
            margin-bottom: 1rem;
        }

        .footer-section p,
        .footer-section a {
            color: #B2BEC3;
            line-height: 1.6;
            text-decoration: none;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .social-links a {
            color: white;
            background: #FF6B6B;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: transform 0.3s;
        }

        .social-links a:hover {
            transform: translateY(-3px);
        }

        /* Modal Styles */
                .modal {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5);
                    z-index: 1001;
                    animation: fadeIn 0.3s;
                }

                @keyframes fadeIn {
                    from { opacity: 0; }
                    to { opacity: 1; }
                }

                .modal-content {
                    position: relative;
                    background-color: white;
                    width: 90%;
                    max-width: 400px;
                    margin: 50px auto;
                    padding: 2rem;
                    border-radius: 20px;
                    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
                    animation: slideIn 0.3s;
                }

                @keyframes slideIn {
                    from { transform: translateY(-100px); opacity: 0; }
                    to { transform: translateY(0); opacity: 1; }
                }

                .close-btn {
                    position: absolute;
                    right: 20px;
                    top: 20px;
                    font-size: 1.5rem;
                    cursor: pointer;
                    color: #666;
                    transition: color 0.3s;
                }

                .close-btn:hover {
                    color: #FF6B6B;
                }

                /* Form Styles */
                .auth-form {
                    margin-top: 1rem;
                }

                .form-title {
                    color: #2D3436;
                    font-size: 1.8rem;
                    margin-bottom: 1.5rem;
                    text-align: center;
                }

                .form-group {
                    margin-bottom: 1.5rem;
                }

                .form-group label {
                    display: block;
                    margin-bottom: 0.5rem;
                    color: #2D3436;
                    font-weight: 500;
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

                .auth-btn {
                    width: 100%;
                    background-color: #FF6B6B;
                    color: white;
                    padding: 1rem;
                    border: none;
                    border-radius: 10px;
                    font-size: 1.1rem;
                    font-weight: bold;
                    cursor: pointer;
                    transition: transform 0.3s, box-shadow 0.3s;
                }

                .auth-btn:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
                }

                .auth-links {
                    text-align: center;
                    margin-top: 1.5rem;
                }

                .auth-links a {
                    color: #FF6B6B;
                    text-decoration: none;
                    font-size: 0.9rem;
                }

                .auth-links a:hover {
                    text-decoration: underline;
                }

                .divider {
                    margin: 1.5rem 0;
                    text-align: center;
                    position: relative;
                }

                .divider::before,
                .divider::after {
                    content: '';
                    position: absolute;
                    top: 50%;
                    width: 45%;
                    height: 1px;
                    background-color: #DFE6E9;
                }

                .divider::before { left: 0; }
                .divider::after { right: 0; }

                .social-auth {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 1rem;
                    margin-top: 1rem;
                }

                .social-auth-btn {
                    padding: 0.8rem;
                    border: 2px solid #DFE6E9;
                    border-radius: 10px;
                    background: white;
                    color: #2D3436;
                    cursor: pointer;
                    transition: background-color 0.3s;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 0.5rem;
                }

                .social-auth-btn:hover {
                    background-color: #f8f9fa;
                }

                /* Add these to your existing nav-items */
                .auth-nav-buttons {
                    display: flex;
                    gap: 1rem;
                }

                .auth-nav-btn {
                    padding: 0.5rem 1.5rem;
                    border: 2px solid #FF6B6B;
                    border-radius: 25px;
                    font-weight: 500;
                    transition: all 0.3s;
                }

                .login-btn {
                    background: transparent;
                    color: #FF6B6B;
                }

                .login-btn:hover {
                    background: #FFE3E3;
                }

                .register-btn {
                    background: #FF6B6B;
                    color: white;
                }

                .register-btn:hover {
                    background: #ff5252;
                    border-color: #ff5252;
                }
                .modal {
                            display: none;
                            position: fixed;
                            top: 0;
                            left: 0;
                            width: 100%;
                            height: 100%;
                            background-color: rgba(0, 0, 0, 0.5);
                            z-index: 1001;
                            animation: fadeIn 0.3s;
                            /* Add these properties for scrolling */
                            overflow-y: auto;
                            padding: 20px 0;
                        }

                        .modal-content {
                            position: relative;
                            background-color: white;
                            width: 90%;
                            max-width: 400px;
                            margin: 20px auto;  /* Changed from 50px to 20px for better spacing */
                            padding: 2rem;
                            border-radius: 20px;
                            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
                            animation: slideIn 0.3s;
                            /* Remove any max-height constraints */
                        }

                        /* Add smooth scrollbar for webkit browsers */
                        .modal::-webkit-scrollbar {
                            width: 8px;
                        }

                        .modal::-webkit-scrollbar-track {
                            background: rgba(0, 0, 0, 0.1);
                            border-radius: 4px;
                        }

                        .modal::-webkit-scrollbar-thumb {
                            background: rgba(0, 0, 0, 0.2);
                            border-radius: 4px;
                        }

                        .modal::-webkit-scrollbar-thumb:hover {
                            background: rgba(0, 0, 0, 0.3);
                        }

                        /* Ensure the modal is centered on all screen sizes */
                        @media screen and (max-height: 700px) {
                            .modal {
                                align-items: flex-start;
                            }

                            .modal-content {
                                margin: 20px auto;
                                /* Remove any transform that might interfere with scrolling */
                                transform: none;
                            }
                        }

                        /* Adjust animation for smoother performance */
                        @keyframes slideIn {
                            from {
                                transform: translateY(-20px);
                                opacity: 0;
                            }
                            to {
                                transform: translateY(0);
                                opacity: 1;
                            }
                        }

                        /* Make sure form elements don't overflow */
                        .auth-form {
                            margin-top: 1rem;
                            width: 100%;
                            /* Remove any height constraints */
                        }

                        /* Adjust spacing for better mobile view */
                        .form-group {
                            margin-bottom: 1.2rem;
                        }

                        /* Ensure buttons are always visible */
                        .auth-btn {
                            margin-bottom: 1rem;
                        }

                        /* Adjust social auth buttons container */
                        .social-auth {
                            margin: 1rem 0;
                        }
    </style>
    <script>
            function openModal(modalId) {
                        const modal = document.getElementById(modalId);
                        modal.style.display = "block";
                        // Prevent body scrolling but allow modal scrolling
                        document.body.style.overflow = "hidden";
                        // Reset scroll position when opening modal
                        modal.scrollTop = 0;
                    }

                    function closeModal(modalId) {
                        document.getElementById(modalId).style.display = "none";
                        // Restore body scrolling
                        document.body.style.overflow = "auto";
                    }

                    function switchModal(closeModalId, openModalId) {
                        closeModal(closeModalId);
                        setTimeout(() => {
                            openModal(openModalId);
                        }, 100); // Small delay for smoother transition
                    }

                    // Close modal when clicking outside but prevent closing when clicking on modal content
                    window.onclick = function(event) {
                        if (event.target.className === 'modal') {
                            closeModal(event.target.id);
                        }
                    }

                    // Prevent modal content clicks from bubbling up to the modal backdrop
                    document.querySelectorAll('.modal-content').forEach(content => {
                        content.onclick = function(event) {
                            event.stopPropagation();
                        }
                    });

                    // Close modal on escape key
                    document.addEventListener('keydown', function(event) {
                        if (event.key === 'Escape') {
                            document.querySelectorAll('.modal').forEach(modal => {
                                if (modal.style.display === 'block') {
                                    closeModal(modal.id);
                                }
                            });
                        }
                    });
        </script>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
            <div class="nav-links">
                <a href="#" class="logo">HopeHarbor</a>
                <div class="nav-items">
                    <a href="#home">Home</a>
                    <a href="#about">About</a>
                    <a href="#causes">Our Causes</a>
                    <a href="#donate">Donate</a>
                    <a href="#contact">Contact</a>
                    <div class="auth-nav-buttons">
                        <button onclick="openModal('loginModal')" class="auth-nav-btn login-btn">Login</button>
                        <button onclick="openModal('registerModal')" class="auth-nav-btn register-btn">Register</button>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Login Modal -->
        <div id="loginModal" class="modal">
            <div class="modal-content">
                <span class="close-btn" onclick="closeModal('loginModal')">&times;</span>
                <form class="auth-form" action="login" method="POST">
                    <h2 class="form-title">Welcome Back!</h2>
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
                        <p>Don't have an account? <a href="#" onclick="switchModal('loginModal', 'registerModal')">Register</a></p>
                    </div>
                    <div class="divider">or</div>
                    <div class="social-auth">
                        <button type="button" class="social-auth-btn">
                            <span>Google</span>
                        </button>
                        <button type="button" class="social-auth-btn">
                            <span>Facebook</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Register Modal -->
        <div id="registerModal" class="modal">
            <div class="modal-content">
                <span class="close-btn" onclick="closeModal('registerModal')">&times;</span>
                <form class="auth-form" action="register" method="POST">
                    <h2 class="form-title">Create Account</h2>
                    <div class="form-group">
                        <label for="registerName">Full Name</label>
                        <input type="text" id="registerName" name="name" required placeholder="Enter your full name">
                    </div>
                    <div class="form-group">
                        <label for="registerEmail">Email</label>
                        <input type="email" id="registerEmail" name="email" required placeholder="Enter your email">
                    </div>
                    <div class="form-group">
                        <label for="registerPassword">Password</label>
                        <input type="password" id="registerPassword" name="password" required placeholder="Create a password">
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">
                    </div>
                    <button type="submit" class="auth-btn">Register</button>
                    <div class="auth-links">
                        <p>Already have an account? <a href="#" onclick="switchModal('registerModal', 'loginModal')">Login</a></p>
                    </div>
                    <div class="divider">or</div>
                    <div class="social-auth">
                        <button type="button" class="social-auth-btn">
                            <span>Google</span>
                        </button>
                        <button type="button" class="social-auth-btn">
                            <span>Facebook</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-content">
            <h1>Together We Can Make A Difference</h1>
            <p>Your generosity today creates a better tomorrow. Join us in bringing hope, help, and positive change to those who need it most.</p>
            <a href="#donate" class="donate-btn">Donate Now</a>
        </div>
    </section>

    <!-- About Section -->
    <section class="section" id="about">
        <h2 class="section-title">Why Choose Us</h2>
        <div class="cards-container">
            <div class="card">
                <div class="card-icon">💡</div>
                <h3>Our Mission</h3>
                <p>Dedicated to creating lasting change through sustainable development and community empowerment.</p>
            </div>
            <div class="card">
                <div class="card-icon">🤝</div>
                <h3>Transparency</h3>
                <p>100% transparency in how your donations are used, with regular updates on project progress.</p>
            </div>
            <div class="card">
                <div class="card-icon">🌍</div>
                <h3>Global Impact</h3>
                <p>Creating positive change across communities worldwide through focused initiatives.</p>
            </div>
        </div>
    </section>

    <!-- Impact Numbers -->
    <div class="impact-numbers">
        <div class="numbers-container">
            <div class="number-card">
                <h3>10K+</h3>
                <p>Lives Impacted</p>
            </div>
            <div class="number-card">
                <h3>50+</h3>
                <p>Active Projects</p>
            </div>
            <div class="number-card">
                <h3>100+</h3>
                <p>Volunteers</p>
            </div>
            <div class="number-card">
                <h3>25+</h3>
                <p>Countries Reached</p>
            </div>
        </div>
    </div>

    <!-- Causes Section -->
    <section class="section" id="causes">
        <h2 class="section-title">Our Causes</h2>
        <div class="cards-container">
            <div class="card">
                <div class="card-icon">📚</div>
                <h3>Education</h3>
                <p>Providing quality education and learning resources to underprivileged children.</p>
            </div>
            <div class="card">
                <div class="card-icon">🏥</div>
                <h3>Healthcare</h3>
                <p>Ensuring accessible healthcare services to remote communities.</p>
            </div>
            <div class="card">
                <div class="card-icon">🌱</div>
                <h3>Environment</h3>
                <p>Working towards a sustainable future through environmental conservation.</p>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="section" id="contact">
        <h2 class="section-title">Get In Touch</h2>
        <div class="contact-form">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Your Name">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Your Email">
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" rows="5" placeholder="Your Message"></textarea>
            </div>
            <button class="donate-btn">Send Message</button>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h4>About Us</h4>
                <p>HopeHarbor is committed to making a positive impact through sustainable development and community empowerment.</p>
            </div>
            <div class="footer-section">
                <h4>Contact Info</h4>
                <p>Email: info@hopeharbor.org</p>
                <p>Phone: +1 (555) 123-4567</p>
                <p>Address: 123 Hope Street, Charity City</p>
            </div>
            <div class="footer-section">
                <h4>Follow Us</h4>
                <div class="social-links">
                    <a href="#" aria-label="Facebook">f</a>
                    <a href="#" aria-label="Twitter">t</a>
                    <a href="#" aria-label="Instagram">i</a>
                    <a href="#" aria-label="LinkedIn">in</a>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>