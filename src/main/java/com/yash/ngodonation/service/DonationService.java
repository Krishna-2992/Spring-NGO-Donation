package com.yash.ngodonation.service;

import com.yash.ngodonation.domain.Donation;
import org.springframework.stereotype.Service;

import java.util.List;

public interface DonationService {
    List<Donation> getAllDonations();
    Donation getDonationById(int donationId);
    void addDonation(int userId, int campaignId, int amount);
    void updateDonation(Donation donation);
    void deleteDonation(Donation donationId);
}
