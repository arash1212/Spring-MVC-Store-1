package org.Salehi.J2EE1.controller;

import org.Salehi.J2EE1.model.entity.Category;
import org.Salehi.J2EE1.model.entity.Product;
import org.Salehi.J2EE1.model.service.CategoryService;
import org.Salehi.J2EE1.model.service.CommentService;
import org.Salehi.J2EE1.model.service.ProductService;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Inject
    private ProductService productService;
    @Inject
    private CategoryService categoryService;
    @Inject
    private CommentService commentService;

    @RequestMapping(value = "/save")
    public String save(@ModelAttribute Product product, @ModelAttribute("category_name") String categoryName, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (request.getSession().getAttribute("roleName").equals("admin")) {
                Category category = categoryService.findOneByName(categoryName);
                product.setCategory(category);
                product.setProductImagePath("/Assets/images/no-image.png");
                productService.save(product);
            } else {
                response.sendRedirect("/public/login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/action/product/page?url=/admin/products";

    }

    @RequestMapping("/saveImage")
    public String saveProductImage(@RequestParam("productImage") CommonsMultipartFile file, HttpSession session, @RequestParam("product_id") long product_id) {
        try {
            String filename = file.getName();
            byte[] bytes = file.getBytes();
            File imagesDirectory = new File(session.getServletContext().getRealPath("/") + "/images/");
            if (imagesDirectory.mkdir() && !imagesDirectory.exists()) {
                System.out.println("images directory created");
            } else {
                System.out.println("images directory exist");
            }
            //
            Product product = productService.findOneByID(product_id);
            File file1 = new File(session.getServletContext().getRealPath("/") + "/images/" + product.getProduct_name() + "_" + product.getId() + ".png");
            System.out.println("Created " + file.getOriginalFilename());
            //
            FileOutputStream fileOutputStream = new FileOutputStream(file1);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
            bufferedOutputStream.write(bytes);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();
            //
            product.setProductImagePath("/images/" + product.getProduct_name() + "_" + product.getId() + ".png");
            System.out.println("file created at " + "/images/" + product.getProduct_name() + "_" + product.getId() + ".png");
            productService.update(product);
            return "redirect:/action/product/findAll";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/action/product/findAll";
        }
    }

    @RequestMapping("/delete")
    public String delete(@ModelAttribute Product product, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        try {
            if (request.getSession().getAttribute("roleName").equals("admin")) {
                Product product1 = productService.findOneByID(product.getId());
                //
                File file = new File(session.getServletContext().getRealPath("/") + "\\" + product1.getProductImagePath());
                System.out.println("file a path : " + file.getAbsoluteFile());
                //
                if (file.delete()) {
                    productService.remove(product1);
                    System.out.println("product and product picture removed");
                } else {
                    System.out.println("error in removing product picture");
                }
                return "redirect:/action/product/findAll";
            } else {
                return "redirect:/public/login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/action/product/findAll";
        }
    }

    @RequestMapping("/update")
    public String update(@ModelAttribute Product product, @RequestParam("category_name") String categoryName) {
        Category category = categoryService.findOneByName(categoryName);
        //for keeping the product image while updating product
        Product product1 = productService.findOneByID(product.getId());
        product.setProductImagePath(product1.getProductImagePath());
        //
        System.out.println("stock : "+product.getStock());
        product.setCategory(category);
        productService.update(product);
        return "redirect:/action/product/page?url=/admin/products.jsp";
    }

    @RequestMapping("/findAll")
    public String findAll(HttpServletRequest request) {
        try {
            request.getSession().setAttribute("categoryList", categoryService.findAll());
            request.getSession().setAttribute("productList", productService.findAll());
            return "/admin/products";
        } catch (Exception e) {
            e.printStackTrace();
            return "/admin/products";
        }
    }

    @RequestMapping("/findAllforSearch")
    public String findAllForSearch(HttpServletRequest request) {
        try {
            request.getSession().setAttribute("productList", productService.findAll());
            System.out.println("userSearch");
            return "redirect:/public/search.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("userSearch");
            return "redirect:/public/search.jsp";
        }
    }

    @RequestMapping("/findAllWithCategory")
    public String findAllWithCategoryName(HttpServletRequest request, @RequestParam String
            categoryName, @RequestParam("url") String url) {
        try {
            request.getSession().setAttribute("productList", productService.findAllWithCategory(categoryName));
            request.getSession().setAttribute("categoryList", categoryService.findAll());
            return url;
        } catch (Exception e) {
            e.printStackTrace();
            return url;
        }
    }

    @RequestMapping(value = "/get5lastItems")
    public String find5LatestProducts(HttpServletRequest request) {
        try {
            request.getSession().setAttribute("FiveLastProductsList", productService.getFiveLastProducts());
            request.getSession().setAttribute("FiveBestSellerProductsList", productService.getFiveBestSellers());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/index.jsp";

    }

    @RequestMapping("/selectProduct")
    public String selectProduct(@ModelAttribute Product product, HttpServletRequest request) {
        request.getSession().setAttribute("selectedProduct", productService.findOneByID(product.getId()));
        request.getSession().setAttribute("selectedProductComments", commentService.findAllByProductID(product.getId()));
        return "redirect:/public/product.jsp?id=" + product.getId();
    }

    @RequestMapping("/selectProductToChangeImage")
    public String selectProductToChangeImage(@ModelAttribute Product product, HttpServletRequest request) {
        if (request.getSession().getAttribute("roleName").equals("admin")) {
            request.setAttribute("selectedProductToChangeImage", productService.findOneByID(product.getId()));
            return "/admin/productImage";
        } else {
            return "redirect:/public/login.jsp";
        }
    }

    @RequestMapping("/page")
    public String paging(HttpServletRequest request, @RequestParam(value = "url") String url) {
        if (request.getParameter("page") != null) {
            request.getSession().setAttribute("categoryList", categoryService.findAll());
            request.getSession().setAttribute("productPagingList", productService.productPaging(Integer.parseInt(request.getParameter("page"))));
        }
        else {
            request.getSession().setAttribute("categoryList", categoryService.findAll());
            request.getSession().setAttribute("productPagingList", productService.productPaging(1));
        }
        return "redirect:/action/product/getProductsCount?url=" + url;

    }

    @RequestMapping("/pageWithCategory")
    public String pagingWithCategory(HttpServletRequest request, @RequestParam("categoryName") String categoryName, @RequestParam(value = "url") String url) {
        if (request.getParameter("page") != null) {
            request.getSession().setAttribute("categoryList", categoryService.findAll());
            request.getSession().setAttribute("productPagingList", productService.productPagingWithCategory(Integer.parseInt(request.getParameter("page")), categoryName));
        }
        else {
            request.getSession().setAttribute("categoryList", categoryService.findAll());
            request.getSession().setAttribute("productPagingList", productService.productPagingWithCategory(1, categoryName));
        }
        return "redirect:/action/product/getProductsCount?categoryName=" + categoryName + "&url=" + url;

    }

    @RequestMapping("/getProductsCount")
    public String getProductsCount(HttpServletRequest request, @RequestParam(value = "categoryName", required = false) String categoryName, @RequestParam(value = "url") String url) {
        try {
            if (categoryName == null || categoryName.isEmpty()) {
                request.getSession().setAttribute("productsCount", productService.findAll().size());
            } else {
                request.getSession().setAttribute("productsCount", productService.findAllWithCategory(categoryName).size());
            }
            System.out.println(categoryName + "is category");
            return "redirect:" + url + "?page=1&category_name=" + categoryName;
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:" + url + "?page=1&category_name=" + categoryName;
        }
    }

}
