<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@page
session="true" %> <%@ page isELIgnored="false" %>

<!-- CSS Imports -->
<link rel="stylesheet" href="static/css/styles.css" />
<link rel="stylesheet" href="static/css/auth-styles.css" />

<script>
    function pay() {
        alert("pay called");
        fetch('/create_payment', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: 'amount=1000' // Amount in INR
                    })
                    alert("check terminal")
    }
</script>

<nav class="navbar">
  <div class="nav-links">
    <a href="#" class="logo">NGO Donation</a>
    <div class="nav-items">
      <c:if test="${userId==null}">
        <a href="index">Home</a>
        <a href="index#campaigns">Our Campaigns</a>
        <a href="index#contact">Contact</a>
        <div class="auth-nav-buttons">
          <a href="login" class="auth-nav-btn login-btn">Login</a>
          <a href="register" class="auth-nav-btn register-btn">Register</a>
        </div>
        <a href="create_payment">pay</a>
        <button onclick="pay()">pay1</button>

      </c:if>

      <c:if test="${userId!=null && role == 'Donor'}">
        <a href="index">Home</a>
        <a href="donations">Donations</a>
        <a href="index#contact">Contact</a>
        <div class="auth-nav-buttons">
            <a href="logout" class="auth-nav-btn register-btn">Logout</a>
        </div>
      </c:if>

      <c:if test="${userId!=null && role == 'Admin'}">
        <a href="index">Home</a>
        <a href="admin_users">Donors</a>
        <a href="donations">Donations</a>
        <a href="#contact">Contact</a>
        <div class="auth-nav-buttons">
          <a href="logout" class="auth-nav-btn register-btn">Logout</a>
        </div>
      </c:if>
    </div>
  </div>
</nav>

