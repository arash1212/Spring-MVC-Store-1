<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/28/2021
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>مدیریت تراکنش ها</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body>

<div class="container">
    <br /><br /><br />
    <table class="table table-bordered" border="1">
        <tr>
            <th>کد تراکنش</th>
            <th>ایمیل کاربر</th>
            <th> تاریخ ثبت سفارش</th>
            <th> تاریخ تکمیل سفارش </th>
            <th>وضعیت</th>
            <th>مشاهده جزییات</th>
        </tr>
        <c:forEach items="${sessionScope.transactionPagingList}" var="t">
            <tr>
                <form>
                    <td><input class="form-control" type="text" value="${t.id}" readonly></td>
                    <td><input class="form-control" type="text" value="${t.users.email}" readonly></td>
                    <td><input class="form-control" type="text" value="${t.date_added}" readonly></td>
                    <td><input class="form-control" type="text" value="${t.date_transaction_done}" readonly></td>
                    <td><input class="form-control" type="text" value="${t.stateOfTransaction}" readonly></td>
                    <td><input class="btn btn-primary" type="button" value="مشاهده جزییات" onclick="orderDetail(${t.id},${t.users.id})"></td>
                </form>
            </tr>
        </c:forEach>
    </table>


    <div class="container-fluid">
        <ul class="pagination">
            <c:forEach begin="1" end="${(sessionScope.transactionCount/10)+1}" var="i">
                <%--            <c:if test="${param.categoryName==null}">--%>
                <%--                <li class="page-item"><a href="/action/transaction/page?page=${i}&url=/public/search.jsp"--%>
                <%--                                         class="page-link">${i}</a></li>--%>
                <%--            </c:if>--%>
                <c:if test="${param.id!=null}">
                    <li class="page-item"><a href="/action/transaction/page?page=${i}&url=/admin/transactions-managment.jsp" class="page-link">${i}</a></li>
                </c:if>
            </c:forEach>
        </ul>
    </div>

    <br /><br /><br />
</div>

<script>
    function orderDetail(id, userID) {
        window.location = "/action/transaction/showTransactionDetail?id=" + id + "&roleName=admin" + "&userID=" + userID;
    }
</script>


</body>
</html>
