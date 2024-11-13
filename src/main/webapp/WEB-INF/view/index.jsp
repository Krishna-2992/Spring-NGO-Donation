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
    <style>
    *{

    }
      body {
        font-family: Arial, Helvetica, Geneva, sans-serif;
        font-size: 18px;
          margin: 0;
            padding: 0;
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
          background-color: #007BFF; /* Button background color */
          border: none; /* Removes any border */
          border-radius: 5px; /* Rounds the corners */
          text-decoration: none; /* Removes underline from the link */
          text-align: center; /* Centers the text */
          transition: background-color 0.3s ease; /* Smooth transition for hover effect */
      }

      .btn:hover {
          background-color: #0056b3; /* Darker shade on hover */
      }
    </style>
  </head>
  <body style="text-align: center">
    <!-- Navbar -->
    <jsp:include page="include/navbar.jsp" />
    <br />
    Homepage
    <br /><br /><br /><br />
    <%-- Page Content Area--%>
    <c:if test="${err!=null}">
      <p class="error">${err}</p>
    </c:if>
    <c:if test="${param.act eq 'lo'}">
      <p class="success">
        Logout Successfully! Thanks for using contact application.
      </p>
    </c:if>
    <c:if test="${param.act eq 'reg'}">
      <p class="success">User Registered Successfully. Please login</p>
    </c:if>
    <a href="campaigns" class="btn">View Campaigns</a>
    <jsp:include page="include/campaigns.jsp" />

    <br /><br /><br /><br />
    <br /><br /><br /><br />

    <%-- Footer --%>
    <jsp:include page="include/footer.jsp" />
  </body>
</html>
