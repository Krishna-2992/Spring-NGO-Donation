package com.yash.ngodonation.domain;

public class DonationDetail {
    private int donationId;
    private String campaignTitle;
    private String donorName;
    private String donorPhone;
    private int donationAmount;
    private String donationDate;


    @Override
    public String toString() {
        return "DonationDetail{" +
                "donationId=" + donationId +
                ", campaignTitle='" + campaignTitle + '\'' +
                ", donorName='" + donorName + '\'' +
                ", donorPhone='" + donorPhone + '\'' +
                ", donationAmount='" + donationAmount + '\'' +
                ", donationDate='" + donationDate + '\'' +
                '}';
    }

    public int getDonationId() {
        return donationId;
    }

    public void setDonationId(int donationId) {
        this.donationId = donationId;
    }

    public String getCampaignTitle() {
        return campaignTitle;
    }

    public void setCampaignTitle(String campaignTitle) {
        this.campaignTitle = campaignTitle;
    }

    public String getDonorName() {
        return donorName;
    }

    public void setDonorName(String donorName) {
        this.donorName = donorName;
    }

    public String getDonorPhone() {
        return donorPhone;
    }

    public void setDonorPhone(String donorPhone) {
        this.donorPhone = donorPhone;
    }

    public int getDonationAmount() {
        return donationAmount;
    }

    public void setDonationAmount(int donationAmount) {
        this.donationAmount = donationAmount;
    }

    public String getDonationDate() {
        return donationDate;
    }

    public void setDonationDate(String donationDate) {
        this.donationDate = donationDate;
    }
}
