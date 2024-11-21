package com.yash.ngodonation.controller;

import com.yash.ngodonation.command.DonationCommand;
import com.yash.ngodonation.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    private String razorpayKeyId = "rzp_test_BZSOgBnXQoiSLs";

    @GetMapping("/checkout")
    public String showCheckoutPage(Model model) {
        model.addAttribute("razorpayKeyId", razorpayKeyId);
        return "redirect:index?act=pf";
    }

    @GetMapping("/create-order")
    public String createOrder(@ModelAttribute("command") DonationCommand cmd, Model model, HttpSession session) {
        System.out.println("inside create user!!!");
        Integer userId = (Integer) session.getAttribute("userId");
        if(userId == null) {
            return "redirect:login";
        }

        try {
            int amount = cmd.getAmount();
            System.out.println("amount:" + amount);
            session.setAttribute("amount", amount);
            String orderId = paymentService.createOrder(amount, "INR", "receipt_" + System.currentTimeMillis());

            // Add all necessary attributes
            model.addAttribute("orderId", orderId);
            model.addAttribute("amount", amount);
            model.addAttribute("razorpayKeyId", razorpayKeyId);
            model.addAttribute("currency", "INR");

            // Print debug information
            System.out.println("Order created with ID: " + orderId);
            System.out.println("Amount: " + amount);
            System.out.println("Key ID: " + razorpayKeyId);

            return "payment";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error creating order: " + e.getMessage());
            return "error";
        }
    }

    @PostMapping("/verify")
    public String verifyPayment(
            @RequestParam String razorpay_order_id,
            @RequestParam String razorpay_payment_id,
            @RequestParam String razorpay_signature,
            Model model) {

        System.out.println("Verifying payment...");
        System.out.println("Order ID: " + razorpay_order_id);
        System.out.println("Payment ID: " + razorpay_payment_id);

        boolean isValid = paymentService.verifySignature(
                razorpay_order_id,
                razorpay_payment_id,
                razorpay_signature
        );

        if (isValid) {
            model.addAttribute("status", "success");
            return "redirect:donate";
        } else {
            model.addAttribute("status", "failed");
            return "redirect:index?act=pf";
        }
    }
}