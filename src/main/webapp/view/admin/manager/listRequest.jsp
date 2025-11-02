<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="vi">


    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>AKKHOR | Quản lý Yêu cầu</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/admin/img/favicon.png">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin//css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css"> <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/fonts/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/animate.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/modernizr-3.6.0.min.js"></script>
    </head>

    <body>
        <div id="preloader"></div>
        <div id="wrapper" class="wrapper bg-ash">
            <jsp:include page="../common/header.jsp"></jsp:include>
                <div class="dashboard-page-one">
                <jsp:include page="../common/sider.jsp"></jsp:include>
                    <div class="dashboard-content-one">
                        <br></br>
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Tất cả Yêu cầu Thay đổi Trưởng CLB</h3>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table display data-table text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên CLB</th>
                                                <th>Người yêu cầu đổi (Cũ)</th>
                                                <th>Trưởng CLB mới</th>
                                                <th>Loại lý do</th>
                                                <th>Trạng thái</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="rq" items="${requestForms}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${mapClubs[rq.clubID].name}</td>
                                                <td>
                                                    ${mapAccounts1[rq.accountIdReq].fullname} - ${mapAccounts1[rq.accountIdReq].student_id}
                                                </td>
                                                <td>
                                                    ${mapAccounts2[rq.presidentIdNew].fullname} - ${mapAccounts2[rq.presidentIdNew].student_id}
                                                </td>
                                                <td>
                                                    ${rq.typeReason eq 'GRADUATION'?'Tốt nghiệp' : rq.typeReason eq 'TRANSFER'? 'Chuyển trường' : rq.typeReason eq 'PERSONAL'? 'Lý do cá nhân' : rq.typeReason eq 'PERFORMANCE'?  'Hiệu suất không tốt' :  rq.typeReason eq 'ELECTION'? 'Bầu cử mới' : 'Khác' }
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${rq.status == 'active'}">
                                                            <span style="color: white; padding: 5px 10px; background-color: #28a745; font-weight: 500; border-radius: 10px;">
                                                                Đã duyệt
                                                            </span>
                                                        </c:when>
                                                        <c:when test="${rq.status == 'pending'}">
                                                            <form action="${pageContext.request.contextPath}/changePresident" method="POST" class="d-inline">
                                                                <input type="hidden" name="action" value="updateStatusForm">
                                                                <input type="hidden" name="requestId" value="${rq.id}">
                                                                <select class="form-control status-select" name="status" onchange="this.form.submit()" style="padding: 5px 10px; font-weight: 500; border-radius: 10px;">
                                                                    <option value="pending" ${rq.status == 'pending' ? 'selected' : ''}>Chờ duyệt</option>
                                                                    <option value="active" ${rq.status == 'active' ? 'selected' : ''}>Đã duyệt</option>
                                                                    <option value="reject" ${rq.status == 'reject' ? 'selected' : ''}>Từ chối</option>
                                                                </select>
                                                            </form>
                                                        </c:when>
                                                        <c:when test="${rq.status == 'reject'}">
                                                            <span style="color: white; padding: 5px 10px; background-color: #dc3545; font-weight: 500; border-radius: 10px;">
                                                                Từ chối
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span style="color: white; padding: 5px 10px; background-color: #6c757d; font-weight: 500; border-radius: 10px;">
                                                                ${rq.status}
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <div class="dropdown">
                                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                            <span class="flaticon-more-button-of-three-dots"></span>
                                                        </a>

                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item view-detail" href="#"
                                                               data-toggle="modal" data-target="#requestDetailModal"
                                                               data-request-id="${rq.id}"
                                                               data-club-name="${mapClubs[rq.clubID].name}"
                                                               data-requester="${mapAccounts1[rq.accountIdReq].fullname} - ${mapAccounts1[rq.accountIdReq].student_id}"
                                                               data-new-president="${mapAccounts2[rq.presidentIdNew].fullname} - ${mapAccounts2[rq.presidentIdNew].student_id}"
                                                               data-reason-type="${rq.typeReason eq 'GRADUATION'?'Tốt nghiệp' : rq.typeReason eq 'TRANSFER'? 'Chuyển trường' : rq.typeReason eq 'PERSONAL'? 'Lý do cá nhân' : rq.typeReason eq 'PERFORMANCE'?  'Hiệu suất không tốt' :  rq.typeReason eq 'ELECTION'? 'Bầu cử mới' : 'Khác' }"
                                                               data-status="${rq.status}"
                                                               data-description="${rq.description}">
                                                                <i class="fas fa-eye text-dark-pastel-green"></i> Xem chi tiết
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
        </div>

        <!-- Modal hiển thị chi tiết yêu cầu -->
        <div class="modal fade" id="requestDetailModal" tabindex="-1" role="dialog" aria-labelledby="requestDetailModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="requestDetailModalLabel">Chi tiết Yêu cầu Thay đổi Trưởng CLB</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">ID Yêu cầu:</label>
                                    <p id="detail-request-id" class="form-control-plaintext"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">Tên CLB:</label>
                                    <p id="detail-club-name" class="form-control-plaintext"></p>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">Người yêu cầu (Cũ):</label>
                                    <p id="detail-requester" class="form-control-plaintext"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">Trưởng CLB mới:</label>
                                    <p id="detail-new-president" class="form-control-plaintext"></p>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">Loại lý do:</label>
                                    <p id="detail-reason-type" class="form-control-plaintext"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">Trạng thái:</label>
                                    <p id="detail-status" class="form-control-plaintext"></p>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="font-weight-bold">Mô tả chi tiết:</label>
                            <div id="detail-description" class="border p-3 rounded bg-light" style="min-height: 100px;">
                                <!-- Nội dung mô tả sẽ được hiển thị here -->
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>

        <script>
                                                                    $(document).ready(function () {
                                                                        // Xử lý thay đổi trạng thái
                                                                        $('.status-select').change(function () {
                                                                            var requestId = $(this).data('request-id');
                                                                            var newStatus = $(this).val();

                                                                            $.ajax({
                                                                                url: '${pageContext.request.contextPath}/manageRequest',
                                                                                type: 'POST',
                                                                                data: {
                                                                                    action: 'updateStatus',
                                                                                    requestId: requestId,
                                                                                    status: newStatus
                                                                                },
                                                                                success: function (response) {
                                                                                    iziToast.success({
                                                                                        title: 'Thành công',
                                                                                        message: 'Cập nhật trạng thái thành công',
                                                                                        position: 'topRight'
                                                                                    });

                                                                                    // Reload trang sau 1 giây
                                                                                    setTimeout(function () {
                                                                                        location.reload();
                                                                                    }, 1000);
                                                                                },
                                                                                error: function (xhr, status, error) {
                                                                                    iziToast.error({
                                                                                        title: 'Lỗi',
                                                                                        message: 'Có lỗi xảy ra khi cập nhật trạng thái',
                                                                                        position: 'topRight'
                                                                                    });
                                                                                }
                                                                            });
                                                                        });

                                                                        // Xử lý hiển thị modal chi tiết
                                                                        $('.view-detail').click(function () {
                                                                            var requestId = $(this).data('request-id');
                                                                            var clubName = $(this).data('club-name');
                                                                            var requester = $(this).data('requester');
                                                                            var newPresident = $(this).data('new-president');
                                                                            var reasonType = $(this).data('reason-type');
                                                                            var status = $(this).data('status');
                                                                            var description = $(this).data('description');

                                                                            // Định dạng trạng thái
                                                                            var statusText = '';
                                                                            var statusClass = '';
                                                                            switch (status) {
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
                                                                                    statusText = status;
                                                                                    statusClass = 'badge badge-secondary';
                                                                            }

                                                                            // Điền dữ liệu vào modal
                                                                            $('#detail-request-id').text(requestId);
                                                                            $('#detail-club-name').text(clubName);
                                                                            $('#detail-requester').text(requester);
                                                                            $('#detail-new-president').text(newPresident);
                                                                            $('#detail-reason-type').text(reasonType);
                                                                            $('#detail-status').html('<span class="' + statusClass + '">' + statusText + '</span>');
                                                                            $('#detail-description').html(description || '<em>Không có mô tả</em>');
                                                                        });
                                                                    });
        </script>
    </body>
</html>