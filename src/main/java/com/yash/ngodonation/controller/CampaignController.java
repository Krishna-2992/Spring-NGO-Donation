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
    public String getAllCampaigns(Model m, HttpSession session) {
        m.addAttribute("campaignList", campaignService.getAllCampaigns());
        session.setAttribute("currentPage", "Campaigns");
        session.setAttribute("campaignList", campaignService.getAllCampaigns());
        session.setAttribute("campaignFetched", "true");
        return "index"; //JSP
    }
}
