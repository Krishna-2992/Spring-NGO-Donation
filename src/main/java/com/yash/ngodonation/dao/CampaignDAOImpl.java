package com.yash.ngodonation.dao;

import com.yash.ngodonation.domain.Campaign;
import com.yash.ngodonation.domain.User;
import com.yash.ngodonation.rm.CampaignRowMapper;
import com.yash.ngodonation.rm.UserRowMapper;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CampaignDAOImpl extends BaseDAO implements CampaignDAO{
    @Override
    public List<Campaign> getAllCampaigns() {
        String sql = "SELECT * from campaign";
        List<Campaign> campaigns = getJdbcTemplate().query(sql, new CampaignRowMapper());
        return campaigns;
    }

    @Override
    public Campaign getCampaignById(int campaignId) {
        String sql = "SELECT * from campaign where campaignId=:ci";

        Map m = new HashMap();
        m.put("ci", campaignId);

        Campaign campaign = getNamedParameterJdbcTemplate().queryForObject(sql, m, new CampaignRowMapper());
        return campaign;
    }

    @Override
    public void addCampaign(String title, String description, float targetAmount, String endDate) {
        System.out.println("campaign dao add campaign");
        String sql = "Insert into campaign(title, description, fundRaised, targetAmount, startDate, endDate, status) " +
                "values(:title, :description, :fundRaised, :targetAmount, :startDate, :endDate, :status)";

        Map<String, Object> m = new HashMap<>();
        m.put("title", title);
        m.put("description", description);
        m.put("fundRaised", 0);
        m.put("targetAmount", targetAmount);
        m.put("startDate", java.time.LocalDate.now());
        m.put("endDate", endDate);
        m.put("status", "Active");

        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
    }

    @Override
    public void updateCampaign(Campaign campaign) {

    }

    @Override
    public void updateCampaignAmount(int campaignId, int amount) {
        System.out.println("campaign DAO -> updatecampaignamount");


        String sqlQuery = "UPDATE campaign " +
                "SET fundRaised = fundRaised + :fr " +
                "WHERE campaignId = " + campaignId;

        Map<String, Object> m = new HashMap<>();
        m.put("fr", amount);
        SqlParameterSource ps = new MapSqlParameterSource(m);

        super.getNamedParameterJdbcTemplate().update(sqlQuery, ps);

        handleCampaignFulfilled(campaignId, amount);

        System.out.println("campaign updated successfully");

    }

    public void handleCampaignFulfilled(int campaignId, int amount) {
        System.out.println("inside campaign fulfilled function");
        // logic to check if the campaign is resolved
        Campaign campaign = getCampaignById(campaignId);
        int targetAmount = Integer.parseInt(campaign.getTargetAmount());
        int amountRaised = Integer.parseInt(campaign.getFundRaised());
        int differenceAmount = targetAmount - amountRaised;

        System.out.println("difference amount: " + differenceAmount);

        String sqlQuery = "UPDATE campaign " +
                "SET status = :st " +
                "WHERE campaignId = " + campaignId;

        Map<String, Object> m = new HashMap<>();
        m.put("st", amount > differenceAmount ? "Fulfilled" : "Active");
        SqlParameterSource ps = new MapSqlParameterSource(m);

        super.getNamedParameterJdbcTemplate().update(sqlQuery, ps);

        System.out.println("campaign status updated successfully");

    }

    @Override
    public void deleteCampaign(int campaignId) {

    }
}
