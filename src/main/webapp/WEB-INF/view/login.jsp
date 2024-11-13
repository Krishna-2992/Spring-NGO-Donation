<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>User Login - Contact Application</title>
    <link href="static/css/style.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
      body {
        font-family: 'Roboto', Arial, sans-serif;
        background-color: #f5f5f5;

      }
      .login-form {
        max-width: 400px;
        margin: 50px auto;
        background-color: white;
        padding: 30px;
        border-radius: 5px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
      }
      .form-control {
        border-radius: 3px;
      }
      .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
      }
      .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004d99;
      }
      .error {
        color: #dc3545;
      }
      .success {
        color: #28a745;
      }
    </style>
  </head>
  <body>
    <jsp:include page="include/navbar.jsp" />
    <div class="login-form">
      <h3 class="text-center mb-4">User Login</h3>
      <c:if test="${err!=null}">
        <p class="error">${err}</p>
      </c:if>
      <c:if test="${param.act eq 'lo'}">
        <p class="success">Logout Successfully! Thanks for using contact application.</p>
      </c:if>
      <c:if test="${param.act eq 'reg'}">
        <p class="success">User Registered Successfully. Please login</p>
      </c:if>
      <s:url var="url_login" value="/login" />
      <f:form action="${url_login}" modelAttribute="command" class="mb-3">
        <div class="mb-3">
          <label for="loginName" class="form-label">Username</label>
          <f:input path="loginName" class="form-control" />
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <f:password path="password" class="form-control" />
        </div>
        <div class="d-grid gap-2">
          <button class="btn btn-primary">Login</button>
        </div>
      </f:form>
      <div class="text-center">
        <a href="reg_form">New User Registration</a>
      </div>
    </div>
  </body>
</html>