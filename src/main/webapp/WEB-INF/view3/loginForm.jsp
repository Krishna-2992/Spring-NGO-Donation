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
    <link rel="icon" href="static/images/logo.png" type="image/png">
    <title>Login Form</title>
    <!-- CSS Imports -->
    <link rel="stylesheet" href="static/css/styles.css">
    <link rel="stylesheet" href="static/css/auth-styles.css">
    <link rel="stylesheet" href="static/css/login.css">
</head>

<body>
    <jsp:include page="include/navbar.jsp"/>
    <div class="container">
        <div class="login-card">
            <h2>Login</h2>
            <c:if test="${param.act eq 'reg'}">
                <p class="success">User Registered Successfully. Please login</p>
                <br>
              </c:if>
            <f:form action="login_user" modelAttribute="command" class="mb-3">
                <div class="mb-3">
                  <f:input path="loginName" class="form-control" placeholder="Username"/>
                </div>
                <br>
                <div class="mb-3">
                  <f:password path="password" class="form-control" placeholder="Password"/>
                </div>
                <br>
                <div class="d-grid gap-2">
                  <button type="submit" class="login-button">Login</button>
                </div>
            </f:form>

        </div>
    </div>
</body>
</html>