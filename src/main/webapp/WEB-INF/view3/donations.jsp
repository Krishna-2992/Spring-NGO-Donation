<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib
uri="http://www.springframework.org/tags" prefix="s" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="f" %> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Donors List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }
        .main-container {
            padding: 20px;
        }
        .donors-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-top: 80px;

        }
        .donors-header {
            background-color: #ff6b6b;
            color: white;
            padding: 15px;
            font-size: 1.5em;
            font-weight: bold;
        }
        .donors-table {
            width: 100%;
            border-collapse: collapse;
        }
        .donors-table th {
            background-color: #ff6b6b;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: bold;
        }
        .donors-table td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }
        .donors-table tr:nth-child(even) {
            background-color: #fff0f0;
        }
        .donors-table tr:hover {
            background-color: #ffe5e5;
        }
    </style>
</head>
<body>
    <jsp:include page="include/navbar.jsp"/>
    <div class="main-container">
    <div class="donors-container">
        <div class="donors-header">
            Donations List
        </div>
        <table class="donors-table">
            <thead>
                <tr>
                    <th>DONATION ID</th>
                    <th>DONOR ID</th>
                    <th>CAMPAIGN ID</th>
                    <th>AMOUNT</th>
                    <th>DONATION</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${donationList}">
                  <tr>
                    <td>${u.donationId}</td>
                    <td>${u.donorId}</td>
                    <td>${u.campaignId}</td>
                    <td>${u.amount}</td>
                    <td>${u.date}</td>
                  </tr>
                </c:forEach>
              </tbody>
        </table>
    </div>
    </div>
</body>
</html>