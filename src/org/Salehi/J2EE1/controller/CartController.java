package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.Cart;
import org.Salehi.J2EE1.model.entity.Users;
import org.Salehi.J2EE1.model.service.CartService;
import org.Salehi.J2EE1.model.service.ProductService;
import org.Salehi.J2EE1.model.service.UserService;
import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Inject
    private CartService cartService;
    @Inject
    private UserService userService;
    @Inject
    private ProductService productService;

    @RequestMapping("/save")
    public String save(HttpServletRequest request, @Param long productId) {
        return null;
    }

    @RequestMapping("/delete")
    public String delete(@ModelAttribute Cart cart) {
        cartService.remove(cart);
        return "redirect:/action/user/cart/";
    }

    @RequestMapping("/update")
    public void update(@Param long productId, @Param long id, @Param int quantity, HttpServletRequest request) {
//        Users users = userService.findOneByID(Long.parseLong(request.getSession().getAttribute("UserID").toString()));
//        Product product = productService.findOneByID(productId);
//        //
//        Cart cart = new Cart().setId(id).setQuantity(quantity).setProduct(product).setUsers(users);
//        cartService.update(cart);
    }

    @RequestMapping("/updateQuantity")
    public String updateQuantity(@Param long id, @Param int quantity, HttpServletRequest request) {
        Cart cart = cartService.findOneByID(id);
        cartService.update(cart);
        return "redirect:/action/user/cart/";
    }

    @RequestMapping("/getUserCart")
    public String getUserCartList(HttpServletRequest request) {
        if(request.getSession().getAttribute("UserID")!=null) {
            Users user = userService.findOneByID(Long.parseLong(request.getSession().getAttribute("UserID").toString()));
            request.getSession().setAttribute("UserCart", user.getCart().getCartItems());
            return "redirect:/user/cart.jsp";
        }
        return "redirect:/public/login.jsp";
    }
}
