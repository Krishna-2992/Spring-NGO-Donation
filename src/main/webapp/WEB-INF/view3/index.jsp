<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib
uri="http://www.springframework.org/tags" prefix="s" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="f" %> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NGO Donation Website</title>

    <link rel="icon" href="static/images/logo.png" type="image/png">


    <!-- CSS Imports -->
    <link rel="stylesheet" href="static/css/styles.css">
    <link rel="stylesheet" href="static/css/auth-styles.css">
    <link rel="stylesheet" href="static/css/popup.css">
    <link rel="stylesheet" href="static/css/campaignCards.css">

    <!-- JavaScript Imports -->
    <script src="static/js/auth-scripts.js" defer></script>
    <script src="static/js/popup.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        .fulfilled-campaign {
                        background-color: rgba(50, 205, 50, 0.1); /* Light green background */
                        border: 2px solid rgba(0, 128, 0, 0.3); /* Slightly darker green border */
                        transition: all 0.3s ease;
                    }

                    .fulfilled-campaign:hover {
                        background-color: rgba(50, 205, 50, 0.2); /* Slightly more intense green on hover */
                        border-color: rgba(0, 128, 0, 0.5);
                    }
    </style>
</head>
<body>
    <!-- Navbar -->
        <jsp:include page="include/navbar.jsp" />

    <jsp:include page="include/popup.jsp"/>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-content">
            <h1>Together We Can Make A Difference</h1>
            <p>Your generosity today creates a better tomorrow. Join us in bringing hope, help, and positive change to those who need it most.</p>
            <a href="#campaignCards" class="donate-btn">Donate Now</a>
        </div>
    </section>

    <!-- Campaigns Section -->
        <!-- Campaigns Section -->
        <section class="section" id="campaignCards">
            <h2 class="section-title">Our Campaigns</h2>
            <div class="cards-container">
                <c:forEach var="u" items="${campaignList}">
                    <a class="card no-link
                        ${u.status eq 'Fulfilled' ? 'fulfilled-campaign' :
                          (u.status eq 'Active' ? 'active-campaign' : 'inactive-campaign')}"
                       href="campaign?id=${u.campaignId}">
                        <div class="card-icon">
                            <c:if test="${u.campaignId eq 1}"><i class="fas fa-palette"></i></c:if>
                            <c:if test="${u.campaignId eq 2}"><i class="fas fa-leaf"></i></c:if>
                            <c:if test="${u.campaignId eq 3}"><i class="fas fa-graduation-cap"></i></c:if>
                        </div>
                        <h3>${u.title}</h3>
                        <!-- Progress Bar -->
                        <div class="progress-container">
                            <div class="progress-bar">
                                <div class="progress" style="width: ${(u.fundRaised / u.targetAmount) * 100}%"></div>
                            </div>
                            <div class="progress-info">
                                Raised: ₹${u.fundRaised} / ₹${u.targetAmount}
                            </div>
                        </div>

                        <p>${u.description}</p>

                        <!-- Status Overlay -->
                        <div class="status-overlay">
                            <span class="status-text">
                                ${u.status eq 'Fulfilled' ? 'Campaign Completed' :
                                  (u.status eq 'Active' ? 'Ongoing Campaign' : 'Inactive')}
                            </span>
                        </div>
                    </a>
                </c:forEach>
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
                <h3>3</h3>
                <p>Campaign</p>
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
                <p>We are committed to making a positive impact through sustainable development and community empowerment.</p>
            </div>
            <div class="footer-section">
                <h4>Contact Info</h4>
                <p>Email: info@ngodonation.org</p>
                <p>Phone: +91 7999609158</p>
                <p>Address: Super Corridor, Indore</p>
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