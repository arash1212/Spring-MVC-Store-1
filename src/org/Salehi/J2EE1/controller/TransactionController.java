package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.CartItem;
import org.Salehi.J2EE1.model.entity.Product;
import org.Salehi.J2EE1.model.entity.Transaction;
import org.Salehi.J2EE1.model.entity.Users;
import org.Salehi.J2EE1.model.service.CartService;
import org.Salehi.J2EE1.model.service.ProductService;
import org.Salehi.J2EE1.model.service.TransactionService;
import org.Salehi.J2EE1.model.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/transaction")
public class TransactionController {
    @Inject
    private TransactionService transactionService;
    @Inject
    private UserService userService;
    @Inject
    private CartService cartService;
    @Inject
    private ProductService productService;

    @RequestMapping("/save")
    public String save(HttpServletRequest request) {
        try {
            Users users = userService.findOneByID(Long.parseLong(request.getSession().getAttribute("UserID").toString()));
            if (users.getUserInfo() != null) {
                Transaction transaction = new Transaction().setUsers(users);
                //add user Cart items to Transaction CartItem List
                List<CartItem> cartItems = new ArrayList<>();
                for (CartItem cartItem : users.getCart().getCartItems()) {
                    //check if enough item is exists to buy
                    if (cartItem.getQuantity() <= cartItem.getProduct().getStock()) {
                        cartItems.add(cartItem);
                        cartItem.getProduct().setStock(cartItem.getProduct().getStock() - cartItem.getQuantity());
                        cartItem.getProduct().setSaleAmount(cartItem.getProduct().getSaleAmount() + cartItem.getQuantity());
                        productService.update(cartItem.getProduct());
                    } else {
                        //if item stock is less than what user wants
                        return "redirect:/error-pages/item_stock_error.jsp";
                    }
                }
                //
                transaction.setCartItems(cartItems);
                //clear user cart after adding cart items to transaction cart item list
                users.getCart().getCartItems().clear();
                //
                transaction.setDate_added(new Date());
                transaction.setStateOfTransaction("ثبت شده");
                //
                //
                transactionService.save(transaction);
                userService.update(users);
                //
                request.getSession().setAttribute("UserCart", users.getCart().getCartItems());
                System.out.println("transaction saved");
                return "redirect:/action/transaction/pageWithUserID?id=" + users.getId()+"&url=/user/transactions.jsp";
            } else {
                System.out.println("transaction error : userinfo is not saved");
                return "redirect:/error-pages/transaction-empty-userInfo-error.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in saving transaction");
            return "redirect:/index.jsp";
        }

    }

    @RequestMapping("/getAllUserTransactions")
    public String getAllUserTransactions(HttpServletRequest request) {
        if (request.getSession().getAttribute("UserID") != null) {
            try {
                Users users = userService.findOneByID(Long.parseLong(request.getSession().getAttribute("UserID").toString()));
                //get list of all transactions for logged in user
                request.getSession().setAttribute("transactionsList", transactionService.findAllUserTransactions(users.getId()));
                return "redirect:/user/transactions.jsp";
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("error in getting user transaction list");
                return "redirect:/user/index.jsp";
            }
        }
        return "redirect:/user/index.jsp";
    }

    @RequestMapping("/showTransactionDetail")
    public String showTransactionDetail(@RequestParam("id") long id, @RequestParam("roleName") String roleName, @RequestParam(value = "userID", required = false) Long userID, HttpServletRequest request) {
        if (request.getSession().getAttribute("UserID") != null) {
            try {
                //get detail of transaction that user selected
                request.getSession().setAttribute("orderDetail", transactionService.findOneById(id).getCartItems());
                //check if user is at admin transaction page or user's to redirect to it's own transaction detail page
                if (roleName.equals("user")) {
                    return "redirect:/user/transactionDetails.jsp?id=" + id;
                } else if (roleName.equals("admin")) {
                    request.getSession().setAttribute("selectedOrderUser", userService.findOneUserByIDWithUserInfo(userID));
                    return "redirect:/admin/transactionDetail.jsp?id=" + id + "&userID=" + userID;
                } else {
                    return "redirect:/public/login.jsp";
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("error in order detail");
                return "redirect:/index.jsp";
            }
        } else return "redirect:/public/login.jsp";
    }

    @RequestMapping("/changeTransactionStateToDone")
    public String changeTransactionStateToDone(@RequestParam("id") long id, HttpServletRequest request) {
        try {
            if (request.getSession().getAttribute("roleName").equals("admin")) {
                Transaction transaction = transactionService.findOneById(id);
                transaction.setDate_transaction_done(new Date());
                transaction.setStateOfTransaction("انجام شده");
                transactionService.update(transaction);
                return "redirect:/action/transaction/page?url=/admin/transactions-managment.jsp";
            } else {
                return "redirect:/public/login.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in chaning transaction state");
            return "redirect:/action/transaction/page?url=/admin/transactions-managment.jsp";
        }
    }

    @RequestMapping("/findAll")
    public String findAll(HttpServletRequest request) {
        try {
            //only admin can get list of all transactions
            if (request.getSession().getAttribute("roleName").equals("admin")) {
                request.getSession().setAttribute("allTransactionsList", transactionService.findAll());
                return "redirect:/transaction/page";
            } else {
                return "redirect:/public/login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/admin/index.jsp";
        }
    }

    //paging
    @RequestMapping("/page")
    public String paging(HttpServletRequest request, @RequestParam(value = "url") String url) {
        if (request.getSession().getAttribute("roleName").equals("admin")) {
            try {
                if (request.getParameter("page") != null) {
                    request.getSession().setAttribute("transactionPagingList", transactionService.transactionPaging(Integer.parseInt(request.getParameter("page"))));
                } else {
                    request.getSession().setAttribute("transactionPagingList", transactionService.transactionPaging(1));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return "redirect:/action/transaction/getTransactionsCount?url=" + url;
        } else return "redirect:/public/login.jsp";

    }

    @RequestMapping("/pageWithUserID")
    public String pagingWithID(HttpServletRequest request, @RequestParam(value = "url") String url) {
        if (request.getParameter("page") != null) {
            request.getSession().setAttribute("transactionPagingList", transactionService.transactionPagingWithUserID(Integer.parseInt(request.getParameter("page")), Long.parseLong(request.getSession().getAttribute("UserID").toString())));
        } else {
            request.getSession().setAttribute("transactionPagingList", transactionService.transactionPagingWithUserID(1, Long.parseLong(request.getSession().getAttribute("UserID").toString())));
        }
        return "redirect:/action/transaction/getTransactionsCount?id=" + request.getSession().getAttribute("UserID") + "&url=" + url;

    }

    @RequestMapping("/getTransactionsCount")
    public String getProductsCount(HttpServletRequest request, @RequestParam(value = "id", required = false) String id, @RequestParam(value = "url") String url) {
        try {
            if (id == null || id.isEmpty()) {
                request.getSession().setAttribute("transactionCount", transactionService.findAll().size());
            } else {
                request.getSession().setAttribute("transactionCount", transactionService.findAllUserTransactions(Long.parseLong(id)).size());
            }
            System.out.println(id + "is id");
            return "redirect:" + url + "?page=1&id=" + id;
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:" + url + "?page=1&id=" + id;
        }
    }


}
