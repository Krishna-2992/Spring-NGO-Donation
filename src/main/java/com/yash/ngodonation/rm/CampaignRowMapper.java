package com.yash.ngodonation.rm;

import com.yash.ngodonation.domain.Campaign;
import com.yash.ngodonation.domain.User;
import org.springframework.jdbc.core.RowMapper;

import javax.swing.tree.TreePath;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CampaignRowMapper implements RowMapper<Campaign> {

    @Override
    public Campaign mapRow(ResultSet rs, int i) throws SQLException {
        Campaign c = new Campaign();
        c.setCampaignId(rs.getInt("campaignId"));
        c.setTitle(rs.getString("title"));
        c.setDescription(rs.getString("description"));
        c.setFundRaised(rs.getString("fundRaised"));
        c.setTargetAmount(rs.getString("targetAmount"));
        c.setStartDate(rs.getString("startDate"));
        c.setEndDate(rs.getString("endDate"));
        return c;
    }
}
