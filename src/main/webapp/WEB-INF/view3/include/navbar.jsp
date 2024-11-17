<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<%@ page isELIgnored="false" %>



<nav class="navbar">
    <div class="nav-links">
        <a href="#" class="logo">HopeHarbor</a>
        <div class="nav-items">
            <c:if test="${userId==null}">
               <a href="#home">Home</a>
               <a href="#causes">Our Causes</a>
               <a href="#contact">Contact</a>
               <div class="auth-nav-buttons">
                   <button onclick="openModal('loginModal')" class="auth-nav-btn login-btn">Login</button>
                   <button onclick="openModal('registerModal')" class="auth-nav-btn register-btn">Register</button>
               </div>
            </c:if>

             <c:if test="${userId!=null && role == 'Admin'}">
               <a href="#home">Home</a>
               <a href="#causes">Donations</a>
               <a href="#contact">Contact</a>
               <div class="auth-nav-buttons">
                   <button onclick="openModal('registerModal')" class="auth-nav-btn register-btn">Logout</button>
               </div>
            </c:if>
        </div>
    </div>
</nav>