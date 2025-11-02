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
                                        <c:if test="${not empty clubMap}">
                                            <th>Tên CLB</th>
                                        </c:if>
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
                                            <c:if test="${not empty clubMap}">
                                                <td>${clubMap[event.club_id]}</td>
                                            </c:if>
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
                                                <c:choose>
                                                    <c:when test="${not empty clubMap}">
                                                        <!-- Có clubMap - hiển thị dropdown có màu -->
                                                        <form action="${pageContext.request.contextPath}/manageEventByManager" method="POST" style="margin: 0; display: inline;">
                                                            <input type="hidden" name="action" value="updateStatus">
                                                            <input type="hidden" name="eventId" value="${event.id}">
                                                            <select name="status" onchange="this.form.submit()"
                                                                    style="padding: 5px 10px; border-radius: 10px; border: none; font-weight: 500; color: white; cursor: pointer; outline: none; min-width: 120px;
                                                                    <c:choose>
                                                                        <c:when test="${event.status == 'active'}">background-color: #28a745;</c:when>
                                                                        <c:when test="${event.status == 'pending'}">background-color: #ffc107;</c:when>
                                                                        <c:when test="${event.status == 'reject'}">background-color: #dc3545;</c:when>
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
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- Không có clubMap - hiển thị span như cũ -->
                                                        <c:choose>
                                                            <c:when test="${event.status == 'active'}">
                                                                <span style="color: white; padding: 5px 10px; background-color: #28a745; font-weight: 500; border-radius: 10px;">
                                                                    Đã duyệt
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${event.status == 'pending'}">
                                                                <span style="color: white; padding: 5px 10px; background-color: #ffc107; font-weight: 500; border-radius: 10px;">
                                                                    Chờ duyệt
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${event.status == 'reject'}">
                                                                <span style="color: white; padding: 5px 10px; background-color: #dc3545; font-weight: 500; border-radius: 10px;">
                                                                    Từ chối
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="color: white; padding: 5px 10px; background-color: #6c757d; font-weight: 500; border-radius: 10px;">
                                                                    ${event.status}
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
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
                                                        <a class="dropdown-item view-event-detail" href="#"
                                                           data-toggle="modal" data-target="#eventDetailModal"
                                                           data-event-id="${event.id}"
                                                           data-event-title="${event.title}"
                                                           data-event-location="${areaMap[event.area_id] != null ? areaMap[event.area_id] : 'Chưa xác định'}"
                                                           data-event-start="<fmt:formatDate value='${event.start}' pattern='dd/MM/yyyy' />"
                                                           data-event-end="<fmt:formatDate value='${event.end}' pattern='dd/MM/yyyy' />"
                                                           data-event-status="${event.status}"
                                                           data-event-created="<fmt:formatDate value='${event.created_at}' pattern='dd/MM/yyyy' />"
                                                           data-event-description="${event.description}">
                                                            <i class="fas fa-eye text-dark-pastel-green"></i> Chi tiết
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

    <!-- Modal hiển thị chi tiết sự kiện -->
    <div class="modal fade" id="eventDetailModal" tabindex="-1" role="dialog" aria-labelledby="eventDetailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventDetailModalLabel">Chi tiết sự kiện</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Thông tin sự kiện -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Tên sự kiện:</label>
                                <p id="modal-event-title" class="form-control-plaintext border-bottom pb-2"></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Địa điểm:</label>
                                <p id="modal-event-location" class="form-control-plaintext border-bottom pb-2"></p>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Ngày bắt đầu:</label>
                                <p id="modal-event-start" class="form-control-plaintext border-bottom pb-2"></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Ngày kết thúc:</label>
                                <p id="modal-event-end" class="form-control-plaintext border-bottom pb-2"></p>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Trạng thái:</label>
                                <p id="modal-event-status" class="form-control-plaintext border-bottom pb-2"></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Ngày tạo:</label>
                                <p id="modal-event-created" class="form-control-plaintext border-bottom pb-2"></p>
                            </div>
                        </div>
                    </div>

                    <div class="form-group mb-4">
                        <label class="font-weight-bold">Mô tả sự kiện:</label>
                        <div id="modal-event-description" class="border p-3 rounded bg-light" style="min-height: 80px;"></div>
                    </div>

                    <!-- Bảng nhiệm vụ trong sự kiện -->
                    <div class="form-group">
                        <label class="font-weight-bold">Nhiệm vụ trong sự kiện:</label>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped" id="taskTable">
                                <thead class="thead-light">
                                    <tr>
                                        <th>Vai trò</th>
                                        <th>Mô tả nhiệm vụ</th>
                                    </tr>
                                </thead>
                                <tbody id="taskTableBody">
                                    <!-- Nội dung nhiệm vụ sẽ được load ở đây -->
                                </tbody>
                            </table>
                        </div>
                        <div id="noTasksMessage" class="text-center text-muted p-3 border rounded" style="display: none;">
                            <i class="fas fa-info-circle"></i> Chưa có nhiệm vụ
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
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
        $(document).ready(function() {
            // Xử lý hiển thị modal chi tiết sự kiện
            $('.view-event-detail').click(function() {
                // Lấy dữ liệu từ data attributes
                var eventId = $(this).data('event-id');
                var eventTitle = $(this).data('event-title');
                var eventLocation = $(this).data('event-location');
                var eventStart = $(this).data('event-start');
                var eventEnd = $(this).data('event-end');
                var eventStatus = $(this).data('event-status');
                var eventCreated = $(this).data('event-created');
                var eventDescription = $(this).data('event-description');

                // Định dạng trạng thái
                var statusText = '';
                var statusClass = '';
                switch(eventStatus) {
                    case 'active':
                        statusText = 'Đã duyệt';
                        statusClass = 'badge badge-success';
                        break;
                    case 'pending':
                        statusText = 'Chờ duyệt';
                        statusClass = 'badge badge-warning';
                        break;
                    case 'reject':
                        statusText = 'Từ chối';
                        statusClass = 'badge badge-danger';
                        break;
                    default:
                        statusText = eventStatus;
                        statusClass = 'badge badge-secondary';
                }

                // Điền thông tin sự kiện vào modal
                $('#modal-event-title').text(eventTitle || 'Không có thông tin');
                $('#modal-event-location').text(eventLocation || 'Không có thông tin');
                $('#modal-event-start').text(eventStart || 'Không có thông tin');
                $('#modal-event-end').text(eventEnd || 'Không có thông tin');
                $('#modal-event-status').html('<span class="' + statusClass + '">' + statusText + '</span>');
                $('#modal-event-created').text(eventCreated || 'Không có thông tin');

                // Xử lý mô tả sự kiện
                if (eventDescription && eventDescription.trim() !== '') {
                    $('#modal-event-description').html(eventDescription);
                } else {
                    $('#modal-event-description').html('<em class="text-muted">Không có mô tả</em>');
                }

                // Lấy danh sách task từ taskMap - SỬA LẠI PHẦN NÀY
                var tasks = getTasksForEvent(eventId);

                // Hiển thị nhiệm vụ
                displayTasks(tasks);
            });

            // Hàm lấy tasks theo eventId
            function getTasksForEvent(eventId) {
                // Sử dụng JSTL để tạo mảng JavaScript
                var taskMap = {};
                <c:forEach items="${taskMap}" var="entry">
                    taskMap[${entry.key}] = [
                        <c:forEach items="${entry.value}" var="task" varStatus="taskStatus">
                            {
                                id: ${task.id},
                                event_id: ${task.event_id},
                                name: "${task.name}",
                                description: "${task.description}",
                                account_id: ${task.account_id},
                                account_name: "${task.account_name}",
                                created_at: "${task.created_at}",
                                updated_at: "${task.updated_at}"
                            }<c:if test="${not taskStatus.last}">,</c:if>
                        </c:forEach>
                    ];
                </c:forEach>
                return taskMap[eventId] || [];
            }

            // Hàm hiển thị tasks
            function displayTasks(tasks) {
                var taskTableBody = $('#taskTableBody');
                var noTasksMessage = $('#noTasksMessage');
                var taskTable = $('#taskTable');

                // Xóa nội dung cũ
                taskTableBody.empty();

                if (tasks && tasks.length > 0) {
                    taskTable.show();
                    noTasksMessage.hide();

                    // Thêm từng task vào bảng
                    tasks.forEach(function(task) {
                        var taskName = task.name || 'Chưa xác định';  // Sửa taskName thành name
                        var taskDescription = task.description || 'Không có mô tả';

                        var row = '<tr>' +
                                    '<td class="font-weight-bold">' + taskName + '</td>' +
                                    '<td>' + taskDescription + '</td>' +
                                  '</tr>';
                        taskTableBody.append(row);
                    });
                } else {
                    taskTable.hide();
                    noTasksMessage.show();
                }
            }
        });
    </script>
</body>
</html>