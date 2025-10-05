<%-- 
    Document   : detail-club.jsp
    Created on : Oct 5, 2025, 9:08:54 AM
    Author     : Dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/teacher-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:18 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AKKHOR | Teacher Details</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/admin/img/favicon.png">
    <!-- Normalize CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/normalize.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/all.min.css">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/fonts/flaticon.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/animate.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">
    <!-- Modernize js -->
    <script src="${pageContext.request.contextPath}/admin/js/modernizr-3.6.0.min.js"></script>
</head>

<body>
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <div id="wrapper" class="wrapper bg-ash">
        <!-- Header Menu Area Start Here -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- Header Menu Area End Here -->
        <!-- Page Area Start Here -->
        <div class="dashboard-page-one">
            <!-- Sidebar Area Start Here -->
            <jsp:include page="../common/sider.jsp"></jsp:include>   
            <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <br></br>
                <!-- Breadcubs Area End Here -->
                <!-- Student Table Area Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                        <div class="single-info-details">
                            <div class="item-content">
                                <div class="header-inline item-header">
                                    <h3 class="text-dark-medium font-medium">${club.name}</h3>
                                </div>
                                <p>${club.description}</p>
                                <div class="info-table table-responsive">
                                    <table class="table text-nowrap">
                                        <tbody>
                                            <tr>
                                                <td>Trưởng CLB:</td>
                                                <td class="font-medium text-dark-medium">${president.fullname}</td>
                                            </tr>
                                            <tr>
                                                <td>Tạo ngày:</td>
                                                <td class="font-medium text-dark-medium">${club.created_at}</td>
                                            </tr>
                                            <tr>
                                                <td>Cập nhật:</td>
                                                <td class="font-medium text-dark-medium">${club.created_at}</td>
                                            </tr>
                                            <tr>
                                                <td>Loại CLB:</td>
                                                <td class="font-medium text-dark-medium" style="font-style: italic; color: gray">${categoryClub.name}</td>
                                            </tr>
                                            <tr>
                                                <td>Trạng thái:</td>
                                                <td class="font-medium text-dark-medium">
                                                    <c:choose>
                                                      <c:when test="${club.status == 'active'}">
                                                        <span style="color: white; 
                                                          padding: 5px 10px; 
                                                          background-color: #9FD702;
                                                          font-weight: 500;
                                                          border-radius: 10px;
                                                          ">
                                                          Active
                                                        </span>
                                                      </c:when>
                                                      <c:otherwise>
                                                        <span style="color: white; 
                                                              padding: 5px 10px; 
                                                              background-color: #DE3202;
                                                              font-weight: 500;
                                                              border-radius: 10px;
                                                              ">Banned</span>
                                                      </c:otherwise>
                                                    </c:choose>
                                            </tr>
                                            <tr>
                                                <td>Số lượng thành viên:</td>
                                                <td class="font-medium text-dark-medium">
                                                    ${numberOfClub}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Số lượng sự kiện:</td>
                                                <td class="font-medium text-dark-medium">stevenjohnson@gmail.com</td>
                                            </tr>
                                            <tr>
                                                <td>Email:</td>
                                                <td class="font-medium text-dark-medium" style="font-style: italic; color: gray">${president.email}</td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ:</td>
                                                <td class="font-medium text-dark-medium">Trường Đại học FPT</td>
                                            </tr>
                                            <tr>
                                                <td>Phone:</td>
                                                <td class="font-medium text-dark-medium">${president.phone}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Student Table Area End Here -->
                <jsp:include page="../common/footer.jsp"></jsp:include>
            </div>
        </div>
        <!-- Page Area End Here -->
    </div>
    <!-- jquery-->
    <script src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
    <!-- Plugins js -->
    <script src="${pageContext.request.contextPath}/admin/js/plugins.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/admin/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
    <!-- Scroll Up Js -->
    <script src="${pageContext.request.contextPath}/admin/js/jquery.scrollUp.min.js"></script>
    <!-- Custom Js -->
    <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/teacher-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:19 GMT -->
</html>
