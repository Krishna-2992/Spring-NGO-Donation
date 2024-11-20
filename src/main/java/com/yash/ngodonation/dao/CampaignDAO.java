package com.yash.ngodonation.dao;

import com.yash.ngodonation.domain.Campaign;

import java.util.List;

public interface CampaignDAO
{
    List<Campaign> getAllCampaigns();
    Campaign getCampaignById(int campaignId);
    void addCampaign(Campaign campaign);

    void updateCampaign(Campaign campaign);

    void updateCampaignAmount(int campaignId, int amount);

    void deleteCampaign(int campaignId);
}