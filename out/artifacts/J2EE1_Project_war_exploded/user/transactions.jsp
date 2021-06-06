<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/21/2021
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>تراکنش های کاربر</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body dir="rtl">
<br/><br/>

<div class="container">
    <fieldset>
        <br/>
        <legend>لیست سفارش های کاربر</legend>
        <br/>

        <table class="table" border="1">
            <tr>
                <th>کد تراکنش</th>
                <th> تاریخ ثبت سفارش</th>
                <th> تاریخ تکمیل سفارش</th>
                <th>وضعیت</th>
                <th>مشاهده جزییات</th>
            </tr>
            <c:forEach items="${sessionScope.transactionPagingList}" var="t">
                <tr>
                    <form>
                        <td><input class="form-control" type="text" value="${t.id}" readonly></td>
                        <td><input class="form-control" type="text" value="${t.date_added}" readonly></td>
                        <td><input class="form-control" type="text" value="${t.date_transaction_done}" readonly></td>
                        <td><input class="form-control" type="text" value="${t.stateOfTransaction}" readonly></td>
                        <td><input class="btn btn-secondary" type="button" value="مشاهده جزییات" onclick="orderDetail(${t.id},'user')"></td>
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
                        <li class="page-item"><a
                                href="/action/transaction/pageWithUserID?page=${i}&url=/user/transactions.jsp&id="
                                +${param.id} class="page-link">${i}</a></li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>

    </fieldset>
</div>

<br /><br /><br />
<script>
    function orderDetail(id, roleName) {
        window.location = "/action/transaction/showTransactionDetail?id=" + id + "&roleName=user";
    }
</script>


<!--pages-->


</body>
</html>
