package com.yash.ngodonation.rm;

import com.yash.ngodonation.domain.Donation;
import com.yash.ngodonation.domain.DonationDetail;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DonationDetailRowMapper implements RowMapper<DonationDetail> {
    @Override
    public DonationDetail mapRow(ResultSet rs, int i) throws SQLException {
        DonationDetail d = new DonationDetail();

        d.setDonationId(rs.getInt("donationId"));
        d.setCampaignTitle(rs.getString("campaignTitle"));
        d.setDonorName(rs.getString("donorName"));
        d.setDonorPhone(rs.getString("donorPhone"));
        d.setDonationAmount(rs.getInt("donationAmount"));
        d.setDonationDate(rs.getString("donationDate"));
        return d;
    }
}
