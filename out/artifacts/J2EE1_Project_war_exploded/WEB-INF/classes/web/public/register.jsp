<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/15/2021
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>ثبت نام</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body dir="rtl">
<br/><br/>

<div class="container p-3 my-3 bg-dark text-white" style="max-width: 30%;text-align: center">
    <h1>ثبت نام</h1>
    <br/><br/>
    <div class="form-group">
        <form action="/action/user/save">
            <label for="email">ایمیل :</label>
            <input class="form-control" id="email" type="email" name="email" required/><br/>
            <label for="password">رمز عبور:</label>
            <input class="form-control" id="password" type="password" name="password" required/><br/>
            <br/><br/>
            <input class="btn btn-lg btn-primary btn-block" type="submit" value="ثبت نام"/>
        </form>
    </div>
</div>


</body>

</html>
