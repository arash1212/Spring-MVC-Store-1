<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/28/2021
  Time: 12:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>خطا در تعداد محصولات انتخاب شده</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body>

<div class="container p-3 my-3 bg-dark text-white" style="max-width: 80%;text-align: right">

    <main role="main" class="container">
        <br/><br/>
        <h2>خطا در تعداد محصولات انتخاب شده</h2>
        <br/><br/>
        <p class="lead">تعدادی از محصولات بیشتر از موجودی آنها در انبار انتخاب شده است</p>
        <p class="lead">برای بازگشت به سبد خرید <a href="/user/cart.jsp">کلیک کنید</a> </p>
        <br/><br/>
    </main>
</div>


</body>
</html>
