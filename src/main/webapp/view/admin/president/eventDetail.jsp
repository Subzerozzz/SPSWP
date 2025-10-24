<%--
  Created by IntelliJ IDEA.
  User: vankh
  Date: 9/25/2025
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AKKHOR | Event Detail</title>
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
                <div class="breadcrumbs-area">
                    <h3>Chi Tiết Sự Kiện</h3>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/event?action=list">Quản lý sự kiện</a>
                        </li>
                        <li>Chi tiết sự kiện</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->

                <!-- Event Details Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>Thông tin sự kiện</h3>
                            </div>
                        </div>

                        <form class="new-added-form" action="${pageContext.request.contextPath}/event" method="POST">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="${event.id}">

                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-12 form-group">
                                    <label>Tên sự kiện</label>
                                    <input type="text" class="form-control" value="${event.title}" readonly>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-12 form-group">
                                    <label>Địa điểm</label>
                                    <input type="text" class="form-control"
                                           value="${areaMap[event.area_id]}"
                                           readonly>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-12 form-group">
                                    <label>Ngày bắt đầu</label>
                                    <input type="datetime-local" name="start" class="form-control"
                                           value="<fmt:formatDate value="${event.start}" pattern="yyyy-MM-dd'T'HH:mm" />">
                                </div>
                                <div class="col-xl-6 col-lg-6 col-12 form-group">
                                    <label>Ngày kết thúc</label>
                                    <input type="text" class="form-control"
                                           value="<fmt:formatDate value="${event.end}" pattern="dd/MM/yyyy HH:mm" />"
                                           readonly>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-12 form-group">
                                    <label>Trạng thái</label>
                                    <input type="text" class="form-control"
                                           value="<c:choose>
                                                <c:when test="${event.status == 'active' || event.status == 'approved'}">Đã duyệt</c:when>
                                                <c:when test="${event.status == 'pending'}">Chờ duyệt</c:when>
                                                <c:when test="${event.status == 'rejected'}">Từ chối</c:when>
                                                <c:when test="${event.status == 'cancelled'}">Đã hủy</c:when>
                                                <c:otherwise>${event.status}</c:otherwise>
                                            </c:choose>"
                                           readonly>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-12 form-group">
                                    <label>Ngày tạo</label>
                                    <input type="text" class="form-control"
                                           value="<fmt:formatDate value="${event.created_at}" pattern="dd/MM/yyyy" />"
                                           readonly>
                                </div>
                                <div class="col-12 form-group mg-t-8">
                                    <button type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Cập nhật</button>
                                    <a href="${pageContext.request.contextPath}/event?action=list" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Quay lại</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Event Details End Here -->

                <!-- Members Section Start Here -->
                <div class="row">
                    <!-- Club Members Start Here -->
                    <div class="col-lg-6">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Danh sách thành viên CLB</h3>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table display data-table text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Họ tên</th>
                                                <th>Vai trò</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty listAccount}">
                                                <c:forEach var="account" items="${listAccount}">
                                                    <tr>
                                                        <td>${account.id}</td>
                                                        <td>${account.fullname}</td>
                                                        <td>${accountRoles[account.id]}</td>

                                                        <td>
                                                            <button class="btn btn-primary btn-sm"
                                                                    onclick="showAddForm(${account.id})">
                                                                <i class="fas fa-plus"></i> Thêm
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${empty listAccount}">
                                                <tr>
                                                    <td colspan="5" class="text-center">Không có thành viên nào trong CLB</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Club Members End Here -->

                    <!-- Participants Start Here -->
                    <div class="col-lg-6">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Thành viên tham gia sự kiện</h3>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table display data-table text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tên nhiệm vụ</th>
                                                <th>Mô tả</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty tasks}">
                                                <c:forEach var="task" items="${tasks}" varStatus="status">
                                                    <tr>
                                                        <td>${status.index + 1}</td>
                                                        <td>${task.name}</td> <!-- Dùng task.name thay vì task.taskName -->
                                                        <td>${task.description}</td> <!-- Dùng task.description thay vì task.taskDescription -->
                                                        <td>
                                                            <div class="dropdown">
                                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                                    <span class="flaticon-more-button-of-three-dots"></span>
                                                                </a>
                                                                <div class="dropdown-menu dropdown-menu-right">
                                                                    <a class="dropdown-item" href="#"
                                                                       onclick="showEditForm(${task.id}, '${task.name}', '${task.description}')">
                                                                        <i class="fas fa-edit text-dark-pastel-green"></i>Sửa
                                                                    </a>
                                                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/event?action=deleteTask&taskId=${task.id}&eventId=${event.id}">
                                                                        <i class="fas fa-times text-orange-red"></i>Xóa
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${empty tasks}">
                                                <tr>
                                                    <td colspan="4" class="text-center">Chưa có thành viên nào tham gia sự kiện</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Participants End Here -->
                </div>
                <!-- Members Section End Here -->
            </div>
        </div>
        <!-- Page Area End Here -->
    </div>

    <!-- Modal Form Thêm Nhiệm vụ -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm nhiệm vụ</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="${pageContext.request.contextPath}/eventDetail" method="POST">
                    <input type="hidden" name="action" value="addParticipant">
                    <input type="hidden" name="eventId" value="${event.id}">
                    <input type="hidden" name="accountId" id="addAccountId">

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên nhiệm vụ</label>
                            <input type="text" class="form-control" name="taskName" required>
                        </div>
                        <div class="form-group">
                            <label>Mô tả</label>
                            <textarea class="form-control" name="taskDescription" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-primary">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Form Sửa Nhiệm vụ -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sửa nhiệm vụ</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="${pageContext.request.contextPath}/event" method="POST">
                    <input type="hidden" name="action" value="updateTask">
                    <input type="hidden" name="eventId" value="${event.id}">
                    <input type="hidden" name="taskId" id="editParticipantId">

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên nhiệm vụ</label>
                            <input type="text" class="form-control" name="taskName" id="editTaskName" required>
                        </div>
                        <div class="form-group">
                            <label>Mô tả</label>
                            <textarea class="form-control" name="taskDescription" id="editTaskDescription" rows="3"></textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>
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

    <script>
        // Hiển thị form thêm
        function showAddForm(accountId) {
            document.getElementById('addAccountId').value = accountId;
            $('#addModal').modal('show');
        }

        // Hiển thị form sửa với dữ liệu hiện tại
        function showEditForm(taskId, taskName, taskDescription) {
            document.getElementById('editParticipantId').value = taskId;
            document.getElementById('editTaskName').value = taskName;
            document.getElementById('editTaskDescription').value = taskDescription;
            $('#editModal').modal('show');
        }
    </script>
</body>

</html>