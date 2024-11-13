package com.yash.ngodonation.domain;

public class Campaign {
    private Integer campaignId;
    private String title;
    private String description;
    private String fundRaised;
    private String targetAmount;
    private String startDate;
    private String endDate;

    public Integer getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(Integer campaignId) {
        this.campaignId = campaignId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFundRaised() {
        return fundRaised;
    }

    public void setFundRaised(String fundRaised) {
        this.fundRaised = fundRaised;
    }

    public String getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(String targetAmount) {
        this.targetAmount = targetAmount;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "Campaign{" +
                "campaignId='" + campaignId + '\'' +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", fundRaised='" + fundRaised + '\'' +
                ", targetAmount='" + targetAmount + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                '}';
    }
}
