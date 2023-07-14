<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/15/2021
  Time: 5:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>


<head>
    <title>صفحه محصولات</title>
    <script src="/Assets/JavaScript/Ajax.js"></script>
    <meta charset="utf-8"/>
</head>

<jsp:include page="/header_Template.jsp"/>


<body dir="rtl"
      onload="createSelect('categories','/action/category/findAllAsJSON','category_name','productCategory'),createSelect('searchCategories','/action/category/findAllAsJSON','category_name','searchCategoryText')">
<br/><br/>

<%--<input type="button" onclick="updateProductList()" value="بروزرسانی لیست محصولات">--%>

<%--<ul>--%>
<%--    <li><a href="/index.jsp">صفحه اصلی</a></li>--%>
<%--</ul>--%>

<div class="container">
    <div class="jumbotron">
        <div class="container">
            <h2 style="text-align: center">افزودن محصول جدید</h2>
            <br/><br/>
            <form class="form-group" action="/action/product/save" method="get" enctype="multipart/form-data">
                <label for="product_name"> نام محصول : </label>
                <input class="form-control" id="product_name" type="text" name="product_name" required/><br/>
                <label for="description"> توضیحات محصول : </label>
                <input class="form-control" id="description" type="text" name="description" required/><br/>
                <label for="stock">تعداد(موجودی) : </label>
                <input class="form-control" id="stock" type="text" name="stock" required/><br/>
                <label for="buyPrice">قیمت خرید :</label>
                <input class="form-control" id="buyPrice" type="text" name="buyPrice" required/><br/>
                <label for="profitPercentage">درصد سود :</label>
                <input class="form-control" id="profitPercentage" type="text" name="profitPercentage"
                       required/><br/>
                <%--    <input type="text" name="category" required/> نام دسته بندی اصلی <br/>--%>
                <br/>
                <div id="categories"> دسته بندی اصلی

                </div>
                <br/><br/>
                <input class="btn btn-primary" type="submit" value="ثبت محصول">
                <br/>
                <br/>
            </form>
        </div>
    </div>
</div>


<br/>

<div class="container-fluid">
    <fieldset>
        <legend>لیست تمام محصولات</legend>
        <form>
            <%--        <input type="text" name="categoryName" id="categoryText">--%>
            <input class="btn btn-primary" type="button" onclick="updateProductList()" value="همه محصولات">
            <br/><br/>

            <div id="searchCategories">

                <input class="btn btn-primary" type="button"
                       onclick="updateProductListWithCategoryName(document.getElementById('searchCategoryText').value) ,createSelect('productCategory','/action/category/pageWithCategory.jsp?url=/admin/products.jsp','category_name','productCategory') "
                       value="جستجو براساس دسته بندی"/>
            </div>

        </form>

        <table class="table-responsive thead-dark" border="1" style="width: 100%;">
            <tr>
                <th>دسته بندی</th>
                <th>کد محصول</th>
                <th>نام محصول</th>
                <th>توضیحات</th>
                <th>درصد سود</th>
                <th>موجودی</th>
                <th>قیمت خرید</th>
                <th>قیمت فروش</th>
                <th>بروزرسانی</th>
                <th>حذف</th>
                <th>افزودن/تغییر تصویر محصول</th>
            </tr>
            <c:if test="${sessionScope.productPagingList!=null}">
                <c:forEach items="${sessionScope.productPagingList}" var="p">
                    <tr>
                        <form action="/action/product/update">
                                <%--                    <td><input type="text" name="category" value="${p.category.category_name}"/></td>--%>
                            <td>
                                <select class="form-control" name="category_name" select>
                                    <c:forEach items="${sessionScope.categoryList}" var="category">
                                        <c:if test="${category.category_name==p.category.category_name}">
                                            <option name="category_name" selected>${category.category_name}</option>
                                        </c:if>
                                        <option name="category_name">${category.category_name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input class="form-control" type="text" name="id" value="${p.id}" readonly/></td>
                            <td><input class="form-control" type="text" name="product_name" value="${p.product_name}"/>
                            </td>
                            <td><input class="form-control" type="text" name="description" value="${p.description}"/>
                            </td>
                            <td><input class="form-control" type="text" name="profitPercentage"
                                       value="${p.profitPercentage}"/></td>
                            <td><input class="form-control" type="text" name="stock" value="${p.stock}"/></td>
                            <td><input class="form-control" type="text" name="buyPrice" value="${p.buyPrice}"/></td>
                            <td><input class="form-control" type="text" name="sellPrice" value="${p.sellPrice}"
                                       readonly/></td>
                            <td><input class="btn btn-secondary" type="submit" value="بروزرسانی"/></td>
                            <td><input class="btn btn-secondary" type="button" value="حذف" onclick="del(${p.id})"/></td>
                            <td><input class="btn btn-secondary" type="button" value="افزودن/تغییر تصویر"
                                       onclick="addProductImage(${p.id})"/>
                            </td>
                        </form>
                    </tr>
                </c:forEach>
            </c:if>
        </table>

        <br/><br/>
    </fieldset>
</div>
<!--pages-->
<div class="container-fluid">
    <ul class="pagination">
        <c:forEach begin="1" end="${(sessionScope.productsCount/10)+1}" var="i">
            <li class="page-item"><a href="/action/product/page?page=${i}&url=/admin/products.jsp"
                                     class="page-link">${i}</a></li>
        </c:forEach>
    </ul>
</div>

<br/><br/>

<%--<div class="container-fluid">--%>
<%--    <fieldset>--%>
<%--        <legend>پیدا کردن محصول با کد</legend>--%>
<%--        <table border="1" style="width: 100%;">--%>
<%--            <tr>--%>
<%--                <th>دسته بندی</th>--%>
<%--                <th>کد محصول</th>--%>
<%--                <th>نام محصول</th>--%>
<%--                <th>توضیحات</th>--%>
<%--                <th>قیمت خرید</th>--%>
<%--                <th>قیمت فروش</th>--%>
<%--                <th>بروزرسانی</th>--%>
<%--                <th>حذف</th>--%>
<%--            </tr>--%>

<%--        </table>--%>
<%--    </fieldset>--%>
<%--</div>--%>

<br/><br/>
</body>


<script>
    function del(id) {
        window.location = "/action/product/delete?id=" + id;
    }

    function addProductImage(id) {
        window.location = "/action/product/selectProductToChangeImage?id=" + id;
    }

    function updateProductList() {
        window.location = "/action/product/page?&url=/admin/products.jsp";
    }

    function updateProductListWithCategoryName(categoryName) {
        window.location = "/action/product/pageWithCategory.jsp?categoryName=" + categoryName + "&url=/admin/products.jsp";
    }
</script>


</html>
