package com.yash.ngodonation.dao;

import com.yash.ngodonation.domain.User;
import com.yash.ngodonation.rm.UserRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.scheduling.support.SimpleTriggerContext;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDAOImpl extends BaseDAO implements UserDAO {

    @Override
    public void save(User u) {
        String sql = "INSERT INTO user(name, phone, email, address, loginName, password)"
                + " VALUES(:name, :phone, :email, :address, :loginName, :password)";

        Map<String, Object> m = new HashMap<>();
        m.put("name", u.getName());
        m.put("phone", u.getPhone());
        m.put("email", u.getEmail());
        m.put("address", u.getAddress());
        m.put("loginName", u.getLoginName());
        m.put("password", u.getPassword());

        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);

        Integer userId = kh.getKey().intValue();
        u.setUserId(userId);
    }

    @Override
    public void update(User u) {
        String sql = "UPDATE user " +
                "SET name=:name," +
                " phone=:phone," +
                " email=:email," +
                " address=:address," +
                " loginStatus=:loginStatus" +
                " WHERE userId=:userId";
        Map m = new HashMap();
        m.put("name", u.getName());
        m.put("phone", u.getPhone());
        m.put("email", u.getEmail());
        m.put("address", u.getAddress());
        m.put("userId", u.getUserId());
        getNamedParameterJdbcTemplate().update(sql, m);
    }

    @Override
    public void delete(User u) {
        this.delete(u.getUserId());
    }

    @Override
    public void delete(Integer userId) {
        String sql="DELETE FROM user WHERE userId=?";
        getJdbcTemplate().update(sql, userId);
    }

    @Override
    public User findById(Integer userId) {
        String sql = "SELECT * from user where userId=?";
        User u = getJdbcTemplate().queryForObject(sql, new UserRowMapper(), userId);
        return u;
    }

    @Override
    public List<User> findAll() {
        String sql = "SELECT * from user";
        List<User> users = getJdbcTemplate().query(sql, new UserRowMapper());
        return users;
    }

    @Override
    public List<User> findByProperty(String propName, Object propValue) {
        String sql = "SELECT * from user where " + propName + "=?";
        return getJdbcTemplate().query(sql, new UserRowMapper(), propValue);
    }
}
