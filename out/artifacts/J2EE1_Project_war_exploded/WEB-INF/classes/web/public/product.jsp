<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Arash
  Date: 5/16/2021
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>صفحه محصول</title>


    <script>

        function deleteComment(commentId, productID) {
            window.location = "/action/comment/delete?id=" + commentId + "&productID=" + productID;
        }

        function comments(productID, userID, comment_Text_Id) {
            window.location = "/action/comment/save?productID=" + productID + "&userID=" + userID + "&Message=" + document.getElementById(comment_Text_Id).value;
        }

        if (performance.navigation.type == performance.navigation.TYPE_RELOAD) {
            window.location = "/action/product/selectProduct?id=" +${param.id};
        }
    </script>
</head>

<jsp:include page="/header_Template.jsp"/>

<body dir="rtl">
<%--<a href="/index.jsp">صفحه اصلی</a>--%>
<br/><br/><br/>

<c:if test="${sessionScope.selectedProduct!=null&&param.id!=null&&param.id!=0}">
    <div class="container-fluid">
        <fieldset>
            <legend><h1> نام محصول انتخاب شده : ${sessionScope.selectedProduct.product_name}</h1></legend>
            <br/>
            <table class="table-bordered table-responsive" border="1" style="width: 100%">
                <tr>
                    <th>تصویر محصول</th>
                    <th>کد محصول</th>
                    <th>نام محصول</th>
                    <th>موجودی</th>
                    <th>توضیحات</th>
                    <th>قیمت</th>
                    <th>دسته بندی</th>
                    <th>وضعیت</th>
                </tr>
                    <%--        <tr>--%>
                    <%--            <form action="/action/cartItem/save">--%>
                    <%--                <td><input type="text" name="productId" value="${param.id}" readonly></td>--%>
                    <%--                <td><input type="text" name="product_name" value="${param.product_name}" readonly></td>--%>
                    <%--                <td><input type="text" name="stock" value="${param.stock}" readonly></td>--%>
                    <%--                <td><input type="text" name="description" value="${param.description}" readonly></td>--%>
                    <%--                <td><input type="text" name="sellPrice" value="${param.sellPrice}" readonly></td>--%>
                    <%--                <td><input type="text" name="category" value="${param.category}" readonly></td>--%>
                    <%--                <td><input type="submit" value="اضافه به سبد خرید"></td>--%>
                    <%--            </form>--%>
                    <%--        </tr>--%>
                <tr>
                    <form action="/action/cartItem/save">
                        <td><img src="${sessionScope.selectedProduct.productImagePath}"
                                 alt="${sessionScope.selectedProduct.product_name}"
                                 style="max-width:40%;object-fit: cover"/></td>
                        <td><input type="text" class="form-control" name="productId" value="${sessionScope.selectedProduct.id}" readonly>
                        </td>
                        <td><input type="text" class="form-control" name="product_name" value="${sessionScope.selectedProduct.product_name}"
                                   readonly></td>
                        <td><input type="text" class="form-control" name="stock" value="${sessionScope.selectedProduct.stock}" readonly></td>
                        <td><input type="text" class="form-control" name="description" value="${sessionScope.selectedProduct.description}"
                                   readonly>
                        </td>
                        <td><input type="text" class="form-control" name="sellPrice" value="${sessionScope.selectedProduct.sellPrice}"
                                   readonly>
                        </td>
                        <td><input type="text" class="form-control" name="category"
                                   value="${sessionScope.selectedProduct.category.category_name}"
                                   readonly></td>
                        <c:if test="${sessionScope.selectedProduct.stock > 0}">
                            <td><input class="btn btn-primary" type="submit" value="اضافه به سبد خرید"></td>
                        </c:if>
                        <c:if test="${sessionScope.selectedProduct.stock <= 0}">
                            <td><p>نا موجود</p></td>
                        </c:if>
                    </form>
                </tr>
            </table>
    </div>
    <br/><br/>
    </fieldset>


    <div class="container">
        <fieldset>
            <legend>ثبت نظر</legend>
            <br/><br/>
            <c:if test="${sessionScope.roleName!=null}">
            <form class="form-group" action="/action/comment/save">
                    <%--                <input type="text" id="comment_text_id" name="Message" required>--%>
                <label for="comment_text_id">نظر خود را وارد کنید :</label>
                <textarea class="form-control" id="comment_text_id" name="Message" required></textarea>
                <br/>
                <input class="btn btn-dark" type="button" value="ثبت نظر"
                       onclick="comments(${sessionScope.selectedProduct.id},${sessionScope.UserID},'comment_text_id')"/>
            </form>
            </c:if>

            <c:if test="${sessionScope.roleName==null}">
            برای ثبت نظر ابتدا باید <a href="/public/login.jsp">وارد شوید</a>
            </c:if>
    </div>


    <br/><br/><br/><br/>
    <div class="container">


        <fieldset>
            <legend>بخش نظرات</legend>
            <br/>
            <c:if test="${sessionScope.selectedProductComments!=null||sessionScope.selectedProductComments.size()>0}">
                <table class="table table-bordered">
                    <tr>
                        <th>نام کاربر</th>
                        <th>نظر</th>
                        <c:if test="${sessionScope.roleName.equals('admin')}">
                            <th>حذف نظرات</th>
                        </c:if>
                    </tr>
                    <c:forEach items="${sessionScope.selectedProductComments}" var="comment">
                        <tr>
                            <!-- حذف بخشی از ایمیل-->
                            <td><c:out value="${comment.users.email.split('@')[0]} میگه : "/></td>
                            <td><c:out value="${comment.message}"/></td>
                            <c:if test="${sessionScope.roleName.equals('admin')}">
                                <td><input class="btn btn-danger" type="button" value=" حذف نظر"
                                           onclick="deleteComment(${comment.id},${sessionScope.selectedProduct.id})">
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

            <c:if test="${sessionScope.selectedProductComments==null||sessionScope.selectedProductComments.size()<=0}">
                <c:out value="نظری یافت نشد"/>
            </c:if>
            <br/><br/>
        </fieldset>
    </div>

</c:if>
<c:if test="${sessionScope.selectedProduct==null||param.id==null||param.id==0}">
    <c:out value="محصول مورد نظر یافت نشد"/>
</c:if>


</body>

<br/><br/><br/><br/>


</html>
