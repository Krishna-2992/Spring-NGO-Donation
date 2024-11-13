package com.yash.ngodonation.dao;

import com.yash.ngodonation.domain.Donation;
import com.yash.ngodonation.domain.User;
import com.yash.ngodonation.rm.DonationRowMapper;
import com.yash.ngodonation.rm.UserRowMapper;
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
public class DonationDAOImpl extends BaseDAO implements DonationDAO{
    @Override
    public List<Donation> getAllDonations() {
        String sql = "select * from donation";
        List<Donation> donations = getJdbcTemplate().query(sql, new DonationRowMapper());
        return donations;
    }

    @Override
    public Donation getDonationById(int donationId) {
        return null;
    }

    @Override
    public void save(int userId, int campaignId, int amount){

        System.out.println("donationDAO -> save");
        System.out.println(userId + " " + campaignId + " " + amount);

        String sql = "insert into donation (donorId, amount, campaignId)  values(:donorId, :amount, :campaignId)";
        Map<String, Object> m = new HashMap<>();
        m.put("donorId", userId);
        m.put("amount", amount);
        m.put("campaignId", campaignId);

        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);

        System.out.println("donation added!!");
    }

    @Override
    public void updateDonation(Donation donation) {

    }

    @Override
    public void deleteDonation(Donation donationId) {

    }
}
