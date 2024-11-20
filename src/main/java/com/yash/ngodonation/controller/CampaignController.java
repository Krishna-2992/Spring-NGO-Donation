package com.yash.ngodonation.controller;

import com.yash.ngodonation.command.DonationCommand;
import com.yash.ngodonation.service.CampaignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class CampaignController {

    @Autowired
    private CampaignService campaignService;

    @RequestMapping(value = "/campaigns")
    public String getAllCampaigns(Model m, HttpSession session) {
        m.addAttribute("campaignList", campaignService.getAllCampaigns());
        session.setAttribute("currentPage", "Campaigns");
        session.setAttribute("campaignList", campaignService.getAllCampaigns());
        session.setAttribute("campaignFetched", "true");
        return "index";
    }

    @RequestMapping(value = "/campaign")
    public String getCampaign(Model m) {
        m.addAttribute("campaignList", campaignService.getAllCampaigns());
        DonationCommand cmd = new DonationCommand();
        m.addAttribute("command", cmd);
        return "campaign";
    }
}
