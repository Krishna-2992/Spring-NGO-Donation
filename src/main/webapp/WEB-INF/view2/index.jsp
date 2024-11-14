<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib
uri="http://www.springframework.org/tags" prefix="s" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="f" %> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>User Login - NGO Donation</title>
    <link href="static/css/style.css" rel="stylesheet" type="text/css" />

    <style>
      * {
        /* Reset styles can be added here */
      }

      body {
        font-family: Arial, Helvetica, Geneva, sans-serif;
        font-size: 18px;
        margin: 0;
        padding: 0;
        text-align: center;
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

      .btn:hover {
        background-color: #0056b3; /* Darker shade on hover */
      }
    </style>
  </head>

  <body>
    <!-- Navbar -->
    <jsp:include page="include/navbar.jsp" />

    <div>
      <c:if test="${userId==null}">
        <h1>Homepage</h1>
      </c:if>

      <c:if test="${userId!=null && role == 'Admin'}">
        <h1>Admin Dashboard</h1>
      </c:if>

      <c:if test="${userId!=null && role == 'Donor'}">
        <h1>Donor Dashboard</h1>
      </c:if>

      <%-- Page Content Area --%>
      <div>
        <c:if test="${err != null}">
          <p class="error">${err}</p>
        </c:if>

        <c:if test="${param.act eq 'lo'}">
          <p class="success">
            Logout Successfully! Thanks for using the NGO Donation.
          </p>
        </c:if>

        <c:if test="${param.act eq 'reg'}">
          <p class="success">User Registered Successfully. Please login</p>
        </c:if>
      </div>

      <%-- Table display area --%>
      <div>
        <c:if test="${currentPage==null || currentPage=='Campaigns'}">
          <c:if test="${campaignFetched==null}">
            <a href="campaigns" class="btn">View Campaigns</a>
          </c:if>
          <c:if test="${campaignFetched=='true'}">
            <a href="campaigns" class="btn">Campaigns</a>
            <jsp:include page="include/campaigns.jsp" />
          </c:if>
        </c:if>

        <c:if test="${currentPage=='Donations'}">
          <a href="donations" class="btn">Donations</a>
          <jsp:include page="include/donations.jsp" />
        </c:if>

        <c:if test="${currentPage=='Donors'}">
          <a href="donors" class="btn">Donors</a>
          <jsp:include page="include/donors.jsp" />
        </c:if>
      </div>
    </div>

    <%-- Footer --%>
    <jsp:include page="include/footer.jsp" />
  </body>
</html>
