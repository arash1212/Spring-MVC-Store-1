package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.Roles;
import org.Salehi.J2EE1.model.service.RolesService;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.inject.Inject;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(name = "setup database", loadOnStartup = 1)
public class DataBaseFirstSetup extends HttpServlet {
    @Inject
    private RolesService rolesService;
    private String isAlreadyRunOnce;

    @Override
    public void init(ServletConfig config) {
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
        System.out.println("database setup");
        //
        Roles roles = new Roles().setRole_name("admin").setAddress("admin");
        Roles roles1 = new Roles().setRole_name("admin").setAddress("user");
        Roles roles2 = new Roles().setRole_name("user").setAddress("user");
        //
        rolesService.save(roles);
        rolesService.save(roles1);
        rolesService.save(roles2);
    }


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("service");
    }
}
