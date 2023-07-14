<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/27/2021
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ایمیل قبلا ثبت شده است</title>
</head>
<jsp:include page="/header_Template.jsp"/>
<body>
<br /><br />

<div class="container p-3 my-3 bg-dark text-white" style="max-width: 80%;text-align: right">

    <main role="main" class="container">
        <br/><br/>
        <h2>ایمیل قبلا ثبت شده است</h2>
        <br/><br/>
        <p class="lead">ایمیل وارد شده قبلا توسط یک اکانت دیگر ثبت شده است.</p>

        <p class="lead">برای وارد شدن به سایت از <a href="/public/login.jsp">این لینک</a> استفاده کنید.</p>

        <p class="lead">و اگر مایل به ساخت اکانت جدیدی هستید از لینک <a href="/public/register.jsp">ثبت نام</a> استفاده کنید.</p>
        <br/><br/>
    </main>
</div>


</body>
</html>
