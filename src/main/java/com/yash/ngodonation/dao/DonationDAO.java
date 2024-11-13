package com.yash.ngodonation.dao;

import com.yash.ngodonation.domain.Campaign;
import com.yash.ngodonation.domain.Donation;

import java.util.List;

public interface DonationDAO {

    List<Donation> getAllDonations();
    Donation getDonationById(int donationId);
    void save(int userId, int campaignId, int amount);

    void updateDonation(Donation donation);
    void deleteDonation(Donation donationId);

}
