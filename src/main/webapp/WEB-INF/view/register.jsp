<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %> <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="static/css/register.css" rel="stylesheet" type="text/css" />
    <script src="static/js/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $("#id_check_avail").click(function () {
                $.ajax({
                    url: "check_avail",
                    data: { username: $("#id_username").val() },
                    success: function (data) {
                        $("#id_res_div").html(data);
                    },
                });
            });
        });
    </script>
</head>
<body style="font-family: Arial, sans-serif; display: flex; justify-content: center; min-height: 100vh;">
    <div class="container">
        <!-- Navbar -->
        <jsp:include page="include/navbar.jsp" />

        <h1 class="title">User Registration</h1>

        <c:if test="${err!=null}">
            <p class="error">${err}</p>
        </c:if>

        <f:form action="register_user" modelAttribute="command" class="registration-form">
            <table class="registration-table">
                <tr>
                    <td><label for="name">Name:</label></td>
                    <td><f:input path="user.name" id="name" /></td>
                </tr>
                <tr>
                    <td><label for="phone">Phone:</label></td>
                    <td><f:input path="user.phone" id="phone" /></td>
                </tr>
                <tr>
                    <td><label for="email">Email:</label></td>
                    <td><f:input path="user.email" id="email" /></td>
                </tr>
                <tr>
                    <td><label for="address">Address:</label></td>
                    <td><f:textarea path="user.address" id="address" rows="3"></f:textarea></td>
                </tr>
                <tr>
                    <td><label for="username">Username:</label></td>
                    <td>
                        <f:input path="user.loginName" id="username" />
                        <button type="button" id="check_avail">Check Availability</button>
                        <div id="res_div" class="error"></div>
                    </td>
                </tr>
                <tr>
                    <td><label for="password">Password:</label></td>
                    <td><f:password path="user.password" id="password" /></td>
                </tr>
                <tr>
                    <td colspan="2"><button type="submit">Submit</button></td>
                </tr>
            </table>
        </f:form>

        <jsp:include page="include/footer.jsp" />
    </div>
</body>
</html>
