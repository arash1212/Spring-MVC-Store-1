<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/22/2021
  Time: 12:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>جزییات خرید</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body dir="rtl">
<c:if test="${param.id!=null}">
    <br/><br/>
    <h1>جزییات تراکنش</h1>
    <br/><br/>
    <div class="container-fluid">
        <fieldset>
            <legend>جزییات تراکنش#${param.id}</legend>
            <table class="table" border="1" style="width: 100%;">
                <tr>
                    <th>تصویر محصول</th>
                    <th>کد محصول</th>
                    <th>نام محصول</th>
                    <th>قیمت</th>
                    <th>تعداد</th>
                </tr>
                <c:forEach items="${sessionScope.orderDetail}" var="cartItem">
                    <tr>
                        <form>
                            <td><img src="${cartItem.product.productImagePath}" alt="${cartItem.product.product_name}"
                                     style="max-width:20%"/></td>
                            <td><input type="text" value="${cartItem.product.id}" readonly></td>
                            <td><input type="text" value="${cartItem.product.product_name}" readonly></td>
                            <td><input type="text" value="${cartItem.product.sellPrice}" readonly></td>
                            <td><input type="text" value="${cartItem.quantity}" readonly></td>
                        </form>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
    </div>
</c:if>
<c:if test="${param.id==null}">
    <script>
        window.location="/user/transactions.jsp";
    </script>
</c:if>


</body>
</html>
