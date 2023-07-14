<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/27/2021
  Time: 11:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>تایید اطلاعات کاربری</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body>

<div class="container">
    <!-- اگر کاربر قبلا اطلاعاتی ثبت کرده باشد اطلاعات را نمایش می دهیم به همراه امکان تغییر و یا آپدیت در فیلد ها-->
    <c:if test="${sessionScope.userInfo!=null}" var="userInf">
        <div class="container p-3 my-3 bg-light text-white" style="max-width: 70%;text-align: center">
            <br />
            <h1 style="color: black">تایید مشخصات کاربر برای ارسال محصول</h1>
            <br /><br />
            <form action="/action/transaction/save">
                <div class="form-group">
                    <label for="firstName">نام :</label>
                    <input class="form-control" type="text" id="firstName" name="firstName"
                           value="${sessionScope.userInfo.firstName}" readonly> <br/>
                    <label for="lastName">نام خانوادگی :</label>
                    <input class="form-control" type="text" id="lastName" name="lastName"
                           value="${sessionScope.userInfo.lastName}" readonly> <br/>
                    <label for="state">استان محل سکونت :</label>
                    <input class="form-control" type="text" id="state" name="state"
                           value="${sessionScope.userInfo.state}" readonly> <br/>
                    <label for="city">شهر محل سکونت :</label>
                    <input class="form-control" type="text" id="city" name="city"
                           value="${sessionScope.userInfo.city}"
                           readonly> <br/>
                    <label for="postcode">کد پستی :</label>
                    <input class="form-control" type="text" id="postcode" name="postcode"
                           value="${sessionScope.userInfo.postcode}" readonly> <br/>
                    <label for="phoneNumber">شماره تلفن ثابت :</label>
                    <input class="form-control" type="text" id="phoneNumber" name="phoneNumber"
                           value="${sessionScope.userInfo.phoneNumber}" readonly> <br/>
                    <label for="mobileNumber">شماره همراه :</label>
                    <input class="form-control" type="text" id="mobileNumber" name="mobileNumber"
                           value="${sessionScope.userInfo.mobileNumber}" readonly> <br/>
                    <label for="address1">آدرس ۱ :</label>
                    <input class="form-control" type="text" id="address1" name="address1"
                           value="${sessionScope.userInfo.address1}" readonly> <br/>
                    <label for="address2">آدرس ۲ :</label>
                    <input class="form-control" type="text" id="address2" name="address2"
                           value="${sessionScope.userInfo.address2}" readonly>
                    <br/><br/><br/>
                    <input class="btn btn-lg btn-primary btn-block" type="submit" value="تایید مشخصات"> <br/>
                    <a href="/user/userInfo.jsp">تغییر در مشخصات</a>
                </div>
            </form>
        </div>
    </c:if>



</div>

<form name="ignore_me">
    <input type="hidden" id="page_is_dirty" name="page_is_dirty" value="0"/>
</form>

<script>
    var dirty_bit = document.getElementById('page_is_dirty');
    // function mark_page_dirty() {
    if (window.performance && window.performance.navigation.type === window.performance.navigation.TYPE_BACK_FORWARD) {
        dirty_bit.value = '1';
    }
    if (dirty_bit.value === '1') {
        window.location = "/user/cart.jsp";
    }
</script>


</body>
</html>
