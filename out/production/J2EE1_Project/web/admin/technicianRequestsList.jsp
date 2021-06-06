<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/29/2021
  Time: 5:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>لیست تمام درخواست ها</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body>
<div class="container-fluid">
    <br/><br/>
    <h3>لیست درخواست ها</h3>
    <br/><br/>
    <table class="table table-responsive-sm" border="1">
        <tr>
            <th>کد درخواست</th>
            <th>ایمیل کاربر درخواست کننده</th>
            <th> تاریخ ثبت درخواست</th>
            <th>دسته بندی</th>
            <th>زیر دسته بندی</th>
            <th>توضحیات کاربر</th>
            <th>وضعیت درخواست</th>
        </tr>
        <c:forEach items="${sessionScope.technicianRequestsList}" var="t">
            <tr>
                <form>
                    <td><input class="form-control" type="text" value="${t.id}" readonly></td>
                    <td><input class="form-control" type="text" value="${t.users.email}" readonly></td>
                    <td><input class="form-control" type="text" value="${t.requestDate}" readonly></td>
                    <td><input class="form-control" type="text" value="${t.requestCategory}" readonly></td>
                    <td><input class="form-control" type="text" value="${t.requestSubCategory}" readonly></td>
                    <td><input class="form-control" type="text" value="${t.description}" readonly></td>
                        <%--                    <td><input type="text" value="${t.stateOfRequest}" readonly></td>--%>
                    <td>
                        <select class="form-control" name="stateOfRequest" select>
                            <c:if test="${t.stateOfRequest.equals('ثبت شده')}">
                                <option name="category_name" selected>ثبت شده</option>
                                <option name="category_name">در حال بررسی</option>
                                <option name="category_name">انجام شده</option>
                            </c:if>
                            <c:if test="${t.stateOfRequest.equals('در حال بررسی')}">
                                <option name="category_name">ثبت شده</option>
                                <option name="category_name" selected>در حال بررسی</option>
                                <option name="category_name">انجام شده</option>
                            </c:if>
                            <c:if test="${t.stateOfRequest.equals('انجام شده')}">
                                <option name="category_name" selected>انجام شده</option>
                                <option name="category_name">در حال بررسی</option>
                                <option name="category_name">انجام شده</option>
                            </c:if>
                        </select>
                    </td>
<%--                    <td><input type="button" value="مشاهده جزییات" onclick=""></td>--%>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>

<br /><br /><br/>


</body>
</html>
