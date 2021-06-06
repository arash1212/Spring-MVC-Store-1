<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/28/2021
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>صفحه ی چاپ تراکنش</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/css/bootstrap.min.css">
</head>

<body dir="rtl" class="text-right">
<br/>
<!--order details -->
<div class="container-fluid">
    <fieldset>
        <legend>فاکتور خرید${param.id}</legend>
        <br/><br/>
        <table class="table" border="1" style="width: 100%;">
            <tr>
                <%--                <th>تصویر محصول</th>--%>
                <th>کد محصول</th>
                <th>نام محصول</th>
                <th>قیمت</th>
                <th>تعداد</th>
            </tr>
            <c:forEach items="${sessionScope.orderDetail}" var="cartItem">
                <tr>
                    <form>
                            <%--                        <td><img src="${cartItem.product.productImagePath}" alt="${cartItem.product.product_name}"--%>
                            <%--                                 style="max-width:20%"/></td>--%>
                        <td><input type="text" value="${cartItem.product.id}" readonly></td>
                        <td><input type="text" value="${cartItem.product.product_name}" readonly></td>
                        <td><input type="text" value="${cartItem.product.sellPrice}" readonly></td>
                        <td><input type="text" value="${cartItem.quantity}" readonly></td>
                    </form>
                </tr>
            </c:forEach>
        </table>
    </fieldset>


    <!--order's user detail -->
    <div class="container-fluid">
        <fieldset>
            <legend>اطلاعات کاربر سفارش دهنده:</legend>
            <table class="table" border="1" style="width: 100%;">
                <tr>
                    <th>ID</th>
                    <th>نام کامل کاربر</th>
                    <th>آدرس کامل</th>
                    <th>کد پستی</th>
                </tr>
                <c:if test="${sessionScope.selectedOrderUser!=null}">
                    <tr>
                        <form>
                            <td><input class="form-control" type="text" value="${sessionScope.selectedOrderUser.id}"
                                       readonly></td>
                            <td><input class="form-control" type="text"
                                       value="${sessionScope.selectedOrderUser.userInfo.firstName} ${sessionScope.selectedOrderUser.userInfo.lastName}"
                                       readonly></td>
                            <td><textarea class="form-control" name="address"
                                          readonly>${sessionScope.selectedOrderUser.userInfo.address1} ${sessionScope.selectedOrderUser.userInfo.address2}</textarea>
                            </td>
                            <td><textarea class="form-control" name="postcode"
                                          readonly>${sessionScope.selectedOrderUser.userInfo.postcode}</textarea></td>
                        </form>
                    </tr>
                </c:if>

                <c:if test="${sessionScope.selectedOrderUser==null}">
                    <c:out value="کاربری برای سفارش یافت نشد !"/>
                </c:if>
            </table>
        </fieldset>
        <br />
        <input type="button" onclick="printPage()" value="چاپ صفحه">
    </div>
</div>

<br/><br/><br/>
<script>
    function printPage(){
        window.print();
    }
</script>


</body>
</html>
