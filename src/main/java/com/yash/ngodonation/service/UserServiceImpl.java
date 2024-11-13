package com.yash.ngodonation.service;

import com.yash.ngodonation.dao.BaseDAO;
import com.yash.ngodonation.dao.UserDAO;
import com.yash.ngodonation.domain.User;
import com.yash.ngodonation.exception.UserBlockedException;
import com.yash.ngodonation.rm.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl extends BaseDAO implements UserService {
    @Autowired
    private UserDAO userDAO;

    @Override
    public void register(User u) {
        System.out.println("service -> register");
        userDAO.save(u);
    }

    @Override
    public User login(String loginName, String password) throws UserBlockedException {
        String sql = "SELECT userId, name, phone, email, address, role, loginName " +
                "from user where loginName=:ln and password=:pw";
        Map m = new HashMap();
        m.put("ln", loginName);
        m.put("pw", password);

        try {
            User u = getNamedParameterJdbcTemplate().queryForObject(sql, m, new UserRowMapper());
            return u;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<User> getUserList() {
        return userDAO.findByProperty("role", "Donor");
    }

    @Override
    public void changeLoginStatus(Integer userId, Integer loginStatus) {
        String sql = "UPDATE user SET loginStatus=:lst WHERE userId=:uid";
        Map m = new HashMap();
        m.put("uid", userId);
        m.put("lst", loginStatus);
        getNamedParameterJdbcTemplate().update(sql, m);
    }

    @Override
    public Boolean isUsernameExist(String username) {
        String sql = "SELECT count(loginName) FROM user WHERE loginName=?";
        Integer count = getJdbcTemplate().queryForObject(sql, new String[]{username}, Integer.class);
        if(count==1){
            return true;
        }else{
            return false;
        }
    }
}
