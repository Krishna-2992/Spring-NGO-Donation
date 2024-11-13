package com.yash.ngodonation.service;

import com.yash.ngodonation.dao.CampaignDAO;
import com.yash.ngodonation.domain.Campaign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class CampaignServiceImpl implements CampaignService{

    @Autowired
    private CampaignDAO campaignDAO;

    @Override
    public List<Campaign> getAllCampaigns() {
        return campaignDAO.getAllCampaigns();
    }

    @Override
    public Campaign getCampaignById(int campaignId) {
        return null;
    }

    @Override
    public void addCampaign(Campaign campaign) {

    }

    @Override
    public void updateCampaign(Campaign campaign) {

    }

    @Override
    public void deleteCampaign(int campaignId) {

    }
}
