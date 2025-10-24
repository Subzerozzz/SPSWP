
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="">


    <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-student.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:13 GMT -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>AKKHOR | All Students</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/admin/img/favicon.png">
        <!-- Normalize CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin//css/normalize.css">
        <!-- Main CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css"> <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css">
        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/all.min.css">
        <!-- Flaticon CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/fonts/flaticon.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/animate.min.css">
        <!-- Data Table CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/jquery.dataTables.min.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">

        <!--IzizToast-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
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
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>All Students Data</h3>
                                    </div>
                                </div>
                                <!--Form Search-->
                                <form class="mg-b-20">
                                    <div class="row gutters-8">
                                        <div class="col-3-xxxl col-xl-3 col-lg-3 col-12 form-group">
                                            <input type="text" placeholder="Search by Role ..." class="form-control">
                                        </div>
                                        <div class="col-4-xxxl col-xl-4 col-lg-3 col-12 form-group">
                                            <input type="text" placeholder="Search by Name ..." class="form-control">
                                        </div>
                                        <div class="col-4-xxxl col-xl-3 col-lg-3 col-12 form-group">
                                            <input type="text" placeholder="Search by Email ..." class="form-control">
                                        </div>
                                        <div class="col-1-xxxl col-xl-2 col-lg-3 col-12 form-group">
                                            <button type="submit" class="fw-btn-fill btn-gradient-yellow">SEARCH</button>
                                        </div>
                                    </div>
                                </form>
                                <!--Form Search-->
                                <div class="table-responsive">
                                    <table class="table display data-table text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên sự kiện</th>
                                                <th>Địa điểm</th>
                                                <th>Ngày bắt đầu</th>
                                                <th>Ngày kết thúc</th>
                                                <th>Trạng thái</th>
                                                <th>Ngày tạo</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="event" items="${listEvent}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${event.title}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${areaMap[event.area_id] != null}">
                                                            ${areaMap[event.area_id]}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span style="color: #999;">Chưa xác định</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                        <fmt:formatDate value="${event.start}" pattern="dd/MM/yyyy HH:mm" />
                                        </td>
                                        <td>
                                        <fmt:formatDate value="${event.end}" pattern="dd/MM/yyyy HH:mm" />
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${event.status == 'active' || event.status == 'approved'}">
                                                    <span style="color: white;
                                                          padding: 5px 10px;
                                                          background-color: #9FD702;
                                                          font-weight: 500;
                                                          border-radius: 10px;">
                                                        Đã duyệt
                                                    </span>
                                                </c:when>
                                                <c:when test="${event.status == 'pending'}">
                                                    <span style="color: white;
                                                          padding: 5px 10px;
                                                          background-color: #FFA500;
                                                          font-weight: 500;
                                                          border-radius: 10px;">
                                                        Chờ duyệt
                                                    </span>
                                                </c:when>
                                                <c:when test="${event.status == 'rejected'}">
                                                    <span style="color: white;
                                                          padding: 5px 10px;
                                                          background-color: #DE3202;
                                                          font-weight: 500;
                                                          border-radius: 10px;">
                                                        Từ chối
                                                    </span>
                                                </c:when>
                                                <c:when test="${event.status == 'cancelled'}">
                                                    <span style="color: white;
                                                          padding: 5px 10px;
                                                          background-color: #6c757d;
                                                          font-weight: 500;
                                                          border-radius: 10px;">
                                                        Đã hủy
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color: white;
                                                          padding: 5px 10px;
                                                          background-color: #6c757d;
                                                          font-weight: 500;
                                                          border-radius: 10px;">
                                                        ${event.status}
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                        <fmt:formatDate value="${event.created_at}" pattern="dd/MM/yyyy" />
                                        </td>
                                        <td>
                                            <div class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                    <span class="flaticon-more-button-of-three-dots"></span>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right">

                                                    <a class="dropdown-item"
                                                       href="${pageContext.request.contextPath}/eventDetail?action=viewDetail&&eventId=${event.id}">
                                                        <i class="fas fa-cogs text-dark-pastel-green"></i>Quản lý
                                                    </a>
                                                    <a class="dropdown-item" href="javascript:void(0);"
                                                       onclick="confirmDelete(${event.id});">
                                                        <i class="fas fa-times text-orange-red"></i>Xóa
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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
        <!-- Data Table Js -->
        <script src="${pageContext.request.contextPath}/admin/js/jquery.dataTables.min.js"></script>
        <!-- Custom Js -->
        <script src="${pageContext.request.contextPath}/admin/js/main.js"></script
    </body>

</html>