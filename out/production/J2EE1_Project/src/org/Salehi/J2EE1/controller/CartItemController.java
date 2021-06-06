package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.Cart;
import org.Salehi.J2EE1.model.entity.CartItem;
import org.Salehi.J2EE1.model.entity.Product;
import org.Salehi.J2EE1.model.entity.Users;
import org.Salehi.J2EE1.model.service.CartItemService;
import org.Salehi.J2EE1.model.service.ProductService;
import org.Salehi.J2EE1.model.service.UserService;
import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cartItem")
public class CartItemController {
    @Inject
    private CartItemService cartItemService;
    @Inject
    private ProductService productService;
    @Inject
    private UserService userService;

    @RequestMapping("/save")
    public String save(HttpServletRequest request, @Param long productId, HttpServletRequest servletRequest) {
        try {
            if (request.getSession().getAttribute("UserID") != null) {
                Product product = productService.findOneByID(productId);
                CartItem cartItem = new CartItem().setProduct(product).setQuantity(1);
                //
                Users user = userService.findOneByID(Long.parseLong(request.getSession().getAttribute("UserID").toString()));
                //check if item is in the list to change quantity
                if (user.getCart().getCartItems() != null && user.getCart().getCartItems().size() > 0) {
                    for (CartItem cartItem1 : user.getCart().getCartItems()) {
                        if (cartItem1.getProduct().getId() == product.getId()) {
                            System.out.println("item quantity changed");
                            cartItem1.setQuantity(cartItem1.getQuantity() + 1);
                            userService.update(user);
                            return "redirect:/action/cart/getUserCart";
                        }
                    }
                }
                //
                System.out.println("cart item is not empty and item added");
                user.getCart().getCartItems().add(cartItem);
                //
                System.out.println(user.getCart().getCartItems());
                userService.update(user);
            } else return "redirect:/public/login.jsp";

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/action/cart/getUserCart";
    }

    @RequestMapping("/updateQuantity")
    public String updateQuantity(@RequestParam("id") long id, @RequestParam("quantity") int quantity, HttpServletRequest request) {
        if (request.getSession().getAttribute("UserID") != null) {
            try {
                CartItem cartItem = cartItemService.findOneByID(id);
                if (cartItem.getProduct().getStock() < quantity) {
                    cartItem.setQuantity(cartItem.getProduct().getStock());
                } else {
                    cartItem.setQuantity(quantity);
                }
                cartItemService.update(cartItem);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "redirect:/action/cart/getUserCart";
        } else return "redirect:/public/login.jsp";
    }

    @RequestMapping("/delete")
    public String deleteItem(@ModelAttribute CartItem cartItem, HttpServletRequest request) {
        if (request.getSession().getAttribute("UserID") != null) {
            cartItemService.remove(cartItem);
            return "redirect:/action/cart/getUserCart";
        } else return "redirect:/public/login.jsp";
    }
}
