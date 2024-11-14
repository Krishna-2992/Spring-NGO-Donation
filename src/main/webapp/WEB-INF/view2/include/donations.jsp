<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

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
<table id="donorsTable" class="user-table">
      <thead>
        <tr>
          <th>DonationId</th>
          <th>DonorId</th>
          <th>CampaignId</th>
          <th>Amount</th>
          <th>Donation Date</th>
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