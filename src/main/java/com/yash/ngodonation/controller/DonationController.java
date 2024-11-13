package com.yash.ngodonation.controller;

import com.yash.ngodonation.command.LoginCommand;
import com.yash.ngodonation.command.UserCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DonationController {

    @RequestMapping(value="/donation_form")
    public String donationForm(Model m, @RequestParam String campaignId) {
        System.out.println(campaignId);
        System.out.println("donation_form");
        LoginCommand cmd = new LoginCommand();
        m.addAttribute("command", cmd);
        return "donate";
    }

    @RequestMapping(value="/donate")
    public String donate() {
        // Implement the logic for payment gateway
        return "index";
    }

}
