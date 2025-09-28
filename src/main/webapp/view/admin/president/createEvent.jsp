<%--
  Created by IntelliJ IDEA.
  User: vankh
  Date: 9/25/2025
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng ký sự kiện</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">

    <!-- iziToast -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
</head>

<body>
<div id="wrapper" class="wrapper bg-ash">
    <!-- Header -->
    <jsp:include page="../common/header.jsp"/>
    <!-- Sidebar -->
    <jsp:include page="../common/sider.jsp"/>

    <div class="dashboard-content-one">
        <br>
        <div class="card height-auto">
            <div class="card-body">
                <div class="heading-layout1">
                    <div class="item-title">
                        <h3>Đăng ký sự kiện mới</h3>
                    </div>
                </div>

                <form action="${pageContext.request.contextPath}/event?action=register" method="post" class="new-added-form">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-12 form-group">
                            <label>Tên sự kiện *</label>
                            <input type="text" name="eventName" placeholder="Nhập tên sự kiện" class="form-control" required>
                        </div>

                        <div class="col-xl-6 col-lg-6 col-12 form-group">
                            <label>Địa điểm *</label>
                            <input type="text" name="location" placeholder="Nhập địa điểm" class="form-control" required>
                        </div>

                        <div class="col-xl-6 col-lg-6 col-12 form-group">
                            <label>Ngày bắt đầu *</label>
                            <input type="date" name="startDate" class="form-control" required>
                        </div>

                        <div class="col-xl-6 col-lg-6 col-12 form-group">
                            <label>Ngày kết thúc *</label>
                            <input type="date" name="endDate" class="form-control" required>
                        </div>

                        <div class="col-12 form-group">
                            <label>Mô tả sự kiện</label>
                            <textarea name="description" class="form-control" rows="4" placeholder="Mô tả chi tiết sự kiện..."></textarea>
                        </div>

                        <div class="col-12 form-group">
                            <label>Ghi chú thêm</label>
                            <textarea name="note" class="form-control" rows="3" placeholder="Ghi chú (nếu có)..."></textarea>
                        </div>

                        <div class="col-12 form-group mg-t-8">
                            <button type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Đăng ký</button>
                            <button type="reset" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Làm mới</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp"/>
    </div>
</div>

<script src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>

<c:if test="${not empty message}">
    <script>
        iziToast.success({
            title: "Thông báo",
            message: "${message}",
            position: "topRight",
            timeout: 3000
        });
    </script>
    <%
        session.removeAttribute("message");
    %>
</c:if>

</body>
</html>
