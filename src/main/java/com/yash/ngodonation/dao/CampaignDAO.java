package com.yash.ngodonation.dao;

import com.yash.ngodonation.domain.Campaign;

import java.util.List;

public interface CampaignDAO
{
    List<Campaign> getAllCampaigns();
    Campaign getCampaignById(int campaignId);
    void addCampaign(String title, String description, float targetAmount, String endDate);

    void updateCampaign(Campaign campaign);

    void updateCampaignAmount(int campaignId, int amount);

    void deleteCampaign(int campaignId);
}