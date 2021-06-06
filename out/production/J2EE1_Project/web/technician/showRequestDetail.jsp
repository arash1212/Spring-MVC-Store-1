<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/29/2021
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>جزییات درخواست</title>
</head>
<body>
<c:if test="${sessionScope.userInfo!=null}">
    <div class="container">
        <h2> جزییات وارد شده توسط کاربر برای درخواست </h2>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <main role="main" class="container">
                <br/><br/>
                <div class="jumbotron">
                    <h3>توضحیات</h3>
                    <br/><br/>
                    <p class="lead">اطلاعات درخواست</p>
                    <br/><br/><br/><br/>
                    <table border="1">
                        <tr>
                            <th>درخواست</th>
                            <th>نوع درخواست</th>
                            <th>توضیحات کاربر برای درخواست</th>
                        </tr>
                        <tr>
                            <th>${param.requestCategory}</th>
                            <th>${param.requestSubCategory}</th>
                            <th>توضیحات کاربر برای درخواست</th>
                        </tr>
                    </table>

                    <br/><br/>
                </div>
            </main>
        </main>
    </div>
</c:if>

<c:if test="${sessionScope.UserID==null&&sessionScope.userInfo==null}">
    <script>window.location = "/public/login.jsp";</script>
</c:if>


</body>
</html>
