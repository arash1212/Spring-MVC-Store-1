<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/26/2021
  Time: 6:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>اطلاعات کاربر</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body dir="rtl">
<br/>
<!-- اگر کاربر قبلا اطلاعاتی ثبت نکرده یک فرم خالی برای ثبت اطلاعات میسازیم-->


    <c:if test="${sessionScope.userInfo==null}">
        <div class="container p-3 my-3 bg-dark text-white" style="max-width: 30%;text-align: center">
            <br />
            <h1>تکمیل اطلاعات کاربری</h1>
            <br /><br />
            <form action="/action/userInfo/save">
                <div class="form-group">
                    <label for="firstNameE">نام :</label>
                    <input class="form-control" type="text" id="firstNameE" name="firstName"
                           value="" required> <br/>
                    <label for="lastNameE">نام خانوادگی :</label>
                    <input class="form-control" type="text" id="lastNameE" name="lastName"
                           value="" required> <br/>
                    <label for="stateE">استان محل سکونت :</label>
                    <input class="form-control" type="text" id="stateE" name="state"
                           value="" required> <br/>
                    <label for="cityE">شهر محل سکونت :</label>
                    <input class="form-control" type="text" id="cityE" name="city" value=""
                           required> <br/>
                    <label for="postcodeE">کد پستی :</label>
                    <input class="form-control" type="text" id="postcodeE" name="postcode"
                           value="" required> <br/>
                    <label for="phoneNumberE">شماره تلفن ثابت :</label>
                    <input class="form-control" type="text" id="phoneNumberE" name="phoneNumber"
                           value="" required> <br/>
                    <label for="mobileNumberE">شماره همراه :</label>
                    <input class="form-control" type="text" id="mobileNumberE" name="mobileNumber"
                           value="" required> <br/>
                    <label for="address1E">آدرس ۱ :</label>
                    <input class="form-control" type="text" id="address1E" name="address1"
                           value="" required> <br/>
                    <label for="address2E">آدرس ۲ :</label>
                    <input class="form-control" type="text" id="address2E" name="address2"
                           value="" required>
                    <br/><br/><br/>
                    <input class="btn btn-lg btn-primary btn-block" type="submit" value="ذخیره"> <br/>
                </div>
            </form>
        </div>
    </c:if>


    <div class="container">
        <!-- اگر کاربر قبلا اطلاعاتی ثبت کرده باشد اطلاعات را نمایش می دهیم به همراه امکان تغییر و یا آپدیت در فیلد ها-->
        <c:if test="${sessionScope.userInfo!=null}" var="userInf">
            <div class="container p-3 my-3 bg-dark text-white" style="max-width: 70%;text-align: center">
                <br />
                <h1>تکمیل اطلاعات کاربری</h1>
                <br /><br />
                <form action="/action/userInfo/update">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input class="form-control" type="text" id="id" name="id" value="${sessionScope.userInfo.id}"
                               readonly> <br/>
                        <label for="firstName">نام :</label>
                        <input class="form-control" type="text" id="firstName" name="firstName"
                               value="${sessionScope.userInfo.firstName}" required> <br/>
                        <label for="lastName">نام خانوادگی :</label>
                        <input class="form-control" type="text" id="lastName" name="lastName"
                               value="${sessionScope.userInfo.lastName}" required> <br/>
                        <label for="state">استان محل سکونت :</label>
                        <input class="form-control" type="text" id="state" name="state"
                               value="${sessionScope.userInfo.state}" required> <br/>
                        <label for="city">شهر محل سکونت :</label>
                        <input class="form-control" type="text" id="city" name="city"
                               value="${sessionScope.userInfo.city}"
                               required> <br/>
                        <label for="postcode">کد پستی :</label>
                        <input class="form-control" type="text" id="postcode" name="postcode"
                               value="${sessionScope.userInfo.postcode}" required> <br/>
                        <label for="phoneNumber">شماره تلفن ثابت :</label>
                        <input class="form-control" type="text" id="phoneNumber" name="phoneNumber"
                               value="${sessionScope.userInfo.phoneNumber}" required> <br/>
                        <label for="mobileNumber">شماره همراه :</label>
                        <input class="form-control" type="text" id="mobileNumber" name="mobileNumber"
                               value="${sessionScope.userInfo.mobileNumber}" required> <br/>
                        <label for="address1">آدرس ۱ :</label>
                        <input class="form-control" type="text" id="address1" name="address1"
                               value="${sessionScope.userInfo.address1}" required> <br/>
                        <label for="address2">آدرس ۲ :</label>
                        <input class="form-control" type="text" id="address2" name="address2"
                               value="${sessionScope.userInfo.address2}" required>
                        <br/><br/><br/>
                        <input class="btn btn-lg btn-primary btn-block" type="submit" value="ثبت تغییرات"> <br/>
                    </div>
                </form>
            </div>
        </c:if>
    </div>


</body>
</html>
