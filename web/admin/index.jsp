<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/15/2021
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>صفحه ادمین</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body dir="rtl">
<%--<ul>--%>
<%--    <li><a href="/index.jsp">صفحه اصلی</a> </li>--%>
<%--</ul>--%>
<%--<h1>ادمین</h1>--%>

<%--<a href="/admin/products.jsp"/>صفحه محصولات--%>
<%--</body>--%>
<%--<br/>--%>
<%--<a href="/admin/category.jsp"/>مدیریت دسته بندی محصولات</body> <br/>--%>


<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="sidebar-sticky pt-3">
                <ul class="nav flex-column">
                    <br/>
                    <li class="nav-item">
                        <a class="nav-link active" href="/admin/index.jsp">
                            <span data-feather="home"></span>
                            <h2>پنل ادمین</h2>
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br/>
                    <li class="nav-item">
                        <a class="nav-link active" href="/admin/category.jsp"">
                        <span data-feather="home"></span>
                        دسته بندی محصولات
                        <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br/>
                    <li class="nav-item">
                        <a class="nav-link active" href="/action/product/page?url=/admin/products.jsp">
                            <span data-feather="home"></span>
                            مدیریت محصولات
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br/>
                    <li class="nav-item">
                        <a class="nav-link active" href="/action/transaction/page?url=/admin/transactions-managment.jsp">
                            <span data-feather="home"></span>
                            مدیریت تراکنش ها
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br/>
                    <li class="nav-item">
                        <a class="nav-link active" href="/action/technicianRequest/findAll">
                            <span data-feather="home"></span>
                            مدیریت درخواست ها
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br/>
                    <li class="nav-item">
                        <a class="nav-link active" href="/action//roles/findAll">
                            <span data-feather="home"></span>
                            مدیریت نقش ها
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br/>
                </ul>
            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <main role="main" class="container">
                <br/><br/>
                <div class="jumbotron">

                    <h1>پنل ادمین</h1>
                    <br/><br/>
                    <p class="lead" style="color: red">ابتدا برای افزودن محصول جدید باید دسته بندی از طریق <a href="/admin/category.jsp">این
                        لینک</a> اضافه شود. </p>
                    <p class="lead">بعد از افزودن دسته بندی مورد نظر , از طریق <a href="/action/product/findAll">این
                        لینک</a> امکان افزودن محصول جدید به فروشگاه وجود خواهد داشت.درصورت وجود نداشتن محصولی در دیتابیس
                        هیچ آیتمی نیز در هیچکدام از صفحات نمایش داده نخواهد شد.</p>
                    <br/><br/>
                </div>
            </main>
    </div>
</div>


</body>
</html>
