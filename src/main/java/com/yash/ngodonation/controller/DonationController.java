package com.yash.ngodonation.controller;

import com.yash.ngodonation.command.DonationCommand;
import com.yash.ngodonation.command.LoginCommand;
import com.yash.ngodonation.command.UserCommand;
import com.yash.ngodonation.domain.Donation;
import com.yash.ngodonation.service.DonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class DonationController {

    @Autowired
    private DonationService donationService;

    @RequestMapping(value="/donation_form")
    public String donationForm(Model m, @RequestParam String campaignId, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if(userId == null) {
            return "redirect:login_form";
        }
        DonationCommand cmd = new DonationCommand();
        session.setAttribute("donationCampaignId", campaignId);
        m.addAttribute("command", cmd);
        return "donate";
    }

    @RequestMapping(value="/donate")
    public String donate(@ModelAttribute("command") DonationCommand cmd, Model m, HttpSession session) {
        // Implement the logic for payment gateway
        Integer userId = (Integer) session.getAttribute("userId");
        String campaignIdString = (String) session.getAttribute("donationCampaignId");
        int campaignId = Integer.parseInt(campaignIdString);
        System.out.println("donationController -> donate");
        donationService.addDonation(userId, campaignId, cmd.getAmount());
        System.out.println("label10");
        return "index";
    }

    @RequestMapping(value="/donations")
    public String donationPage(Model m, HttpSession session) {
        m.addAttribute("donationList", donationService.getAllDonations());
        session.setAttribute("currentPage", "Donations");
        return "index";
    }

}
