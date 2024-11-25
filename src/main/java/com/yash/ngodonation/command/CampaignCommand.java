package com.yash.ngodonation.command;

public class CampaignCommand {
    private String title;
    private String description;
    private float targetAmount;
    private String endDate;

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

    public float getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(float targetAmount) {
        this.targetAmount = targetAmount;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "CampaignCommand{" +
                "title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", targetAmount=" + targetAmount +
                ", endDate='" + endDate + '\'' +
                '}';
    }
}
