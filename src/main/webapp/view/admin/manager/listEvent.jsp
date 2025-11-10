<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AKKHOR | Tất cả sự kiện</title>
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
                                <h3>Tất cả sự kiện</h3>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table display data-table text-nowrap">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên CLB</th>
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
                                            <td>${clubMap[event.club_id]}</td>
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
                                                <fmt:formatDate value="${event.start}" pattern="dd/MM/yyyy" />
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${event.end}" pattern="dd/MM/yyyy" />
                                            </td>
                                            <td>
                                                <!-- Dropdown cho admin -->
                                                <form action="${pageContext.request.contextPath}/manageEventByManager" method="POST" style="margin: 0; display: inline;">
                                                    <input type="hidden" name="action" value="updateStatus">
                                                    <input type="hidden" name="eventId" value="${event.id}">
                                                    <select name="status" onchange="this.form.submit()"
                                                            style="padding: 5px 10px; border-radius: 10px; border: none; font-weight: 500; color: white; cursor: pointer; outline: none; min-width: 120px;
                                                            <c:choose>
                                                                <c:when test="${event.status == 'active'}">background-color: #9FD702;</c:when>
                                                                <c:when test="${event.status == 'pending'}">background-color: #FFA500;</c:when>
                                                                <c:when test="${event.status == 'reject'}">background-color: #DE3202;</c:when>
                                                                <c:otherwise>background-color: #6c757d;</c:otherwise>
                                                            </c:choose>"
                                                            <c:if test="${event.end lt today}">disabled style="opacity: 0.7; cursor: not-allowed;"</c:if>>
                                                        <option value="pending" <c:if test="${event.status == 'pending'}">selected</c:if>>
                                                            Chờ duyệt
                                                        </option>
                                                        <option value="active" <c:if test="${event.status == 'active'}">selected</c:if>>
                                                            Đã duyệt
                                                        </option>
                                                        <option value="reject" <c:if test="${event.status == 'reject'}">selected</c:if>>
                                                            Từ chối
                                                        </option>
                                                    </select>
                                                </form>
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
                                                           href="${pageContext.request.contextPath}/eventDetail?action=viewDetail&eventId=${event.id}">
                                                            <i class="fas fa-cogs text-dark-pastel-green"></i>Chi tiết
                                                        </a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-md-12 form-group">
                                <c:if test="${not empty deleteSuccess}">
                                    <div class="alert alert-success">
                                        <ul>
                                            <li><c:out value="${deleteSuccess}"/></li>
                                        </ul>
                                    </div>
                                </c:if>
                            </div>
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
    <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
</body>
</html>