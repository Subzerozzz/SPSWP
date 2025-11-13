<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Yêu cầu của tôi</title>
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
    <!-- Data Table CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/jquery.dataTables.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">
    <!-- Modernize js -->
    <script src="${pageContext.request.contextPath}/admin/js/modernizr-3.6.0.min.js"></script>
</head>

<body>
    <!-- Preloader Start Here -->
    <div id="preloader"></div>

    <div id="wrapper" class="wrapper bg-ash">
        <!-- Header Menu Area Start Here -->
        <jsp:include page="../../admin/common/header.jsp"></jsp:include>
        <!-- Header Menu Area End Here -->

        <!-- Page Area Start Here -->
        <div class="dashboard-page-one">
            <!-- Sidebar Area Start Here -->
            <jsp:include page="../../admin/common/sider.jsp"></jsp:include>
            <!-- Sidebar Area End Here -->

            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Yêu cầu của tôi</h3>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                        </li>
                        <li>Yêu cầu của tôi</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->

                <!-- Yêu cầu tham gia CLB Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>Yêu cầu tham gia CLB</h3>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table display data-table text-nowrap">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên CLB</th>
                                        <th>Lý do</th>
                                        <th>Giới thiệu bản thân</th>
                                        <th>Ngày gửi</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="request" items="${clubList}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${clubMap[request.id]}</td>
                                            <td>${request.reason}</td>
                                            <td>${request.self}</td>
                                            <td>
                                                <fmt:formatDate value="${request.created_at}" pattern="dd/MM/yyyy HH:mm" />
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${request.status == 'pending'}">
                                                        <span class="badge badge-warning">Chờ duyệt</span>
                                                    </c:when>
                                                    <c:when test="${request.status == 'approved'}">
                                                        <span class="badge badge-success">Đã duyệt</span>
                                                    </c:when>
                                                    <c:when test="${request.status == 'rejected'}">
                                                        <span class="badge badge-danger">Từ chối</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-secondary">${request.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty clubList}">
                                        <tr>
                                            <td colspan="6" class="text-center">Chưa có yêu cầu tham gia CLB nào</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Yêu cầu tham gia CLB End Here -->

                <!-- Yêu cầu tham gia sự kiện Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>Yêu cầu tham gia sự kiện</h3>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table display data-table text-nowrap">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên sự kiện</th>
                                        <th>CLB tổ chức</th>
                                        <th>Ngày gửi</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="request" items="${eventList}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${eventMap[request.id]}</td>
                                            <td>${eventClubMap[request.id]}</td>
                                            <td>
                                                <fmt:formatDate value="${request.created_at}" pattern="dd/MM/yyyy HH:mm" />
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${request.status == 'pending'}">
                                                        <span class="badge badge-warning">Chờ duyệt</span>
                                                    </c:when>
                                                    <c:when test="${request.status == 'approved'}">
                                                        <span class="badge badge-success">Đã duyệt</span>
                                                    </c:when>
                                                    <c:when test="${request.status == 'rejected'}">
                                                        <span class="badge badge-danger">Từ chối</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-secondary">${request.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty eventList}">
                                        <tr>
                                            <td colspan="5" class="text-center">Chưa có yêu cầu tham gia sự kiện nào</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Yêu cầu tham gia sự kiện End Here -->
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
    <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
</body>
</html>