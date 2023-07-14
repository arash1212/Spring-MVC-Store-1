<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/26/2021
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="fa" dir="rtl" >
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/css/bootstrap.min.css">
</head>

<body class="text-right">
<nav class="navbar navbar-expand-sm bg-light navbar-light" dir="ltr">
    <ul class="navbar-nav" >
        <c:if test="${sessionScope.roleName==null}">
            <li class="nav-item" >
                <a href="/public/login.jsp" class="nav-link">ورود به سایت</a>
            </li>
            <li class="nav-item">
                <a href="/public/register.jsp" class="nav-link">ثبت نام</a>
            </li>
        </c:if>
        <c:if test="${sessionScope.roleName!=null}">

            <li class="nav-item">
                <a href="/action/user/signOut" class="nav-link">خروج</a>
            </li>

            <li class="nav-item">
                <a href="/user/index.jsp" class="nav-link">پنل کاربری</a>
            </li>

        </c:if>

        <li class="nav-item">
            <a href="/action/cart/getUserCart" class="nav-link">سبد خرید</a>
        </li>

        <li class="nav-item">
            <a href="/admin/index.jsp" class="nav-link">پنل ادمین</a>
        </li>

    </ul>
</nav>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <ul class="navbar-nav">

        <li class="nav-item">
            <a href="/action/product/get5lastItems" class="navbar-brand">اسم فروشگاه</a>
        </li>

        <li class="nav-item">
            <a href="/action/product/get5lastItems" class="nav-link">صفحه اصلی</a>
        </li>

<%--        <li class="nav-item">--%>
<%--            <a href="/public/product.jsp" class="nav-link">محصول</a>--%>
<%--        </li>--%>

        <li class="nav-item">
            <a href="/action/product/page?page=1&url=/public/search.jsp" class="nav-link">جستجو در محصولات</a>
        </li>

        <li class="nav-item">
            <a href="/technician/index.jsp" class="nav-link">درخواست خدمات</a>
        </li>

        <li class="nav-item">
            <a href="/public/about-us.jsp" class="nav-link">درباره ما</a>
        </li>

        <li class="nav-item">
            <a href="/public/contact-us.jsp" class="nav-link">تماس با ما</a>
        </li>

    </ul>
</nav>

</body>
</html>
