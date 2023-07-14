<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/17/2021
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>سبد خرید</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body dir="rtl" onload="getLists()">
<%--<ul>--%>
<%--    <li><a href="/index.jsp">صفحه اصلی</a></li>--%>
<%--</ul>--%>

<div class="container-fluid">
    <br /><br />
    <fieldset>
        <legend><h1>سبد خرید</h1></legend>
        <br/><br/>

        <table class="table-responsive" border="1" >
            <tr>
                <th>تصویر محصول</th>
                <th>کد محصول در سبد</th>
                <th>کد محصول</th>
                <th>نام محصول</th>
                <th>دسته بندی</th>
                <th>قیمت</th>
                <th>موجودی در انبار</th>
                <th>تعداد</th>
                <th>بروزرسانی</th>
                <th>حذف</th>
            </tr>
            <c:if test="${sessionScope.UserCart!=null&&sessionScope.UserCart.size()>0}">
                <c:forEach items="${sessionScope.UserCart}" var="cartItem">
                    <tr>
                        <form action="/action/cartItem/updateQuantity">
                            <td><img src="${cartItem.product.productImagePath}" alt="${cartItem.product.product_name}"
                                     style="max-width:15%;object-fit: cover"/></td>
                            <td><input class="form-control" type="text" name="id" value="${cartItem.id}" readonly></td>
                            <td><input class="form-control" type="text" name="product_id" value="${cartItem.product.id}" readonly></td>
                            <td><input class="form-control" type="text" value="${cartItem.product.product_name}" readonly></td>
                            <td><input class="form-control" type="text" value="${cartItem.product.category.category_name}" readonly></td>
                            <td><input class="form-control" type="text" value="${cartItem.product.sellPrice}" readonly></td>
                            <td><input class="form-control" type="text" name="stock" value="${cartItem.product.stock}" readonly></td>
                            <td><input class="form-control" type="text" name="quantity" value="${cartItem.quantity}"></td>
                            <td><input class="btn btn-secondary" type="submit" value="بروزرسانی"></td>
                            <td><input class="btn btn-secondary" type="button" value="حذف" onclick="del(${cartItem.id})"></td>
                        </form>
                    </tr>
                </c:forEach>
                <tr>
                    <td><input class="btn btn-danger" type="button" onclick="submitOrder()" value="پرداخت"/></td>
                </tr>
            </c:if>
        </table>

        <c:if test="${sessionScope.UserCart==null||sessionScope.UserCart.size()<=0}">
            <c:out value="سبد خرید خالی است"/>
        </c:if>
</div>


</fieldset>

<br/><br/><br/><br/>

<script>
    function getLists() {
        if (performance.navigation.type == performance.navigation.TYPE_RELOAD ||${sessionScope.UserCart==null}) {
            window.location = "/action/cart/getUserCart";
        }
    }

    function del(id) {
        window.location = "/action/cartItem/delete?id=" + id;
    }

    function submitOrder(cartId) {
        if (${sessionScope.userInfo!=null})
            window.location = "/user/confirm-info.jsp?cart-id=" + cartId;
        else
            window.location = "/error-pages/transaction-empty-userInfo-error.jsp";
    }
</script>


</body>
</html>
