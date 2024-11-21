<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campaign Details</title>
    <link rel="icon" href="static/images/logo.png" type="image/png">

    <!-- CSS Imports -->
    <link rel="stylesheet" href="static/css/styles.css">
    <link rel="stylesheet" href="static/css/auth-styles.css">
    <link rel="stylesheet" href="static/css/campaignPage.css">


    <script>
        function selectAmount(button, amount) {
            // Remove active class from all buttons
            document.querySelectorAll('.amount-btn').forEach(btn => {
                btn.classList.remove('active');
            });

            // Add active class to clicked button
            button.classList.add('active');

            document.getElementById('id-custom-amount').value = amount;
        }

        function validateDonation() {
            const amount = document.getElementById('id-custom-amount').value;
            if (!amount || amount <= 0) {
                alert('Please select or enter a valid donation amount');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <jsp:include page="include/navbar.jsp" />

    <c:forEach var="u" items="${campaignList}">
        <c:if test="${param.id eq u.campaignId}">
            <div class="container">
                <div class="campaign-header">
                    <h1 class="campaign-title">${u.title}</h1>

                    <!-- Fulfilled Badge -->
                    <c:if test="${u.status eq 'Fulfilled'}">
                        <div class="fulfilled-badge">Fully Funded</div>
                    </c:if>

                    <p class="campaign-description">
                        ${u.description}
                    </p>
                </div>

                <c:set var="progressPercentage" value="${(u.fundRaised / u.targetAmount) * 100}" />

                <div class="campaign-stats">
                    <div class="amounts">
                        <span class="amount-raised">
                            ₹${u.fundRaised}
                            <span class="progress-percentage">(${String.format("%.1f", progressPercentage)}%)</span>
                        </span>
                        <span class="target-amount">raised of ₹${u.targetAmount} goal</span>
                    </div>

                    <div class="progress-container">
                        <div class="progress-bar" style="width: ${progressPercentage > 100 ? '100' : progressPercentage}%"></div>
                    </div>

                    <div class="campaign-meta">
                        <div class="meta-item">
                            <div class="meta-label">Donors</div>
                            <div class="meta-value">247</div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-label">Start Date</div>
                            <div class="meta-value">${u.startDate}</div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-label">End Date</div>
                            <div class="meta-value">${u.endDate}</div>
                        </div>
                    </div>
                </div>

                <c:if test="${u.status eq 'Active'}">
                    <div class="donation-section">
                        <h2 class="donation-title">Make a Donation</h2>
                        <f:form action="create-order" modelAttribute="command" method="get" onsubmit="return validateDonation()">
                            <div class="donation-amounts">
                                <button type="button" class="amount-btn" onclick="selectAmount(this, 25)">₹25</button>
                                <button type="button" class="amount-btn" onclick="selectAmount(this, 50)">₹50</button>
                                <button type="button" class="amount-btn" onclick="selectAmount(this, 100)">₹100</button>
                                <button type="button" class="amount-btn" onclick="selectAmount(this, 200)">₹200</button>
                            </div>

                            <f:input path="amount" class="custom-amount" id="id-custom-amount" placeholder="Enter custom amount"/>
                            <button type="submit" class="donate-btn">Donate Now</button>
                        </f:form>
                    </div>
                </c:if>

            </div>
        </c:if>
    </c:forEach>
</body>
</html>