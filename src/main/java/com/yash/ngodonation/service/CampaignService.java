package com.yash.ngodonation.service;

import com.yash.ngodonation.domain.Campaign;

import java.util.List;

public interface CampaignService
{
    List<Campaign> getAllCampaigns();
    Campaign getCampaignById(int campaignId);
    void addCampaign(String title, String description, float targetAmount, String endDate);
    void updateCampaign(Campaign campaign);
    void deleteCampaign(int campaignId);

    void addCampaignDonation(int amount);
}