<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/15/2021
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>صفحه کاربری</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body>
<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="sidebar-sticky pt-3">
                <ul class="nav flex-column">
                    <br />
                    <li class="nav-item">
                        <a class="nav-link active" href="/action/userInfo/getUserInfo">
                            <span data-feather="home"></span>
                            <h2>پنل کاربری</h2>
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br />
                    <li class="nav-item">
                        <a class="nav-link active" href="/action/userInfo/getUserInfo">
                            <span data-feather="home"></span>
                            تکمیل اطلاعات کاربری
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br />
                    <li class="nav-item">
                        <a class="nav-link active" href="/action/transaction/pageWithUserID?url=/user/transactions.jsp"/>
                            <span data-feather="home"></span>
                            تراکنش ها
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br />
                    <li class="nav-item">
                        <a class="nav-link active" href="/action/technicianRequest/findAllUserTechnicianRequests"/>
                        <span data-feather="home"></span>
                        درخواست ها
                        <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <br />
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link active" href="/action/userInfo/getUserInfo">--%>
<%--                            <span data-feather="home"></span>--%>
<%--                            نظرات--%>
<%--                            <span class="sr-only">(current)</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
                    <br />
                </ul>
            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <main role="main" class="container">
                <br /><br />
                <div class="jumbotron">
                    <h1>پنل کاربری</h1>
                    <br /><br />
                    <p class="lead">برای خرید ابتدا باید بعد از ثبت نام اطلاعات کاربری را از بخش <a href="/user/userInfo.jsp">تکمیل اطلاعات کاربری </a> تکمیل کنید.</p>
                    <br /><br />
                </div>
            </main>
        </main>
    </div>
</div>


</body>
</html>
