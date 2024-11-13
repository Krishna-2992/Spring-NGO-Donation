<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@taglib
uri="http://www.springframework.org/tags" prefix="s" %> <%@ page
isELIgnored="false" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>User List - Contact Application</title>
    <link href="static/css/style.css" rel="stylesheet" type="text/css" />
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
      }

      h1 {
        text-align: center;
        color: #333;
      }

      .user-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      }

      .user-table thead {
        background-color: #4caf50;
        color: white;
      }

      .user-table th,
      .user-table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }

      tbody > tr:hover {
        background-color: #e1e1e1; /* Light gray background on hover */
      }

      .user-table th {
        position: sticky;
        top: 0; /* Makes the header sticky */
      }

      button {
        border: none;
        background-color: white;
        text-color: blue;
      }
      .btn {
                border: none;
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
    </style>
    <script src="static/js/jquery.js"></script>
    <script>
      function changeStatus(uid, lstatus) {
        //alert(userId+", "+loginStatus);
        $.ajax({
          url: "change_status",
          data: { userId: uid, loginStatus: lstatus },
          success: function (data) {
            alert(data);
          },
        });
      }
    </script>
  </head>
  <body background="static/images/bg.jpg">
    <table id="donorsTable" class="user-table">
      <thead>
        <tr>
          <th>Campaign ID</th>
          <th>Title</th>
          <th>Description</th>
          <th>Fund Raised</th>
          <th>Target Amount</th>
          <th>Start Date</th>
          <th>End Date</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="u" items="${campaignList}">
          <tr>
            <td>${u.campaignId}</td>
            <td>${u.title}</td>
            <td>${u.description}</td>
            <td>${u.fundRaised}</td>
            <td>${u.targetAmount}</td>
            <td>${u.startDate}</td>
            <td>${u.endDate}</td>
            <td>
                <a href="donation_form?campaignId=${u.campaignId}" class="btn">Donate now</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </body>
</html>
