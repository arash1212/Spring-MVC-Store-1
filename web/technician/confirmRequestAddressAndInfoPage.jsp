<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/29/2021
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>تایید مشخصات درخواست و آدرس</title>
</head>
<jsp:include page="/header_Template.jsp"/>
<body>
<c:if test="${sessionScope.UserID!=null}">
    <div class="container">
        <br/><br/>
        <h2> تایید اطلاعات وارد شده برای درخواست </h2>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <main role="main" class="container">
                <br/><br/>
                <div class="jumbotron">
                    <h3>توضحیات</h3>
                    <br/><br/>
                    <div class="alert alert-danger">
                        <strong> توجه! </strong> لطفا از صحت اطلاعات زیر مطما شوید.
                    </div>
                    <br/><br/><br/><br/>
                    <h4> اطلاعات درخواست :</h4><br/>
                    <table border="1" class="table table-dark" style="width: 100%;">
                        <tr>
                            <th>درخواست</th>
                            <th>نوع درخواست</th>
                            <th>توضیحات کاربر برای درخواست</th>
                        </tr>
                        <tr>
                            <th>${param.requestCategory}</th>
                            <th>${param.requestSubCategory}</th>
                            <th>${param.description}</th>
                        </tr>
                    </table>

                    <br/><br/><br/>

                    <h4> اطلاعات کاربر :</h4><br/>
                    <table border="1" class="table table-dark" style="width: 100%;">
                        <tr>
                            <th>نام و نام خانوادگی</th>
                            <th>شماره همراه</th>
                            <th>آدرس</th>
                        </tr>
                        <tr>
                            <th>${sessionScope.userInfo.firstName} ${sessionScope.userInfo.lastName}</th>
                            <th>${sessionScope.userInfo.mobileNumber}</th>
                            <th>${sessionScope.userInfo.address1} ${sessionScope.userInfo.address2}</th>
                        </tr>
                    </table>

                    <br/><br/>

                    <form action="">
                        <label for="confirm-checkbox">صحت اطلاعات فوق را می پذیرم</label>
                        <input id="confirm-checkbox" type="checkbox" required/><br/><br/>
                        <input type="button" value="ثبت درخواست"
                               onclick="saveRequest('${param.requestCategory}','${param.requestSubCategory}','${param.description}')"/>
                    </form>
                </div>
            </main>
        </main>
    </div>
</c:if>

<form name="ignore_me">
    <input type="hidden" id="page_is_dirty" name="page_is_dirty" value="0"/>
</form>

<c:if test="${sessionScope.UserID==null}">
    <script>

        window.location = "/technician/index.jsp";

    </script>
</c:if>


</body>

<script>
    function saveRequest(requestCategory, requestSubCategory, description) {
        const checkB = document.getElementById('confirm-checkbox');
        if (checkB.checked == true)
            window.location = "/action/technicianRequest/save?requestCategory=" + requestCategory + "&requestSubCategory=" + requestSubCategory + "&description=" + description;
        else
            alert("تیک تایید صحت اطلاعات زده نشده است")
    }

    //
    var dirty_bit = document.getElementById('page_is_dirty');
    // function mark_page_dirty() {
    if (window.performance && window.performance.navigation.type === window.performance.navigation.TYPE_BACK_FORWARD) {
        dirty_bit.value = '1';
    }
    if (dirty_bit.value === '1') {
        window.location = "/technician/index.jsp";
    }
</script>
</html>
