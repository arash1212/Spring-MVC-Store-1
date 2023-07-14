<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/28/2021
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>درخواست خدمات</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body>

<%--    <div class="album py-5 bg-light">--%>
<%--        <div class="container">--%>

<div class="container">

    <br/><br/>
    <h1>درخواست خدمات</h1>

    <br/><br/>


    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <img src="/technician/images/برق-ساختمان-لوگو.jpg" alt="برق ساختمان"/></td>
                <div class="card-body">
                    <p class="card-text text-center">خدمات برق ساختمان</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-block btn-outline-secondary"
                                    onclick="chooseRequestCategory('building')">انتخاب
                            </button>
                        </div>
                        <%--                    <small class="text-muted">خدمات برق ساختمان از قبیل نورپردازی </small>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <img src="/technician/images/برق صنعتی و نصب تابلو.jpg" alt="برق صنعتی و نصب تابلو"/></td>
                <div class="card-body">
                    <p class="card-text text-center">برق صنعتی و نصب تابلو</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-block btn-outline-secondary"
                                    onclick="chooseRequestCategory('industrial')">انتخاب
                            </button>
                        </div>
                        <%--                    <small class="text-muted"></small>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <img src="/technician/images/دوربین اعلام حریق.jpg" alt="نصب دوربین و اعلام حریق و دزدگیر"/></td>
                <div class="card-body">
                    <p class="card-text text-center">نصب دوربین و اعلام حریق و دزدگیر</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-block btn-outline-secondary"
                                    onclick="chooseRequestCategory('security')">انتخاب
                            </button>
                        </div>
                        <%--                    <small class="text-muted"></small>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<br/><br/>
<script>
    function chooseRequestCategory(requestCategory) {
        if (${sessionScope.UserID!=null&&sessionScope.userInfo!=null}) {
            window.location = "/technician/chooseRequestSubCategoryPage.jsp?requestCategory=" + requestCategory;
        }
        else if (${sessionScope.UserID==null}) {
            window.location = "/public/login.jsp";
        }
        else if (${sessionScope.UserID!=null&&sessionScope.userInfo==null}) {
            window.location = "/error-pages/transaction-empty-userInfo-error.jsp";
        }
    }
</script>


</body>
</html>
