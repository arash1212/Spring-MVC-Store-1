package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.TechnicianRequests;
import org.Salehi.J2EE1.model.entity.Users;
import org.Salehi.J2EE1.model.service.TechnicianRequestService;
import org.Salehi.J2EE1.model.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/technicianRequest")
public class TechnicianRequestController {
    @Inject
    private TechnicianRequestService technicianRequestService;
    @Inject
    private UserService userService;

    @RequestMapping("/save")
    public String save(@ModelAttribute TechnicianRequests technicianRequests, HttpServletRequest request) {
        try {
            Users users = userService.findOneByID(Long.parseLong(request.getSession().getAttribute("UserID").toString()));
            technicianRequests.setRequestDate(new Date());
            technicianRequests.setStateOfRequest("ثبت شده");
            technicianRequests.setUsers(users);
            technicianRequestService.save(technicianRequests);
            return "redirect:/index.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in saving technician request");
            return "redirect:/index.jsp";
        }
    }

    @RequestMapping("/findAllUserTechnicianRequests")
    public String findAllUserTechnicianRequests(HttpServletRequest request) {
        try {
            Users users = userService.findOneByID(Long.parseLong(request.getSession().getAttribute("UserID").toString()));
            System.out.println(users.getId() + "u id");
            request.getSession().setAttribute("userTechnicianRequestList", technicianRequestService.getUserTechnicianRequests(users.getId()));
            return "/user/technicianRequests";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in finding user requests");
            return "redirect:/user/technicianRequests.jsp";
        }
    }

    @RequestMapping("/findAll")
    public String findAll(HttpServletRequest request) {
        try {
            if (request.getSession().getAttribute("roleName").equals("admin")) {
                request.getSession().setAttribute("technicianRequestsList", technicianRequestService.findAll());
                return "/admin/technicianRequestsList";
            } else {
                return "redirect:/public/login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in getting technician order list ");
            return "redirect:/admin/index.jsp";
        }
    }
}
