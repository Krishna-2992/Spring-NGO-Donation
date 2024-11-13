<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link href="static/css/login.css" rel="stylesheet" type="text/css" />
    <script src="static/js/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $("#login-form").submit(function(e) {
                e.preventDefault();
                $.ajax({
                    url: "${pageContext.request.contextPath}/login",
                    method: "POST",
                    data: $(this).serialize(),
                    success: function(response) {
                        if (response.success) {
                            window.location.href = "${pageContext.request.contextPath}/home";
                        } else {
                            $("#error-message").text(response.message);
                        }
                    },
                    error: function() {
                        $("#error-message").text("An error occurred while logging in.");
                    }
                });
            });
        });
    </script>
</head>
<body style="font-family: Arial, sans-serif; display: flex; justify-content: center; min-height: 100vh;">
    <div class="container">
        <!-- Navbar -->
        <jsp:include page="include/navbar.jsp" />

        <h1 class="title">User Login</h1>

        <c:if test="${err!=null}">
            <p class="error">${err}</p>
        </c:if>

        <f:form id="login-form" modelAttribute="command" action="login">
            <div class="login-card">
                <h2 class="form-title">Login to Your Account</h2>
                <div class="form-group">
                    <label for="username">Username</label>
                    <f:input path="loginName" id="username" />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <f:password path="password" id="password" />
                </div>
                <button type="submit">Login</button>
                <div class="error-message" id="error-message"></div>
            </div>
        </f:form>

        <p class="new-account">Don't have an account? <a href="${pageContext.request.contextPath}/reg_form">Register Now</a></p>

        <jsp:include page="include/footer.jsp" />
    </div>
</body>
</html>
