package com.yash.ngodonation.service;

import com.yash.ngodonation.dao.CampaignDAO;
import com.yash.ngodonation.dao.DonationDAO;
import com.yash.ngodonation.domain.Donation;
import com.yash.ngodonation.domain.DonationDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class DonationServiceImpl implements DonationService {

    @Autowired
    private DonationDAO donationDao;

    @Autowired
    private CampaignDAO campaignDao;

    @Override
    public List<Donation> getAllDonations() {
        return donationDao.getAllDonations();
    }

    @Override
    public List<DonationDetail> getAllDonationDetails() {
        return donationDao.getAllDonationDetails();
    }

    @Override
    public Donation getDonationById(int donationId) {
        return null;
    }

    @Override
    public void handleDonation(int userId, int campaignId, int amount) {
        System.out.println("donationServie -> handleDonation");
        donationDao.save(userId, campaignId, amount);
        campaignDao.updateCampaignAmount(campaignId, amount);
    }

    @Override
    public List<DonationDetail> getDonationDetailsByUserId(int userId) {
        System.out.println("donation services -> donation by userid");
        return donationDao.getDonationDetailsByProperty("userId", userId);
    }


    @Override
    public void updateDonation(Donation donation) {

    }

    @Override
    public void deleteDonation(Donation donationId) {

    }
}
