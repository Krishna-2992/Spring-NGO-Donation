<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
uri="http://www.springframework.org/tags" prefix="s" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="f" %> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
    <title>Make Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <h2>Processing Payment...</h2>
    <div id="error-message" style="color: red;"></div>
    <div> orderId: ${orderId} </div>

    <script>
        function handlePayment() {
            try {
                var options = {
                    "key": "${razorpayKeyId}", // Enter the Key ID generated from the Dashboard
                    "amount": "${amount * 100}", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                    "currency": "INR",
                    "name": "Your Company Name",
                    "description": "Test Transaction",
                    "image": "your_logo_url",
                    "order_id": "${orderId}",
                    "callback_url": "${pageContext.request.contextPath}/payment/verify",
                    "prefill": {
                        "name": "Test User",
                        "email": "test.user@example.com",
                        "contact": "9999999999"
                    },
                    "notes": {
                        "address": "Razorpay Corporate Office"
                    },
                    "theme": {
                        "color": "#3399cc"
                    },
                    "handler": function (response) {
                        console.log("Payment successful!");
                        console.log("Payment ID: " + response.razorpay_payment_id);
                        console.log("Order ID: " + response.razorpay_order_id);
                        console.log("Signature: " + response.razorpay_signature);

                        // Create a form to submit the payment details
                        var form = document.createElement('form');
                        form.method = 'POST';
                        form.action = '${pageContext.request.contextPath}/payment/verify';

                        var fields = {
                            'razorpay_payment_id': response.razorpay_payment_id,
                            'razorpay_order_id': response.razorpay_order_id,
                            'razorpay_signature': response.razorpay_signature
                        };

                        for (var fieldName in fields) {
                            var hiddenField = document.createElement('input');
                            hiddenField.type = 'hidden';
                            hiddenField.name = fieldName;
                            hiddenField.value = fields[fieldName];
                            form.appendChild(hiddenField);
                        }

                        document.body.appendChild(form);
                        form.submit();
                    },
                    "modal": {
                        "ondismiss": function() {
                            console.log("Checkout form closed");
                            window.location.href = "${pageContext.request.contextPath}/payment/checkout";
                        }
                    }
                };

                console.log("Initializing Razorpay with options:", options);
                var rzp1 = new Razorpay(options);

                rzp1.on('payment.failed', function (response){
                    console.error("Payment failed:", response.error);
                    document.getElementById('error-message').innerText =
                        'Payment failed: ' + response.error.description;
                });

                // Open Razorpay checkout
                rzp1.open();
            } catch (error) {
                console.error("Error in payment processing:", error);
                document.getElementById('error-message').innerText =
                    'Error initializing payment: ' + error.message;
            }
        }

        // Call handlePayment when the page loads
        window.onload = handlePayment;
    </script>
</body>
</html>