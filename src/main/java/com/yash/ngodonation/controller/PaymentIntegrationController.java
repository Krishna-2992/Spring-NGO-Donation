package com.yash.ngodonation.controller;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PaymentIntegrationController {
    @Value("${rzp_key_id}")
    private String keyId = "rzp_test_BZSOgBnXQoiSLs";

    @Value("${rzp_key_secret}")
    private String secret = "7w4e5De2WRns6f886ErSLi2b";

    @GetMapping("/payment/{amount}")
    public String Payment(@PathVariable String amount) throws RazorpayException {

        System.out.println("payment -> amount: " + amount);

        RazorpayClient razorpayClient = new RazorpayClient(keyId, secret);
        JSONObject orderRequest = new JSONObject();
        orderRequest.put("amount", amount);
        orderRequest.put("currency", "INR");
        orderRequest.put("receipt", "order_receipt_11");

        Order order = razorpayClient.orders.create(orderRequest);
        String orderId = order.get("id");

        return orderId;
    }
}
