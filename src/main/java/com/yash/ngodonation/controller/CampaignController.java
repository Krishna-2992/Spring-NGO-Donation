package com.yash.ngodonation.controller;

import com.yash.ngodonation.domain.Campaign;
import com.yash.ngodonation.service.CampaignService;
import com.yash.ngodonation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CampaignController {

    @Autowired
    private CampaignService campaignService;

    @RequestMapping(value = "/campaigns")
    public String getUserList(Model m, HttpSession session) {
        System.out.println("setting the campaign list!!");
        m.addAttribute("campaignList", campaignService.getAllCampaigns());
        session.setAttribute("campaignList", campaignService.getAllCampaigns());
        m.addAttribute("campaignFetched", "true");
        session.setAttribute("campaignFetched", "true");
        return "index"; //JSP
    }
}
