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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

                            <form class="new-added-form" action="${pageContext.request.contextPath}/eventDetail" method="POST">
                                <input type="hidden" name="action" value="updateEvent">
                                <input type="hidden" name="eventId" value="${event.id}">

                                <div class="row">

                                    <c:choose>
                                        <c:when test="${event.status eq 'pending'}">
                                            <div class="col-xl-6 col-lg-6 col-12 form-group">
                                                <label>Tên sự kiện</label>
                                                <input type="text" name="title" class="form-control" value="${event.title}" required>
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-12 form-group">
                                                <label>Địa điểm</label>
                                                <select name="area" class="form-control" required>
                                                    <option value="">-- Chọn địa điểm --</option>
                                                    <c:forEach var="a" items="${listArea}">
                                                        <option value="${a.id}"
                                                                <c:if test="${event.area_id == a.id}">selected</c:if>>
                                                            ${a.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-12 form-group">
                                                <label>Mô tả</label>
                                                <textarea style="height: 150px" name="description" class="form-control" rows="4" required>${event.description}</textarea>
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-12 form-group">
                                                <label>Ngày bắt đầu</label>
                                                <input type="date" name="start" class="form-control"
                                                       value="<fmt:formatDate value="${event.start}" pattern="yyyy-MM-dd" />">
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-12 form-group">
                                                <label>Ngày kết thúc</label>
                                                <input type="date" name="end" class="form-control"
                                                       value="<fmt:formatDate value="${event.end}" pattern="yyyy-MM-dd" />">
                                            </div>

                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-xl-6 col-lg-6 col-12 form-group">
                                                <label>Tên sự kiện</label>
                                                <input type="text" class="form-control" value="${event.title}" readonly>
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-12 form-group">
                                                <label>Địa điểm</label>
                                                <input type="text" class="form-control" value="${areaMap[event.area_id]}" readonly>
                                            </div>
                                            <div class="col-12 form-group">
                                                <label>Mô tả</label>
                                                <textarea style="height: 150px" name="description" class="form-control" rows="4" readonly>${event.description}</textarea>
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-12 form-group">
                                                <label>Ngày bắt đầu</label>
                                                <input type="text" class="form-control"
                                                       value="<fmt:formatDate value="${event.start}" pattern="dd/MM/yyyy" />" readonly>
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-12 form-group">
                                                <label>Ngày kết thúc</label>
                                                <input type="text" class="form-control"
                                                       value="<fmt:formatDate value="${event.end}" pattern="dd/MM/yyyy" />" readonly>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="col-xl-6 col-lg-6 col-12 form-group">
                                        <label>Trạng thái</label>
                                        <input type="text" class="form-control text-center fw-bold"
                                               style="<c:choose>
                                                   <c:when test="${event.status == 'active' || event.status == 'approved'}">background-color: #d4edda; color: #155724; border-color: #c3e6cb;</c:when>
                                                   <c:when test="${event.status == 'pending'}">background-color: #fff3cd; color: #856404; border-color: #ffeaa7;</c:when>
                                                   <c:when test="${event.status == 'rejected'}">background-color: #f8d7da; color: #721c24; border-color: #f5c6cb;</c:when>
                                                   <c:when test="${event.status == 'cancelled'}">background-color: #e2e3e5; color: #383d41; border-color: #d6d8db;</c:when>
                                                   <c:otherwise>background-color: #f8f9fa; color: #495057;</c:otherwise>
                                               </c:choose>"
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
                                        <div class="col-md-12 form-group">
                                            <c:if test="${not empty success}">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li><c:out value="${success}"/></li>
                                                    </ul>
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty error}">
                                                <div class="alert alert-danger">
                                                    <ul>
                                                        <li><c:out value="${error}"/></li>
                                                    </ul>
                                                </div>
                                            </c:if>
                                        </div>
                                        <button type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Cập nhật</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Event Details End Here -->

                    <!-- Kiểm tra sự kiện đã kết thúc -->
                    <jsp:useBean id="now" class="java.util.Date"/>
                    <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate var="eventEnd" value="${event.end}" pattern="yyyy-MM-dd"/>

                    <!-- Thông báo sự kiện đã kết thúc -->
                    <c:if test="${eventEnd le today}">
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i> Sự kiện đã kết thúc. Không thể thêm/sửa thành viên tham gia.
                        </div>
                    </c:if>
                    <c:if test="${not empty deleteTaskSuccess}">
                        <div class="alert alert-success">
                            <ul>
                                <li><c:out value="${deleteTaskSuccess}"/></li>
                            </ul>
                        </div>
                    </c:if>

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
                                                    <c:forEach var="account" items="${listAccount}" varStatus="status">
                                                        <tr>
                                                            <td>${status.index+1}</td>
                                                            <td>${account.fullname}</td>
                                                            <td>${accountRoles[account.id]}</td>
                                                            <td>
                                                                <c:if test="${eventEnd gt today}">
                                                                    <button class="btn btn-primary btn-sm"
                                                                            onclick="showAddForm(${account.id})">
                                                                        <i class="fas fa-plus"></i> Thêm
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${eventEnd le today}">
                                                                    <span class="text-muted">Sự kiện đã kết thúc</span>
                                                                </c:if>
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
                                                    <th>Tên thành viên</th>
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
                                                            <td>${task.account_name}</td>
                                                            <td>${task.name}</td>
                                                            <td>${task.description}</td>
                                                            <td>
                                                                <c:if test="${eventEnd gt today}">
                                                                    <div class="dropdown">
                                                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                                            <span class="flaticon-more-button-of-three-dots"></span>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a class="dropdown-item" href="#"
                                                                               onclick="showEditForm(${task.id}, '${fn:escapeXml(task.name)}', '${fn:escapeXml(task.description)}')">
                                                                                <i class="fas fa-edit text-dark-pastel-green"></i>Sửa
                                                                            </a>
                                                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/eventDetail?action=deleteTask&taskId=${task.id}&eventId=${event.id}&accountId=${task.account_id}">
                                                                                <i class="fas fa-times text-orange-red"></i>Xóa
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${eventEnd le today}">
                                                                    <span class="text-muted">Đã kết thúc</span>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty tasks}">
                                                    <tr>
                                                        <td colspan="5" class="text-center">Chưa có thành viên nào tham gia sự kiện</td>
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
                    <form action="${pageContext.request.contextPath}/eventDetail" method="POST">
                        <input type="hidden" name="action" value="updateTask">
                        <input type="hidden" name="eventId" value="${event.id}"> <!-- Lấy eventId từ event object -->
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
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Cập nhật</button> <!-- Nút submit -->
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
        <script>
            const blockedEvents = [
            <c:forEach var="e" items="${blockedEvents}">
            {
            areaId: ${e.area_id},
                    start: "${e.start}",
                    end: "${e.end}"
            }<c:if test="${!fn:contains(e, blockedEvents[blockedEvents.size()-1])}">,</c:if>
            </c:forEach>
            ];

            const areaSelect = document.querySelector('select[name="area"]');
            const startInput = document.querySelector('input[name="start_at"]');
            const endInput = document.querySelector('input[name="end_at"]');

            areaSelect.addEventListener('change', () => {
                const selectedArea = parseInt(areaSelect.value);
                const nowBlocked = blockedEvents.filter(e => e.areaId === selectedArea);

                if (nowBlocked.length > 0) {
                    // lấy min và max của các khoảng bị chặn
                    const minDate = new Date(Math.min(...nowBlocked.map(e => new Date(e.start).getTime())));
                    const maxDate = new Date(Math.max(...nowBlocked.map(e => new Date(e.end).getTime())));

                    // disable khoảng thời gian bị trùng
                    startInput.min = new Date().toISOString().slice(0, 16);
                    startInput.addEventListener('input', () => {
                        const val = new Date(startInput.value);
                        if (val >= minDate && val <= maxDate) {
                            alert("Khoảng thời gian này đã có sự kiện tại địa điểm này!");
                            startInput.value = "";
                        }
                    });

                    endInput.addEventListener('input', () => {
                        const val = new Date(endInput.value);
                        if (val >= minDate && val <= maxDate) {
                            alert("Khoảng thời gian này đã có sự kiện tại địa điểm này!");
                            endInput.value = "";
                        }
                    });
                } else {
                    startInput.min = "";
                }
            });
        </script>
    </body>

</html>