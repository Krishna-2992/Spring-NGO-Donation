package com.yash.ngodonation.service;

import com.yash.ngodonation.domain.Campaign;

import java.util.List;

public interface CampaignService
{
    List<Campaign> getAllCampaigns();
    Campaign getCampaignById(int campaignId);
    void addCampaign(Campaign campaign);
    void updateCampaign(Campaign campaign);
    void deleteCampaign(int campaignId);
}