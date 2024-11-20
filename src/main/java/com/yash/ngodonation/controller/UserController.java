package com.yash.ngodonation.controller;

import com.yash.ngodonation.command.LoginCommand;
import com.yash.ngodonation.command.UserCommand;
import com.yash.ngodonation.domain.User;
import com.yash.ngodonation.exception.UserBlockedException;
import com.yash.ngodonation.service.CampaignService;
import com.yash.ngodonation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private CampaignService campaignService;

    @RequestMapping(value = {"/", "/index"})
    public String index(Model m, HttpSession session) {
        System.out.println("index page");
        m.addAttribute("campaignList", campaignService.getAllCampaigns());
        return "index"; // /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/register")
    public String registrationForm(Model m) {
        System.out.println("registration form invoked!!");
        UserCommand cmd = new UserCommand();
        m.addAttribute("command", cmd);
        return "registerForm";//JSP
    }

    @RequestMapping(value = "/register_user")
    public String registerUser(@ModelAttribute("command") UserCommand cmd, Model m) {
        try {
            System.out.println("usercontroller -> register");
            User user = cmd.getUser();
            System.out.println("User before registration: " + user);
            userService.register(user);
            return "redirect:login?act=reg"; //Login Page
        } catch (DuplicateKeyException e) {
            e.printStackTrace();
            m.addAttribute("err", "Username is already registered. Please select another username.");
            return "index";//JSP
        }
    }

    @RequestMapping(value = "/login")
    public String loginForm(Model m) {
        LoginCommand cmd = new LoginCommand();
        m.addAttribute("command", cmd);
        return "loginForm";//JSP
    }

    @RequestMapping(value = "/login_user")
    public String handleLogin(@ModelAttribute("command") LoginCommand cmd, Model m, HttpSession session) {
            System.out.println("inside user login");
            User loggedInUser = userService.login(cmd.getLoginName(), cmd.getPassword());
            if(loggedInUser == null) {
                m.addAttribute("err", "Login failed enter valid credentials");
                return "redirect:index";
            } else {
                //success
                // check role and redirect to appropriate dashboard
                if(loggedInUser.getRole().equals("Admin")) {
                    addUserInSession(loggedInUser, session);
                    System.out.println("route to dashboard_admin");
                    return "redirect:index";
                }else if (loggedInUser.getRole().equals("Donor")) {
                    addUserInSession(loggedInUser, session);
                    System.out.println("route to dashboard_user");
                    System.out.println(loggedInUser);
                    return "redirect:index";
                } else {
                    m.addAttribute("err", "invalid user role");
                    return "redirect:index";
                }
            }
    }

    @RequestMapping(value = {"/logout"})
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:index?act=lo";
    }

    @RequestMapping(value = "/user_dashboard")
    public String userDashboard() {
        return "dashboard_user"; // /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/admin_dashboard")
    public String adminDashboard() {
        return "dashboard_admin"; // /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/admin_users")
    public String getUserList(Model m) {
        m.addAttribute("userList", userService.getUserList());
        return "donors"; //JSP
    }



    @RequestMapping(value = "/check_avail")
    @ResponseBody
    public String checkAvailability(@RequestParam String username) {
        if(userService.isUsernameExist(username)){
            return "This username is already taken. Choose another name";
        }else{
            return "Yes! You can take this";
        }
    }

    @RequestMapping(value = "/change_status")
    @ResponseBody
    public String changeLoginStatus(@RequestParam Integer userId, @RequestParam Integer loginStatus) {
        try {
            userService.changeLoginStatus(userId, loginStatus);
            return "SUCCESS: Status Changed";
        } catch (Exception e) {
            e.printStackTrace();
            return "ERROR: Unable to Change Status";
        }
    }

    @RequestMapping(value="/donors")
    public String donationPage(Model m, HttpSession session) {
        m.addAttribute("userList", userService.getUserList());
        session.setAttribute("currentPage", "Donors");
        return "index";
    }

    private void addUserInSession(User u, HttpSession session) {
        session.setAttribute("user", u);
        session.setAttribute("userId", u.getUserId());
        session.setAttribute("role", u.getRole());
    }
}