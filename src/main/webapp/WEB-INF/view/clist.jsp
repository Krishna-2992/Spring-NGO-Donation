<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>DonationList - NGO Donation</title>
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
    </style>
  </head>
  <body>
    <table border="1" width="80%" align="center">
      <tr>
        <td height="80px">
          <%-- Header --%>
          <jsp:include page="include/header.jsp" />
        </td>
      </tr>
      <tr>
        <td height="350px" valign="top">
          <%-- Page Content Area--%>
          <h3>DonationList</h3>
          <c:if test="${param.act eq 'sv'}">
              <p class="success">DonationSaved Successfully</p>
          </c:if>
          <c:if test="${param.act eq 'del'}">
                <p class="success">DonationDeleted Successfully</p>
            </c:if>

            <table width="100%">
                <tr>
                    <td align="right" >
                        <form action="user_contact_search"/>
                            <input type="text" name="freeText" value="${param.freeText}" placeholder="Enter Text To Search">
                            <button>Find</button>
                        </form>
                    </td>
                </tr>
            </table>
            <form action="user_bulk_cdelete">
                <button>Delete Selected Records</button> <br/><br/>
                  <table border="1" cellpadding="3" width="100%">
                    <tr>
                        <th>SELECT</th>
                        <th>CID</th>
                        <th>NAME</th>
                        <th>PHONE</th>
                        <th>EMAIL</th>
                        <th>ADDRESS</th>
                        <th>REMARK</th>
                        <th>ACTION</th>
                    </tr>

                    <c:if test="${empty contactList}">
                        <tr>
                            <td align="center" colspan="8" class="error">No Records Present</td>
                        </tr>
                    </c:if>

                    <c:forEach var="c" items="${contactList}" varStatus="st">
                        <tr>
                            <td align="center"><input type="checkbox" name="cid" value="${c.contactId}"/></td>
                            <td>${c.contactId}</td>
                            <td>${c.name}</td>
                            <td>${c.phone}</td>
                            <td>${c.email}</td>
                            <td>${c.address}</td>
                            <td>${c.remark}</td>
                            <td>
                                <a href="<c:url value="/user_edit_contact?cid=${c.contactId}"/>">Edit</a> |
                                <a href="<c:url value="/user_del_contact?cid=${c.contactId}"/>">Delete</a>
                            </td>
                            </tr>
                    </c:forEach>
                  </table>
        </form>

        </td>
      </tr>
      <tr>
        <td height="25px">
          <%-- Footer --%>
          <jsp:include page="include/footer.jsp" />
        </td>
      </tr>
    </table>
  </body>
</html>
