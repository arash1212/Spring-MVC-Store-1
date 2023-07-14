package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.Comments;
import org.Salehi.J2EE1.model.entity.Product;
import org.Salehi.J2EE1.model.service.CommentService;
import org.Salehi.J2EE1.model.service.ProductService;
import org.Salehi.J2EE1.model.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Inject
    private CommentService commentService;
    @Inject
    private UserService userService;
    @Inject
    private ProductService productService;

    @RequestMapping("/save")
    public String save(@ModelAttribute Comments comments, @RequestParam("productID") long productID, @RequestParam("userID") long userID, HttpServletRequest request) {
        Product product = productService.findOneByID(productID);
        //
        comments.setProduct(product);
        comments.setUsers(userService.findOneByID(userID));
        //
        commentService.save(comments);
        request.getSession().setAttribute("selectedProduct", product);
        //
        return "redirect:/action/product/selectProduct?id=" + productID;
    }

    @RequestMapping("/delete")
    public String delete(@ModelAttribute Comments comments, HttpServletRequest request, @RequestParam("productID") long productID) {
        if (request.getSession().getAttribute("roleName").equals("admin")) {
            commentService.remove(comments);
        }
        return "redirect:/action/product/selectProduct?id=" + productID;
    }

}
