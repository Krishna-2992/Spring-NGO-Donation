package com.yash.ngodonation.service;

import com.yash.ngodonation.domain.Donation;
import com.yash.ngodonation.domain.DonationDetail;
import org.springframework.stereotype.Service;

import java.util.List;

public interface DonationService {
    List<Donation> getAllDonations();
    public List<DonationDetail> getAllDonationDetails();
    Donation getDonationById(int donationId);
    void handleDonation(int userId, int campaignId, int amount);
    List<DonationDetail> getDonationDetailsByUserId(int userId);

    void updateDonation(Donation donation);
    void deleteDonation(Donation donationId);
}
