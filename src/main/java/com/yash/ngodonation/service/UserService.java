package com.yash.ngodonation.service;

import com.yash.ngodonation.domain.User;
import com.yash.ngodonation.exception.UserBlockedException;

import java.util.List;

public interface UserService {

    public Boolean isUsernameExist(String username);

    /**
     * method handles the user registration task.
     * @param u
     */
    public void register(User u);

    /**
     * the method handles login operation using given credentials. null when validation fails
     * when user account is blocked, an exception will be thrown by this method
     * @param loginName
     * @param password
     * @return
     */
    public User login(String loginName, String password);

    public List<User> getUserList();

    /**
     * this method will change the user login status
     * @param userId
     * @param loginStatus
     */
    public void changeLoginStatus(Integer userId, Integer loginStatus);
}
