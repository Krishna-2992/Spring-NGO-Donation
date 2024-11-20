package com.yash.ngodonation.controller;

import com.razorpay.*;
import com.yash.ngodonation.domain.PaymentRequest;
import com.yash.ngodonation.domain.PaymentResponse;
import com.yash.ngodonation.domain.PaymentVerificationRequest;
import com.yash.ngodonation.domain.VerificationResponse;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.logging.Logger;
import java.util.logging.Level;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    private static final Logger LOGGER = Logger.getLogger(PaymentController.class.getName());

    @Value("${razorpay.key.id}")
    private String keyId;

    @Value("${razorpay.key.secret}")
    private String keySecret;

    @GetMapping("/checkout")
    public String showCheckoutPage(Model model) {
        model.addAttribute("razorpayKeyId", keyId);
        return "checkout";
    }

    @PostMapping("/create-order")
    @ResponseBody
    public ResponseEntity<?> createOrder(@RequestBody PaymentRequest paymentRequest) {
        try {
            RazorpayClient razorpay = new RazorpayClient(keyId, keySecret);

            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", paymentRequest.getAmount() * 100); // amount in paise
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "order_" + System.currentTimeMillis());
            orderRequest.put("payment_capture", 1); // Auto capture payment

            // Create order
            Order order = razorpay.orders.create(orderRequest);

            // Create response
            PaymentResponse response = new PaymentResponse();
            response.setOrderId(order.get("id"));
            response.setAmount(order.get("amount").toString());
            response.setCurrency(order.get("currency"));

            return new ResponseEntity<>(response, HttpStatus.OK);

        } catch (RazorpayException e) {
            LOGGER.log(Level.SEVERE, "Error creating Razorpay order", e);
            return new ResponseEntity<>("Error creating order: " + e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/verify-payment")
    @ResponseBody
    public ResponseEntity<?> verifyPayment(@RequestBody PaymentVerificationRequest verificationRequest) {
        try {
            // Get payment and signature details
            String orderId = verificationRequest.getOrderId();
            String paymentId = verificationRequest.getPaymentId();
            String signature = verificationRequest.getSignature();

            // Create verification data
            JSONObject attributes = new JSONObject();
            attributes.put("razorpay_order_id", orderId);
            attributes.put("razorpay_payment_id", paymentId);
            attributes.put("razorpay_signature", signature);

            // Verify signature
            boolean isValid = Utils.verifyPaymentSignature(attributes, keySecret);

            if (isValid) {
                // Update your database here
                return new ResponseEntity<>(new VerificationResponse(true, "Payment verified successfully"),
                        HttpStatus.OK);
            } else {
                return new ResponseEntity<>(new VerificationResponse(false, "Payment verification failed"),
                        HttpStatus.BAD_REQUEST);
            }

        } catch (RazorpayException e) {
            LOGGER.log(Level.SEVERE, "Error verifying payment", e);
            return new ResponseEntity<>(new VerificationResponse(false, "Error verifying payment: " + e.getMessage()),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Handle payment success
    @PostMapping("/payment-success")
    public String paymentSuccess(@RequestParam Map<String, String> requestParams, Model model) {
        model.addAttribute("paymentId", requestParams.get("razorpay_payment_id"));
        model.addAttribute("orderId", requestParams.get("razorpay_order_id"));
        return "payment-success";
    }

    // Handle payment failure
    @PostMapping("/payment-failure")
    public String paymentFailure(@RequestParam Map<String, String> requestParams, Model model) {
        model.addAttribute("errorMessage", requestParams.get("error[description]"));
        return "payment-failure";
    }
}