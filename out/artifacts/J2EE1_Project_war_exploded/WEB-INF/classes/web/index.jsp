<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/15/2021
  Time: 12:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>صفحه اصلی</title>
    <script src="Assets/JavaScript/Ajax.js"></script>
</head>


<jsp:include page="header_Template.jsp"/>


<body onload="getLists()" >


<c:if test="${sessionScope.roleName!=null&&sessionScope.UserID!=null}">
    <c:out value="${sessionScope.roleName}"/>
    <c:out value="${sessionScope.UserID}"/>
</c:if>
<br/><br/><br/>



<div class="container">
    <fieldset>

        <legend><h1>جدیدترین محصولات</h1></legend>
        <br />
        <div id="latestProducts">

        </div>
        <table class="table table-responsive table-hover" border="1" style="width: 100%;">
            <tr>
                <th>تصویر محصول</th>
                <th>دسته بندی</th>
                <th>کد محصول</th>
                <th>نام محصول</th>
<%--                <th>توضیحات</th>--%>
<%--                <th>موجودی</th>--%>
                <th>قیمت</th>
                <th>انتخاب</th>
            </tr>
            <c:if test="${sessionScope.FiveLastProductsList!=null}">
                <c:forEach items="${sessionScope.FiveLastProductsList}" var="p">
                    <tr>
                        <form action="/action/product/selectProduct">
                            <td><img src="${p.productImagePath}" alt="${p.product_name}"
                                     style="max-width:30%"/></td>
                            <td><input class="border-0" type="text" value="${p.category.category_name}" readonly/></td>
                            <td><input class="border-0" type="text" name="id" value="${p.id}" readonly/></td>
                            <td><input class="border-0" type="text" value="${p.product_name}" readonly/></td>
<%--                            <td><input type="text" value="${p.description}" readonly/></td>--%>
<%--                            <td><input type="text" value="${p.stock}" readonly/></td>--%>
                            <td><input class="border-0" type="text" value="${p.sellPrice}" readonly/></td>
                            <td><input class="btn btn-primary" type="submit" value="انتخاب" readonly/></td>
                        </form>
                    </tr>
                </c:forEach>
            </c:if>


        </table>

        <c:if test="${sessionScope.FiveLastProductsList==null||sessionScope.FiveLastProductsList.size()<=0}">
            <c:out value="محصولی یافت نشد"/>
        </c:if>
    </fieldset>


    <%--    <div class="album py-5 bg-light">--%>
    <%--        <div class="container">--%>

    <%--            <div class="row">--%>
    <%--                <c:forEach items="${sessionScope.FiveLastProductsList}" var="p">--%>
    <%--                    <div class="col-md-4">--%>
    <%--                        <div class="card mb-4 shadow-sm">--%>
    <%--                            <img src="${p.productImagePath}" alt="${p.product_name}"/></td>--%>
    <%--                            <div class="card-body">--%>
    <%--                                <p class="card-text">${p.description}</p>--%>
    <%--                                <div class="d-flex justify-content-between align-items-center">--%>
    <%--                                    <div class="btn-group">--%>
    <%--                                        <button type="button" class="btn btn-sm btn-outline-secondary">مشاهده</button>--%>
    <%--                                    </div>--%>
    <%--                                    <small class="text-muted">قیمت : ${p.sellPrice}</small>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </c:forEach>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <br/><br/><br/>

    <fieldset>
        <legend><h1>پرفروش ترین ها</h1></legend>
        <br />
        <table class="table table-hover " border="1" style="width: 100%;">
            <tr>
                <th>تصویر محصول</th>
                <th>دسته بندی</th>
                <th>کد محصول</th>
                <th>نام محصول</th>
<%--                <th>توضیحات</th>--%>
<%--                <th>موجودی</th>--%>
                <th>قیمت</th>
                <th>انتخاب</th>
            </tr>
            <c:if test="${sessionScope.FiveBestSellerProductsList!=null}">
                <c:forEach items="${sessionScope.FiveBestSellerProductsList}" var="p">
                    <tr>
                        <form action="/action/product/selectProduct">
                            <td><img src="${p.productImagePath}" alt="${p.product_name}"
                                     style="max-width:30%";"/></td>
                            <td><input class="border-0" type="text" value="${p.category.category_name}" readonly/></td>
                            <td><input class="border-0" type="text" name="id" value="${p.id}" readonly/></td>
                            <td><input class="border-0" type="text" value="${p.product_name}" readonly/></td>
<%--                            <td><input type="text" value="${p.description}" readonly/></td>--%>
<%--                            <td><input type="text" value="${p.stock}" readonly/></td>--%>
                            <td><input class="border-0" type="text" value="${p.sellPrice}" readonly/></td>
                            <td><input class="btn btn-primary" type="submit" value="انتخاب" readonly/></td>
                        </form>
                    </tr>
                </c:forEach>
            </c:if>
        </table>

        <c:if test="${sessionScope.FiveBestSellerProductsList==null||sessionScope.FiveBestSellerProductsList.size()<=0}">
            <c:out value="محصولی یافت نشد"/>
        </c:if>

    </fieldset>

</div>


<br/><br/><br/>

<div id="topSellers">

</div>


<script>
    function getLists() {
        if (performance.navigation.type == performance.navigation.TYPE_RELOAD ||${sessionScope.FiveLastProductsList==null||sessionScope.FiveBestSellerProductsList==null}) {
            window.location = "/action/product/get5lastItems";
        }
    }
</script>


</body>
</html>
