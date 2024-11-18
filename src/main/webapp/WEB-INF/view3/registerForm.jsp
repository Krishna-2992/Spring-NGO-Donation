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
    <title>Registration Page</title>
    <!-- CSS Imports -->
        <link rel="stylesheet" href="static/css/styles.css">
        <link rel="stylesheet" href="static/css/auth-styles.css">
        <link rel="stylesheet" href="static/css/register.css">
</head>
<body>
    <jsp:include page="include/navbar.jsp"/>
<div class="register-card">
    <h2>Register</h2> <br>
    <f:form action="register_user" modelAttribute="command">
        <div class="input-field">
            <label for="name">Name</label>
            <f:input path="user.name" id="name" cssClass="form-control" />
        </div>

        <div class="input-field">
            <label for="phone">Phone</label>
            <f:input path="user.phone" id="phone" />
        </div>

        <div class="input-field">
            <label for="email">Email</label>
            <f:input path="user.email" id="email" cssClass="form-control" />
        </div>

        <div class="input-field">
            <label for="address">Address</label>
            <f:textarea path="user.address" id="address" cssClass="form-control" rows="4" />
        </div>

        <div class="input-field">
            <label for="username">Username</label>
            <f:input path="user.loginName" id="id_username" cssClass="form-control" />
        <div id="id_res_div"></div>
        </div>

        <div class="input-field">
            <label for="password">Password</label>
            <f:password path="user.password" id="password" cssClass="form-control" />
        </div>

        <div class="input-field">
            <label for="panNumber">Pan Card Number</label>
            <f:input path="user.panNumber" id="panNumber" cssClass="form-control" />
        </div>

        <button type="submit" class="register-button">Register</button>
    </f:form>
</div>

</body>
</html>