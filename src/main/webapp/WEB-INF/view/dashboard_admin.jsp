<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib
uri="http://www.springframework.org/tags" prefix="s" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="f" %> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Admin Login - NGO Donation Application</title>
    <link href="static/css/style.css" rel="stylesheet" type="text/css" />
    <style>
      body {
        font-family: Arial, Helvetica, Geneva, sans-serif;
        font-size: 18px;
      }
      .error {
        color: #ff0000;
      }
      .success {
        color: #0000ff;
      }
      .btn {
        padding: 10px 20px; /* Adds padding around the text */
        font-size: 16px; /* Increases the font size */
        color: white; /* Text color */
        background-color: #007bff; /* Button background color */
        border: none; /* Removes any border */
        border-radius: 5px; /* Rounds the corners */
        text-decoration: none; /* Removes underline from the link */
        text-align: center; /* Centers the text */
        transition: background-color 0.3s ease; /* Smooth transition for hover effect */
      }
    </style>
  </head>
  <body style="text-align: center">
    <!-- Navbar -->
    <jsp:include page="include/navbar.jsp" />
    <br />

    <%-- Page Content Area--%> Admin Dashboard
    <c:if test="${err!=null}">
      <p class="error">${err}</p>
    </c:if>
    <c:if test="${param.act eq 'lo'}">
      <p class="success">Logout Successfully! Thanks for using NGO Donation.</p>
    </c:if>
    <br /><br /><br /><br /><br />
    <a href="campaigns" class="btn">View Campaigns</a>
    <jsp:include page="include/campaigns.jsp" />

    <br /><br /><br /><br />
    <br /><br /><br /><br />

    <%-- Footer --%>
    <jsp:include page="include/footer.jsp" />
  </body>
</html>
