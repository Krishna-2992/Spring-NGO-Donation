<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="f" %> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Registration - NGO Donation</title>
    <script src="static/js/jquery.js"></script>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        min-height: 100vh;
        line-height: 1.6;
      }

      .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
      }

      .card {
        background: white;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        margin: 20px auto;
      }

      .header {
        background: #3498db;
        color: white;
        padding: 20px;
        text-align: center;
      }

      .menu {
        background: #34495e;
        color: white;
        padding: 10px;
        text-align: center;
      }

      .content {
        padding: 30px;
        background: white;
      }

      .footer {
        background: #2c3e50;
        color: white;
        padding: 10px;
        text-align: center;
      }

      h3 {
        color: #2c3e50;
        margin-bottom: 25px;
        text-align: center;
        font-size: 24px;
        font-weight: 600;
      }

      .form-container {
        max-width: 600px;
        margin: 0 auto;
        background: #f8f9fa;
        padding: 30px;
        border-radius: 8px;
      }

      .form-group {
        margin-bottom: 20px;
        animation: fadeIn 0.5s ease-out forwards;
      }

      .form-group label {
        display: block;
        margin-bottom: 8px;
        color: #2c3e50;
        font-weight: 500;
      }

      .form-control {
        width: 100%;
        padding: 12px 15px;
        border: 2px solid #e1e1e1;
        border-radius: 5px;
        font-size: 14px;
        transition: all 0.3s ease;
      }

      .form-control:focus {
        border-color: #3498db;
        outline: none;
        box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
      }

      textarea.form-control {
        min-height: 100px;
        resize: vertical;
      }

      .btn-submit {
        background-color: #3498db;
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: background-color 0.3s ease;
        width: 100%;
        margin-top: 20px;
      }

      .btn-submit:hover {
        background-color: #2980b9;
      }

      .error {
        color: #dc3545;
        background-color: #f8d7da;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 4px;
        border: 1px solid #f5c6cb;
      }

      #check_avail {
        background-color: #28a745;
        color: white;
        padding: 8px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 10px;
        font-size: 14px;
      }

      #check_avail:hover {
        background-color: #218838;
      }

      #res_div {
        margin-top: 5px;
        font-size: 14px;
      }

      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(10px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      @media (max-width: 768px) {
        .container {
          padding: 10px;
        }
        .form-container {
          padding: 20px;
        }
        .content {
          padding: 20px;
        }
      }

      @media (max-width: 480px) {
        .form-container {
          padding: 15px;
        }
        .btn-submit {
          padding: 10px 20px;
        }
      }
    </style>
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
  <body>
    <div class="container">
      <div class="card">
        <div class="header">
          <jsp:include page="include/navbar.jsp" />
        </div>

        <div class="content">
          <h3>User Registration</h3>

          <c:if test="${err!=null}">
            <p class="error">${err}</p>
          </c:if>

          <div class="form-container">
            <f:form action="register_user" modelAttribute="command">
              <div class="form-group">
                <label for="name">Name</label>
                <f:input path="user.name" id="name" cssClass="form-control" />
              </div>

              <div class="form-group">
                <label for="phone">Phone</label>
                <f:input path="user.phone" id="phone" cssClass="form-control" />
              </div>

              <div class="form-group">
                <label for="email">Email</label>
                <f:input path="user.email" id="email" cssClass="form-control" />
              </div>

              <div class="form-group">
                <label for="address">Address</label>
                <f:textarea
                  path="user.address"
                  id="address"
                  cssClass="form-control"
                  rows="4"
                />
              </div>

              <div class="form-group">
                <label for="username">Username</label>
                <div style="display: flex; align-items: center">
                  <f:input
                    path="user.loginName"
                    id="id_username"
                    cssClass="form-control"
                  />
                  <button type="button" id="id_check_avail" class="btn-check">
                    Check Availability
                  </button>
                </div>
                <div id="id_res_div"></div>
              </div>

              <div class="form-group">
                <label for="password">Password</label>
                <f:password
                  path="user.password"
                  id="password"
                  cssClass="form-control"
                />
              </div>

              <button type="submit" class="btn-submit">Register</button>
            </f:form>
          </div>
        </div>

        <div class="footer">
          <jsp:include page="include/footer.jsp" />
        </div>
      </div>
    </div>
  </body>
</html>
