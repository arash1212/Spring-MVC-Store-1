<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/29/2021
  Time: 10:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>انتخاب نوع درخواست</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body>
<br/><br/>
<!-- ذرخواست خدمات برق ساختمان -->
<c:if test="${param.requestCategory.equals('building')}">
    <div class="container">
        <h2> نوع درخواست : برق ساختمان </h2>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <main role="main" class="container">
                <br/><br/>
                <div class="jumbotron">
                    <h3>توضحیات</h3>
                    <br/><br/>
                    <p class="lead">پاراگراف مربوط به توضیحات و مقررات و غیره</p>
                    <br/><br/><br/><br/>
                    <br/><br/>
                    <form action="/technician/confirmRequestAddressAndInfoPage.jsp?requestCategory=building">
                        <input class="form-control " type="text" name="requestCategory" value="برق ساختمان"  readonly/><br/><br/>
                        <h4>نوع خدمت مورد نظر را مشخص کنید : </h4><br/>
                        <label for="1-1">سیم کشی و راه اندازی برق ساختمان</label>
                        <input name="requestSubCategory" id="1-1" type="radio" value="سیم کشی و راه اندازی برق ساختمان"
                               required/><br/>
                        <label for="1-2">رفع اتصالی و معایب ساختمان</label>
                        <input name="requestSubCategory" id="1-2" type="radio" value="رفع اتصالی و معایب ساختمان"/><br/>
                        <label for="1-3">نورپردازی نما و محوطه</label>
                        <input name="requestSubCategory" id="1-3" type="radio" value="نورپردازی نما و محوطه"/><br/>
                        <label for="1-4">نصب و نورپردازی چراغ های پارک و خیابان</label>
                        <input name="requestSubCategory" id="1-4" type="radio"
                               value="نصب و نورپردازی چراغ های پارک و خیابان"/><br/><br/><br/>
                        <label for="description1">توضیحات اضافه در مورد درخواست مورد نظر :</label><br/>
                        <textarea class="form-control" name="description" id=description1></textarea><br><br/>
                        <input type="submit" value="انتخاب"><br/>
                    </form>

                    <br/><br/>
                </div>
            </main>
        </main>
    </div>
</c:if>

<!-- ذرخواست خدمات برق صنعتی -->
<c:if test="${param.requestCategory.equals('industrial')}">
    <div class="container">
        <h2> نوع درخواست : برق صنعتی و نصب تابلو </h2>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <main role="main" class="container">
                <br/><br/>
                <div class="jumbotron">
                    <h3>توضحیات</h3>
                    <br/><br/>
                    <p class="lead">پاراگراف مربوط به توضیحات و مقررات و غیره</p>
                    <br/><br/><br/><br/>

                    <br/><br/>
                    <form action="/technician/confirmRequestAddressAndInfoPage.jsp?requestCategory=industrial">
                        <input type="text" class="form-control " name="requestCategory" value="برق صنعتی و نصب تابلو"  readonly/><br/><br/>
                        <h4>نوع خدمت مورد نظر را مشخص کنید : </h4><br/>
                        <label for="2-1">تولید و نصب تابلو های صنعتی</label>
                        <input name="requestSubCategory" id="2-1" type="radio" value="تولید و نصب تابلو های صنعتی"
                               required/><br/>
                        <label for="2-2">راه اندازی مدار های فرمان</label>
                        <input name="requestSubCategory" id="2-2" type="radio" value="راه اندازی مدار های فرمان"/><br/>
                        <label for="2-3">نصب و راه اندازی مدار مدار های سه فاز و تک فاز</label>
                        <input name="requestSubCategory" id="2-3" type="radio"
                               value="نصب و راه اندازی مدار مدار های سه فاز و تک فاز"/><br/><br/><br/>
                        <label for="description2">توضیحات اضافه در مورد درخواست مورد نظر :</label><br/>
                        <textarea class="form-control" name="description" id=description2></textarea><br><br/>
                        <input type="submit" value="انتخاب"><br/>
                    </form>

                    <br/><br/>
                </div>
            </main>
        </main>

    </div>
</c:if>

<!-- ذرخواست خدمات نصب دوربین -->
<c:if test="${param.requestCategory.equals('security')}">
    <div class="container">
        <h1> نوع درخواست : نصب دوربین و اعلام حریق </h1>


        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <main role="main" class="container">
                <br/><br/>
                <div class="jumbotron">
                    <h3>توضحیات</h3>
                    <br/><br/>
                    <p class="lead">پاراگراف مربوط به توضیحات و مقررات و غیره</p>
                    <br/><br/><br/><br/>

                    <br/><br/>
                    <form action="/technician/confirmRequestAddressAndInfoPage.jsp">
                        <input class="form-control " type="text" name="requestCategory" value="نصب دوربین و اعلام حریق" readonly/><br/><br/>
                        <h4>نوع خدمت مورد نظر را مشخص کنید : </h4><br /><br />
                        <label for="3-1">نصب دوربین مداربسته ساختمان تجاری و فروشگاه</label>
                        <input name="requestSubCategory" id="3-1" type="radio"
                               value="نصب دوربین مداربسته ساختمان تجاری و فروشگاه" required/><br/>
                        <label for="3-2">نصب دزدگیر</label>
                        <input name="requestSubCategory" id="3-2" type="radio" value="نصب دزدگیر"/><br/>
                        <label for="3-3">نصب سیم های اعلام حریق</label>
                        <input name="requestSubCategory" id="3-3" type="radio"
                               value="نصب سیم های اعلام حریق"/><br/><br/><br/>
                        <label for="description3">توضیحات اضافه در مورد درخواست مورد نظر :</label><br/>
                        <textarea class="form-control" name="description" id=description3></textarea><br><br/>
                        <input type="submit" value="انتخاب"><br/>
                    </form>

                    <br/><br/>
                </div>
            </main>
        </main>

    </div>
</c:if>


</body>
</html>
