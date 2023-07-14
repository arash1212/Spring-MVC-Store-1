package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.Category;
import org.Salehi.J2EE1.model.service.CategoryService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Service
@RequestMapping("/category")
public class CategoryController {

    @Inject
    private CategoryService categoryService;

    @RequestMapping("/save")
    public String save(@ModelAttribute Category category) {
        try {
            categoryService.save(category);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/action/category/findAll";
    }

    @RequestMapping("/delete")
    public String delete(@ModelAttribute Category category) {
        try {
            categoryService.remove(category);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/action/category/findAll";
    }

    @RequestMapping("/update")
    public String update(@ModelAttribute Category category) {
        try {
            categoryService.update(category);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/action/category/findAll";
    }

    @RequestMapping("/findAll")
    public String findAll(HttpServletRequest request) {
        request.getSession().setAttribute("categoryList", categoryService.findAll());
        return "redirect:/admin/category.jsp";
    }

    @RequestMapping("/findAllAsJSON")
    @ResponseBody
    public Object findAllAsJSON(HttpServletRequest request) {
        return categoryService.findAll();
    }
}
