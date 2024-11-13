package com.yash.ngodonation.controller;

import com.yash.ngodonation.command.LoginCommand;
import com.yash.ngodonation.command.UserCommand;
import com.yash.ngodonation.domain.User;
import com.yash.ngodonation.exception.UserBlockedException;
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

    @RequestMapping(value = {"/", "/index"})
    public String index(Model m) {
        m.addAttribute("command", new LoginCommand());
        return "index"; // /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/reg_form")
    public String registrationForm(Model m) {
        UserCommand cmd = new UserCommand();
        m.addAttribute("command", cmd);
        return "register";//JSP
    }

    @RequestMapping(value = "/register_user")
    public String registerUser(@ModelAttribute("command") UserCommand cmd, Model m) {
        try {
            System.out.println("usercontroller -> register");
            User user = cmd.getUser();
            userService.register(user);
            return "redirect:index?act=reg"; //Login Page
        } catch (DuplicateKeyException e) {
            e.printStackTrace();
            m.addAttribute("err", "Username is already registered. Please select another username.");
            return "reg_form";//JSP
        }
    }

    @RequestMapping(value = "/login_form")
    public String loginForm(Model m) {
        LoginCommand cmd = new LoginCommand();
        m.addAttribute("command", cmd);
        return "login";//JSP
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String handleLogin(@ModelAttribute("command") LoginCommand cmd, Model m, HttpSession session) {
            System.out.println("inside user login");
            User loggedInUser = userService.login(cmd.getLoginName(), cmd.getPassword());
            System.out.println(loggedInUser);
            if(loggedInUser == null) {
                m.addAttribute("err", "Login failed enter valid credentials");
                return "index";
            } else {
                //success
                // check role and redirect to appropriate dashboard
                if(loggedInUser.getRole().equals("Admin")) {
                    System.out.println("trying to login admin");
                    addUserInSession(loggedInUser, session);
                    System.out.println("route to dashboard_admin");
                    return "dashboard_admin";
                }else if (loggedInUser.getRole().equals("Donor")) {
                    addUserInSession(loggedInUser, session);
                    System.out.println("route to dashboard_user");
                    System.out.println(loggedInUser);
                    return "dashboard_user";
                } else {
                    m.addAttribute("err", "invalid user role");
                    return "index";
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
        System.out.println("user dashboard");
        return "dashboard_user"; // /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/admin_dashboard")
    public String adminDashboard() {
        System.out.println("admin dashboard");
        return "dashboard_admin"; // /WEB-INF/view/index.jsp
    }

    @RequestMapping(value = "/admin_users")
    public String getUserList(Model m) {
        m.addAttribute("userList", userService.getUserList());
        return "users"; //JSP
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

    private void addUserInSession(User u, HttpSession session) {
        session.setAttribute("user", u);
        session.setAttribute("userId", u.getUserId());
        session.setAttribute("role", u.getRole());
    }
}