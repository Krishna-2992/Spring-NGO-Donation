package com.yash.ngodonation.rm;

import com.yash.ngodonation.domain.Donation;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DonationRowMapper implements RowMapper<Donation> {

    @Override
    public Donation mapRow(ResultSet rs, int i) throws SQLException {
        Donation u = new Donation();
        u.setDonationId(rs.getInt("donationId"));
        u.setDonorId(rs.getInt("donorId"));
        u.setAmount(rs.getInt("amount"));
        u.setCampaignId(rs.getInt("campaignId"));
        u.setDate(rs.getString("date"));
        return u;
    }
}
