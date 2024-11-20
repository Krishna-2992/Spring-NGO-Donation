<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <button id="payButton">Pay Now</button>

    <script>
        document.getElementById('payButton').onclick = function() {
            // Create order on server
            fetch('/payment/create-order', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    amount: 1000 // amount in rupees
                })
            })
            .then(response => response.json())
            .then(order => {
                var options = {
                    key: '${razorpayKeyId}', // Replace with your key
                    amount: order.amount,
                    currency: order.currency,
                    order_id: order.id,
                    name: 'Your Company Name',
                    description: 'Product Description',
                    handler: function(response) {
                        // Verify payment on server
                        fetch('/payment/verify-payment', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
                                razorpay_payment_id: response.razorpay_payment_id,
                                razorpay_order_id: response.razorpay_order_id,
                                razorpay_signature: response.razorpay_signature
                            })
                        })
                        .then(response => response.json())
                        .then(isValid => {
                            if (isValid) {
                                alert('Payment successful!');
                            } else {
                                alert('Payment verification failed!');
                            }
                        });
                    },
                    prefill: {
                        name: '',
                        email: '',
                        contact: ''
                    }
                };

                var rzp = new Razorpay(options);
                rzp.open();
            });
        }
    </script>
</body>
</html>
