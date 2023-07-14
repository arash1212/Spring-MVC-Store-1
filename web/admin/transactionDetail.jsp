<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/28/2021
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>جزییات تراکنش کاربر</title>

    <script>
        function changeTransactionStateToDone(id) {
            window.location = "/action/transaction/changeTransactionStateToDone?id=" + id;
        }
    </script>
</head>

<jsp:include page="/header_Template.jsp"/>

<body>

<c:if test="${param.id!=null}">
    <br/><br/>
    <h1>جزییات تراکنش</h1>
    <br/><br/>

    <!--order details -->
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

    <br/><br/><br/>
    <!--order's user detail -->
    <div class="container-fluid">
        <h3>اطلاعات کاربر سفارش دهنده:</h3>
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

            <c:if test="${sessionScope.selectedOrderUser==null||param.id==null}">
                <c:out value="کاربری برای سفارش یافت نشد !"/>
            </c:if>
        </table>
        <br /><br />
        <input type="button" class="btn btn-danger" value="تغییر وضعیت تراکنش به 'انجام شده'" onclick="changeTransactionStateToDone(${param.id})"/>
        <br /><br />
        <form action="/admin/transactiobDetailPrintPage.jsp?id=2">
            <input type="submit" class="btn btn-secondary" value="برو به صفحه چاپ تراکنش">
        </form>
    </div>

    <br/>




    <br/><br/><br/>

</c:if>
<c:if test="${param.id==null}">
    <script>
        window.location = "/action/transaction/findAll";
    </script>
</c:if>


</body>
</html>
