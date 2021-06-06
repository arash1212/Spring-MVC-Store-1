<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 6/2/2021
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>مدیریت نقش ها</title>
</head>

<jsp:include page="/header_Template.jsp"/>
<body>

<br /><br />

<div class="container">
    <div class="jumbotron">
        <div class="container">
            <h2 style="text-align: center"> افزودن نقش جدید و یا آدرس جدید برای نقش قدیمی</h2>
            <br/><br/>
            <form class="form-group" action="/action/roles/save" method="get" enctype="multipart/form-data">
                <label for="role_name"> نام نقش : </label>
                <input class="form-control" id="role_name" type="text" name="role_name" required/><br/>
                <label for="address"> آدرس مجاز برای نقش : </label>
                <input class="form-control" id="address" type="text" name="address" required/><br/>
                <br/><br/>
                <input class="btn btn-primary" type="submit" value="ثبت نقش">
                <br/>
                <br/>
            </form>
        </div>
    </div>
</div>


<div class="container">
    <table class="table table-bordered">
        <br/><br/>
        <h2>لیست نقش ها</h2>
        <br/><br/>
        <tr>
            <th>کد نقش</th>
            <th>نام نقش</th>
            <th>آدرس مجاز برای نقش</th>
        </tr>
        <c:forEach items="${sessionScope.rolesList}" var="role">
            <tr>
                <td><input class="form-control" type="text" value="${role.id}" readonly/></td>
                <td><input class="form-control" type="text" value="${role.role_name}" readonly/></td>
                <td><input class="form-control" type="text" value="${role.address}" readonly/></td>
            </tr>
        </c:forEach>
    </table>
</div>

<br /><br /><br />
</body>
</html>
