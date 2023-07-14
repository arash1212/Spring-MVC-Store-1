<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/22/2021
  Time: 7:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>جستجو در محصولات</title>
    <script src="/Assets/JavaScript/Ajax.js"></script>
</head>

<jsp:include page="/header_Template.jsp"/>


<body dir="rtl"
      onload="createSelect('categories','/action/category/findAllAsJSON','category_name','searchCategoryText'),getLists()">
<%--<a href="/index.jsp">صفحه اصلی</a>--%>
<br/> <br/>


<br/>
<div class="container">

    <h1>جستجو در محصولات</h1>

    <br/><br/>

    <div id="categories"> دسته بندی محصول مورد نظر :

        <input class="btn btn-primary" type="button" value="بررسی"
               onclick="updateProductListWithCategoryName(document.getElementById('searchCategoryText').value)">
    </div>

    <br/>

    <fieldset>
        <c:if test="${param.categoryName!=null}">
            <legend> محصولات یافت شده در دسته بندی : ${param.categoryName}</legend>
        </c:if>
        <c:if test="${param.categoryName==null}">
            <legend> محصولات یافت شده در دسته بندی : همه</legend>
        </c:if>
        <br/><br/>
        <table class="table table-hover table-responsive table-bordered" style="width: 100%">
            <th>تصویر محصول</th>
            <th>کد محصول</th>
            <th>دسته بندی</th>
            <th>نام محصول</th>
            <th>قیمت</th>
            <th>انتخاب محصول</th>
            <c:if test="${sessionScope.productPagingList!=null}">
                <c:forEach items="${sessionScope.productPagingList}" var="p">
                    <tr>
                        <form action="/action/product/selectProduct">
                            <td><img src="${p.productImagePath}" alt="${p.product_name}"
                                     style="max-width:50%"/></td>
                            <td><input type="text" name="id" value="${p.id}" readonly/></td>
                            <td><input type="text" name="id" value="${p.category.category_name}" readonly/></td>
                            <td><input type="text" name="product_name" value="${p.product_name}" readonly/></td>
                            <td><input type="text" name="sellPrice" value="${p.sellPrice}" readonly/></td>
                            <td><input class="btn btn-primary" type="submit" value="انتخاب"/></td>
                        </form>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${sessionScope.productPagingList==null||sessionScope.productPagingList.size()<=0}">
                <c:out value="محصولی یافت نشد"/>
            </c:if>
        </table>

        <!--pages-->
        <div class="container-fluid">
            <ul class="pagination">
                <c:forEach begin="1" end="${(sessionScope.productsCount/10)+1}" var="i">
                    <c:if test="${param.categoryName==null}">
                        <li class="page-item"><a href="/action/product/page?page=${i}&url=/public/search.jsp"
                                                 class="page-link">${i}</a></li>
                    </c:if>
                    <c:if test="${param.categoryName!=null}">
                        <li class="page-item"><a
                                href="/action/product/pageWithCategory?page=${i}&url=/public/search.jsp&categoryName="
                                +${param.categoryName} class="page-link">${i}</a></li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </fieldset>
</div>

<br/><br/><br/>

<script>
    function updateProductList() {
        window.location = "/action/product/findAllforSearch";
    }

    function getLists() {
        if (performance.navigation.type == performance.navigation.TYPE_RELOAD) {
            window.location = "/action/product/page?page=1&url=/public/search.jsp";
        }
    }

    function updateProductListWithCategoryName(categoryName) {
        window.location = "/action/product/pageWithCategory?categoryName=" + categoryName + "&url=/public/search.jsp";
    }
</script>


</body>
</html>
