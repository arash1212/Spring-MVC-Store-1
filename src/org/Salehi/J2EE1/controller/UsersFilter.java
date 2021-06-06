package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.Roles;
import org.Salehi.J2EE1.model.service.RolesService;
import org.Salehi.J2EE1.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.util.List;

public class UsersFilter implements Filter {
    @Autowired
    private RolesService rolesService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //
        try {
            if (request.getSession().getAttribute("roleName") != null) {
                String url = request.getRequestURI();
                String path = url.split("/")[1];
                List<Roles> roles = rolesService.findAllByRoleName(request.getSession().getAttribute("roleName").toString());
                //
                for (Roles roles1 : roles) {
                    if (roles1.getAddress().equals(path)) {
                        filterChain.doFilter(servletRequest, servletResponse);
                        return;
                    }
                }
                System.out.println("access denied");
                response.sendRedirect("/public/login.jsp");
                //
            } else {
                System.out.println("login first");
                response.sendRedirect("/public/login.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {

    }
}
