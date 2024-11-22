package com.yash.ngodonation.dao;

import com.yash.ngodonation.domain.User;
import org.springframework.dao.DuplicateKeyException;

import java.util.List;

public interface UserDAO {
    public void save(User u) throws DuplicateKeyException;
    public void update(User u);
    public void delete(User u);
    public void delete(Integer userId);
    public User findById(Integer userId);
    public List<User> findAll();
    public List<User> findByProperty(String propName, Object propValue);
}
