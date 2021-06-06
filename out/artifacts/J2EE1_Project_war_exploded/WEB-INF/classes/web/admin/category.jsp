<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/21/2021
  Time: 11:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>مدیریت دسته بندی ها</title>
    <script src="/Assets/JavaScript/Ajax.js"></script>
</head>

<jsp:include page="/header_Template.jsp"/>

<body onload="getLists()" dir="rtl">

<%--<ul>--%>
<%--    <li><a href="/index.jsp">صفحه اصلی</a> </li>--%>
<%--</ul>--%>

<br/><br/>

<div class="container">
    <div class="jumbotron">
        <h2>اضافه کردن دسته بندی جدید</h2>
        <br /><br />
        <form action="/action/category/save">
            <div class="form-group">
                <label for="category_name"> نام دسته بندی :</label>
                <input id="category_name" type="text" name="category_name" class="form-control" placeholder="نام دسته بندی جدید" required/> <br/>
            </div>
            <input class="btn btn-primary" type="submit" value="ثبت">
        </form>
    </div>
</div>

<br />
<div class="container">
    <legend>لیست دسته بندی ها</legend>
    <br />
    <table border="1" class="table table-bordered bg-light">
        <th>کد دسته بندی</th>
        <th>نام دسته بندی</th>
        <th>بروزرسانی</th>
<%--        <th>حذف</th>--%>
        <c:if test="${sessionScope.categoryList!=null}">
            <c:forEach items="${sessionScope.categoryList}" var="category">
                <tr>
                    <form action="/action/category/update">
                        <td><input class="form-control" type="text" name="id" value="${category.id}" readonly required></td>
                        <td><input class="form-control" type="text" name="category_name" value="${category.category_name}" required></td>
                        <td><input class="btn btn-secondary" type="submit" value="بروزرسانی"></td>
<%--                        <td><input class="btn btn-secondary" type="button" value="حذف" onclick="del(${category.id})"></td>--%>
                    </form>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</div>

<br /><br /><br />

        <script>
            function del(id) {
                window.location = "/action/category/delete?id=" + id;
            }

            function getLists() {
                if (performance.navigation.type == performance.navigation.TYPE_RELOAD ||${sessionScope.categoryList==null}) {
                    window.location = "/action/category/findAll";
                }
            }
        </script>

    </table>


</body>
</html>
