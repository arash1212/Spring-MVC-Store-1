<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/15/2021
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ورود به سایت</title>

</head>

<jsp:include page="/header_Template.jsp"/>

<body class="text-center">
<br/><br/>


<div class="container p-3 my-3 bg-dark text-white" style="max-width: 30%;text-align: center">
    <h1>ورود به سایت</h1>
    <br/><br/>
    <form action="/action/user/findOneByEmail">
        <div class="form-group">
            <label for="email">ایمیل :</label>
            <input class="form-control" id="email" type="email" name="email" required/><br/>
            <label for="password">رمز عبور:</label>
            <input class="form-control" id="password" type="password" name="password" required> <br/>
            <br/><br/>
            <input class="btn btn-lg btn-primary btn-block" type="submit" value="ورود">
        </div>
    </form>
</div>



</body>
</html>
