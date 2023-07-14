package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.UserInfo;
import org.Salehi.J2EE1.model.entity.Users;
import org.Salehi.J2EE1.model.service.UserInfoService;
import org.Salehi.J2EE1.model.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {
    @Inject
    private UserInfoService userInfoService;
    @Inject
    private UserService userService;

    @RequestMapping("/save")
    public String save(@ModelAttribute UserInfo userInfo, HttpServletRequest request) {
        try {
            Users users = userService.findOneByID(Long.parseLong(request.getSession().getAttribute("UserID").toString()));
            if (users.getUserInfo() == null) {
                userInfoService.save(userInfo);
                users.setUserInfo(userInfo);
                userService.update(users);
                userService.update(users);
                return "redirect:/action/userInfo/getUserInfo";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/action/userInfo/getUserInfo";
    }

    @RequestMapping("/update")
    public String update(@ModelAttribute UserInfo userInfo, HttpServletRequest request) {
        try {
            Users users = userService.findOneByID(Long.parseLong(request.getSession().getAttribute("UserID").toString()));
            if (users.getUserInfo() != null) {
                userInfoService.update(userInfo);
                return "redirect:/action/userInfo/getUserInfo";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/action/userInfo/getUserInfo";
    }

    @RequestMapping("/getUserInfo")
    public String getUserInfo(HttpServletRequest request) {
        try {
            request.getSession().setAttribute("userInfo", userService.findOneUserByIDWithUserInfo(Long.parseLong(request.getSession().getAttribute("UserID").toString())).getUserInfo());
            return "redirect:/user/userInfo.jsp";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/user/userInfo.jsp";
    }


}
