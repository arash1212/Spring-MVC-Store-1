<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/26/2021
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head dir="rtl">
    <title>افزودن تصویر به محصول</title>
</head>

<jsp:include page="/header_Template.jsp"/>

<body dir="rtl">
<br/><br/>
<div class="container jumbotron">
    <c:if test="${requestScope.selectedProductToChangeImage!=null}">
        <fieldset>
            <legend><h1>آپلود تصویر محصول</h1></legend>
            <br/><br/>
            <form action="/action/product/saveImage?product_id=${requestScope.selectedProductToChangeImage.id}"
                  method="post" enctype="multipart/form-data">
                <label for="file"> تصویر محصول مورد نظر را انتخاب کنید :</label>
                <input id="file" type="file" name="productImage" class="form-control-file border"  accept="image/png, image/jpeg"/>
                <br/><br/>
                <input class="btn btn-secondary" type="submit" value="آپلود تصویر"/>
            </form>
        </fieldset>
    </c:if>

</div>

<c:if test="${requestScope.selectedProductToChangeImage==null}">
    <c:out value="ابتدا محصول مورذ نظر را انتخاب کنید"/>
</c:if>


</body>
</html>
