package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.Cart;
import org.Salehi.J2EE1.model.entity.CartItem;
import org.Salehi.J2EE1.model.entity.Users;
import org.Salehi.J2EE1.model.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UsersController {
    @Inject
    private UserService userService;

    @RequestMapping("/save")
    public String save(@ModelAttribute Users users) {
        try {
            Users users1 = userService.findUserByEmail(users.getEmail());
            System.out.println("email registered before");
            return "redirect:/error-pages/signup-duplicate-email-error.jsp";
        } catch (NoResultException e) {
            Cart cart = new Cart().setCartItems(new ArrayList<CartItem>());
            users.setCart(cart);
            userService.save(users);
            System.out.println("user registered");
            return "redirect:/public/login.jsp";
        }
    }

    @RequestMapping("/delete")
    public void delete(@ModelAttribute Users users) {
        userService.remove(users);
    }

    @RequestMapping("/update")
    public void update(@ModelAttribute Users users) {
        userService.update(users);
    }

    @RequestMapping("/findOneByEmail")
    public String findOneByEmail(@ModelAttribute Users users, HttpServletRequest request) {
        try {
            Users users1 = userService.findUserByEmailWithUserRole(users.getEmail());
            if (users1.getPassword().equals(users.getPassword())) {
                request.getSession().setAttribute("roleName", users1.getUser_role().getRole_name());
                request.getSession().setAttribute("UserID", users1.getId());
                request.getSession().setAttribute("userInfo", userService.findOneUserByIDWithUserInfo(users1.getId()).getUserInfo());
                System.out.println("user logged in");
            } else {
                return "redirect:/error-pages/signIn-wrong-user-pass.jsp";
            }
        } catch (NoResultException e) {
            System.out.println("wrong user or password");
            return "redirect:/error-pages/signIn-wrong-user-pass.jsp";
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        return "redirect:/index.jsp";
    }


    @RequestMapping("/findAll")
    public List<Users> findAll() {
        return userService.findAll();
    }

    @RequestMapping("/signOut")
    public String signOut(HttpServletRequest request){
        request.getSession().removeAttribute("roleName");
        request.getSession().removeAttribute("UserID");
        request.getSession().removeAttribute("userInfo");
        return "redirect:/index.jsp";
    }
}
