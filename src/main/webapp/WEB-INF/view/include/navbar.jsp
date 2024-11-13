<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<%@ page isELIgnored="false" %>

<style>
    body {
        background-color: #f5f7fa;
    }

    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 20px;
        background-color: #3498db;
        color: white;
        top: 0;
        left: 0;
        right: 0;

    }

    .navbar-brand {
        font-size: 1.5em;
        font-weight: bold;
    }

    .navbar a {
        color: white;
        text-decoration: none;
        margin-left: 20px;
        transition: color 0.3s ease;
    }

    .navbar a:hover {
        color: #2980b9;
    }

    .user-links {
        display: flex;
        gap: 15px;
    }

    @media (max-width: 768px) {
        .navbar {
            flex-direction: column;
            align-items: center;
        }

        .navbar a {
            margin-left: 0;
            margin-top: 10px;
        }
    }
</style>

<c:set var="userId" value="${sessionScope.userId}"/>
<c:set var="role" value="${sessionScope.role}"/>

<div class="navbar">
    <div class="navbar-brand">NGO Donation</div>
    <div class="user-links">
        <c:if test="${userId==null}">
            <!-- Guest menu -->
            <a href="index" class="guest-link">Home</a> |
            <a href="login_form" class="guest-link">Login</a> |
            <a href="reg_form" class="guest-link">Register</a> |
            <a href="donate_form" class="guest-link">Donate</a>
        </c:if>

        <c:if test="${userId!=null && role == 'Admin'}">
            <!-- Admin menu -->
            <a href="admin_dashboard" class="admin-link">Home</a> |
            <a href="listDonors" class="admin-link">Donors</a> |
            <a href="listDonations" class="admin-link">Donations</a> |
            <a href="logout" class="admin-link">Logout</a>
        </c:if>

        <c:if test="${userId!=null && role == 'Donor'}">
            <!-- Donor menu -->
            <a href="user_dashboard" class="donor-link">Home</a> |
            <a href="listDonations" class="donor-link">Donations</a> |
            <a href="logout" class="donor-link">Logout</a>
        </c:if>
    </div>
</div>

<!-- Rest of your JSP content -->
