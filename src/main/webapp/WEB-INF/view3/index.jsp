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

    <!-- CSS Imports -->
    <link rel="stylesheet" href="static/css/styles.css">
    <link rel="stylesheet" href="static/css/auth-styles.css">

    <!-- JavaScript Imports -->
    <script src="static/js/auth-scripts.js" defer></script>
</head>
<body>
    <!-- Navbar -->
        <jsp:include page="include/navbar.jsp" />


    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-content">
            <h1>Together We Can Make A Difference</h1>
            <p>Your generosity today creates a better tomorrow. Join us in bringing hope, help, and positive change to those who need it most.</p>
            <a href="#donate" class="donate-btn">Donate Now</a>
        </div>
    </section>

    <!------ campaigns --->
    <table id="donorsTable" class="user-table">
          <thead>
            <tr>
              <th>Campaign ID</th>
              <th>Title</th>
              <th>Description</th>
              <th>Fund Raised</th>
              <th>Target Amount</th>
              <th>Start Date</th>
              <th>End Date</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="u" items="${campaignList}">
              <tr>
                <td>${u.campaignId}</td>
                <td>${u.title}</td>
                <td>${u.description}</td>
                <td>${u.fundRaised}</td>
                <td>${u.targetAmount}</td>
                <td>${u.startDate}</td>
                <td>${u.endDate}</td>
                <td>
                  <a href="donation_form?campaignId=${u.campaignId}" class="btn"
                    >Donate</a
                  >
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

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

    <!-- Campaigns Section -->
    <section class="section" id="causes">
        <h2 class="section-title">Our Causes</h2>
        <div class="cards-container">

            <c:forEach var="u" items="${campaignList}">
                <a class="card no-link" href="campaign?id=${u.campaignId}">
                    <div class="card-icon">🎨</div>
                    <h3>${u.title}</h3>
                    <p>${u.description}</p>
                </a>
            </c:forEach>

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