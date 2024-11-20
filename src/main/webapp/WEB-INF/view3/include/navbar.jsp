<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@page
session="true" %> <%@ page isELIgnored="false" %>

<!-- CSS Imports -->
<link rel="stylesheet" href="static/css/styles.css" />
<link rel="stylesheet" href="static/css/auth-styles.css" />


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
        <a href="payment/200">pay</a>
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

