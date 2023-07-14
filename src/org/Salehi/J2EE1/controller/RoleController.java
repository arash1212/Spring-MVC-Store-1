package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.Roles;
import org.Salehi.J2EE1.model.service.RolesService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/roles")
public class RoleController {

    @Inject
    private RolesService rolesService;

    @RequestMapping("/save")
    public String save(@ModelAttribute Roles roles, HttpServletRequest request) {
        if (request.getSession().getAttribute("roleName").equals("admin")) {
            try {
                rolesService.save(roles);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "/action/roles/findAll";

        }
        return "redirect:/public/login.jsp";
    }

    @RequestMapping("/update")
    public String update(@ModelAttribute Roles roles, HttpServletRequest request) {
        if (request.getSession().getAttribute("roleName").equals("admin")) {
            try {
                rolesService.update(roles);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "/adction/roles/findAll";

        }
        return "redirect:/public/login.jsp";
    }

    @RequestMapping("/remove")
    public String remove(@ModelAttribute Roles roles, HttpServletRequest request) {
        if (request.getSession().getAttribute("roleName").equals("admin")) {
            try {
                rolesService.remove(roles);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "/adction/roles/findAll";

        }
        return "redirect:/public/login.jsp";
    }

    @RequestMapping("/findAll")
    public String findAll(@ModelAttribute Roles roles, HttpServletRequest request) {
        if (request.getSession().getAttribute("roleName").equals("admin")) {
            try {
                request.getSession().setAttribute("rolesList", rolesService.findAll());
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "/admin/roles-managment";
        }else
        return "redirect:/public/login.jsp";
    }
}
