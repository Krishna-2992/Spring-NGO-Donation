package com.yash.ngodonation.controller;

import com.yash.ngodonation.command.CampaignCommand;
import com.yash.ngodonation.command.DonationCommand;
import com.yash.ngodonation.service.CampaignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String getCampaign(Model m, @RequestParam String id, HttpSession session) {
        session.setAttribute("currentCampaignId", id);
        System.out.println("currentCampaignId" + session.getAttribute("currentCampaignId"));
        m.addAttribute("campaignList", campaignService.getAllCampaigns());
        DonationCommand cmd = new DonationCommand();
        m.addAttribute("command", cmd);
        return "campaign";
    }

    @RequestMapping(value = "/addCampaignForm")
    public String addCampaignForm(Model m) {
        CampaignCommand cmd = new CampaignCommand();
        m.addAttribute("command", cmd);
        return "addCampaign";
    }

    @PostMapping(value = "/addCampaign")
    public String addCampaign(@ModelAttribute("command") CampaignCommand cmd) {
        String title = cmd.getTitle();
        String description = cmd.getDescription();
        float targetAmount = cmd.getTargetAmount();
        String endDate = cmd.getEndDate();

        System.out.println("title" + title);
        System.out.println(description);
        System.out.println(targetAmount);
        System.out.println(endDate);

        campaignService.addCampaign(title, description, targetAmount, endDate);

        return "index";

    }
}
