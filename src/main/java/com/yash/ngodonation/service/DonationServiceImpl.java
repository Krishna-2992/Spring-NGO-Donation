package com.yash.ngodonation.service;

import com.yash.ngodonation.dao.DonationDAO;
import com.yash.ngodonation.domain.Donation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class DonationServiceImpl implements DonationService {

    @Autowired
    private DonationDAO donationDao;

    @Override
    public List<Donation> getAllDonations() {
        return donationDao.getAllDonations();
    }

    @Override
    public Donation getDonationById(int donationId) {
        return null;
    }

    @Override
    public void addDonation(int userId, int campaignId, int amount) {
        System.out.println("donationServie -> adddonation");
        donationDao.save(userId, campaignId, amount);
    }


    @Override
    public void updateDonation(Donation donation) {

    }

    @Override
    public void deleteDonation(Donation donationId) {

    }
}
