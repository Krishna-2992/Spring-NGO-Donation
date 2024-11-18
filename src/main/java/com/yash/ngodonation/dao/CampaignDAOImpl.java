package com.yash.ngodonation.dao;

import com.yash.ngodonation.domain.Campaign;
import com.yash.ngodonation.domain.User;
import com.yash.ngodonation.rm.CampaignRowMapper;
import com.yash.ngodonation.rm.UserRowMapper;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CampaignDAOImpl extends BaseDAO implements CampaignDAO{
    @Override
    public List<Campaign> getAllCampaigns() {
        String sql = "SELECT campaignId, title, description, fundRaised, targetAmount, startDate, endDate" +
                " from campaign";
        List<Campaign> campaigns = getJdbcTemplate().query(sql, new CampaignRowMapper());
        System.out.println("campaigns fetched!!");
        for(Campaign campaign: campaigns) {
            System.out.println(campaign);
        }
        return campaigns;
    }

    @Override
    public Campaign getCampaignById(int campaignId) {
        String sql = "SELECT campaignId, title, description, fundRaised, targetAmount, startDate, endDate" +
                " from campaign where campaignId=:ci";

        Map m = new HashMap();
        m.put("ci", campaignId);

        Campaign campaign = getNamedParameterJdbcTemplate().queryForObject(sql, m, new CampaignRowMapper());
        return campaign;
    }

    @Override
    public void addCampaign(Campaign campaign) {

    }

    @Override
    public void updateCampaign(Campaign campaign) {

    }

    @Override
    public void deleteCampaign(int campaignId) {

    }
}
