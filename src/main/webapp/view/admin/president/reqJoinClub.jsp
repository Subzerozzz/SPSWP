<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Quản lý đơn xin vào CLB</title>
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
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
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
                                <h3>Đơn xin vào CLB</h3>
                            </div>
                        </div>

                        <!-- Hiển thị thông báo -->
                        <c:if test="${not empty success}">
                            <div class="alert alert-success">
                                <strong>Thành công!</strong> Đã cập nhật trạng thái đơn xin.
                            </div>
                        </c:if>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">
                                <strong>Lỗi!</strong> ${error}
                            </div>
                        </c:if>

                        <div class="table-responsive">
                            <table class="table display data-table text-nowrap">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Họ và tên</th>
                                        <th>Mã sinh viên</th>
                                        <th>Email</th>
                                        <th>Ngày gửi</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="req" items="${listReq}" varStatus="status">
                                        <c:set var="account" value="${accountMap[req.accountId]}"/>
                                        <c:if test="${not empty account}">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${account.fullname}</td>
                                                <td>${account.student_id}</td>
                                                <td>${account.email}</td>
                                                <td>
                                                    <fmt:formatDate value="${req.created_at}" pattern="dd/MM/yyyy HH:mm" />
                                                </td>
                                                <td>
                                                    <div class="dropdown">
                                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                            <span class="flaticon-more-button-of-three-dots"></span>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item view-detail" href="#"
                                                               data-toggle="modal" data-target="#requestDetailModal"
                                                               data-requestid="${req.id}"
                                                               data-fullname="${account.fullname}"
                                                               data-studentid="${account.student_id}"
                                                               data-email="${account.email}"
                                                               data-phone="${account.phone}"
                                                               data-gender="${account.gender}"
                                                               data-bod="<fmt:formatDate value='${account.bod}' pattern='dd/MM/yyyy' />"
                                                               data-address="${account.address}"
                                                               data-self="${req.self}"
                                                               data-reason="${req.reason}">
                                                                <i class="fas fa-eye text-dark-pastel-green"></i>Xem chi tiết
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:if>
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

    <!-- Modal Chi Tiết Đơn -->
    <div class="modal fade" id="requestDetailModal" tabindex="-1" role="dialog" aria-labelledby="requestDetailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="requestDetailModalLabel">Chi tiết đơn xin vào CLB</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h6>Thông tin sinh viên</h6>
                            <table class="table table-bordered">
                                <tr>
                                    <td><strong>Họ và tên:</strong></td>
                                    <td id="modalFullname"></td>
                                </tr>
                                <tr>
                                    <td><strong>Mã sinh viên:</strong></td>
                                    <td id="modalStudentId"></td>
                                </tr>
                                <tr>
                                    <td><strong>Email:</strong></td>
                                    <td id="modalEmail"></td>
                                </tr>
                                <tr>
                                    <td><strong>Số điện thoại:</strong></td>
                                    <td id="modalPhone"></td>
                                </tr>
                                <tr>
                                    <td><strong>Giới tính:</strong></td>
                                    <td id="modalGender"></td>
                                </tr>
                                <tr>
                                    <td><strong>Ngày sinh:</strong></td>
                                    <td id="modalBod"></td>
                                </tr>
                                <tr>
                                    <td><strong>Địa chỉ:</strong></td>
                                    <td id="modalAddress"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <h6>Thông tin đơn xin</h6>
                            <div class="form-group">
                                <label><strong>Giới thiệu bản thân:</strong></label>
                                <div class="border p-2 bg-light" id="modalSelf" style="min-height: 100px; border-radius: 5px;"></div>
                            </div>
                            <div class="form-group">
                                <label><strong>Lý do muốn tham gia:</strong></label>
                                <div class="border p-2 bg-light" id="modalReason" style="min-height: 100px; border-radius: 5px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <!-- Form từ chối -->
                    <form id="rejectForm" action="${pageContext.request.contextPath}/joinClub" method="POST" style="display: inline;">
                        <input type="hidden" name="action" value="reject">
                        <input type="hidden" name="requestId" id="rejectRequestId">
                        <button type="submit" class="btn btn-danger">Từ chối</button>
                    </form>
                    <!-- Form duyệt -->
                    <form id="approveForm" action="${pageContext.request.contextPath}/joinClub" method="POST" style="display: inline;">
                        <input type="hidden" name="action" value="approve">
                        <input type="hidden" name="requestId" id="approveRequestId">
                        <button type="submit" class="btn btn-success">Duyệt</button>
                    </form>
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
            // Biến lưu requestId hiện tại
            var currentRequestId = null;

            // Xử lý khi click vào xem chi tiết
            $('.view-detail').on('click', function() {
                var requestId = $(this).data('requestid');
                var fullname = $(this).data('fullname');
                var studentId = $(this).data('studentid');
                var email = $(this).data('email');
                var phone = $(this).data('phone');
                var gender = $(this).data('gender');
                var bod = $(this).data('bod');
                var address = $(this).data('address');
                var self = $(this).data('self');
                var reason = $(this).data('reason');

                console.log("Request ID:", requestId); // Debug

                // Lưu requestId hiện tại
                currentRequestId = requestId;

                // Điền dữ liệu vào modal
                $('#modalFullname').text(fullname || 'Chưa có thông tin');
                $('#modalStudentId').text(studentId || 'Chưa có thông tin');
                $('#modalEmail').text(email || 'Chưa có thông tin');
                $('#modalPhone').text(phone || 'Chưa có thông tin');
                $('#modalGender').text(gender === 'male' ? 'Nam' : (gender === 'female' ? 'Nữ' : 'Chưa có thông tin'));
                $('#modalBod').text(bod || 'Chưa có thông tin');
                $('#modalAddress').text(address || 'Chưa có thông tin');
                $('#modalSelf').text(self || 'Chưa có thông tin');
                $('#modalReason').text(reason || 'Chưa có thông tin');

                // Set request ID cho form actions
                $('#rejectRequestId').val(requestId);
                $('#approveRequestId').val(requestId);

                // Debug: kiểm tra giá trị đã được set chưa
                console.log("Reject input value:", $('#rejectRequestId').val());
                console.log("Approve input value:", $('#approveRequestId').val());
            });

            // Xử lý khi submit form (để chắc chắn)
            $('#rejectForm').on('submit', function(e) {
                if (!currentRequestId) {
                    e.preventDefault();
                    alert('Lỗi: Không tìm thấy ID đơn xin');
                    return false;
                }
                $('#rejectRequestId').val(currentRequestId);
                console.log("Submitting reject form with requestId:", currentRequestId);
            });

            $('#approveForm').on('submit', function(e) {
                if (!currentRequestId) {
                    e.preventDefault();
                    alert('Lỗi: Không tìm thấy ID đơn xin');
                    return false;
                }
                $('#approveRequestId').val(currentRequestId);
                console.log("Submitting approve form with requestId:", currentRequestId);
            });

            // Reset khi modal đóng
            $('#requestDetailModal').on('hidden.bs.modal', function () {
                currentRequestId = null;
            });
        });

        <c:if test="${not empty message}">
                    <script>
                        document.addEventListener("DOMContentLoaded", () => {
                        <c:choose>
                            <c:when test="${success == true}">
                            iziToast.success({
                                title: "Thành công",
                                message: "${message}",
                                position: 'topRight',
                                timeout: 5000
                            });
                            </c:when>
                            <c:when test="${success == false}">
                            iziToast.error({
                                title: "Lỗi",
                                message: "${message}",
                                position: 'topRight',
                                timeout: 5000
                            });
                            </c:when>
                            <c:otherwise>
                            iziToast.info({
                                title: "Thông báo",
                                message: "${message}",
                                position: 'topRight',
                                timeout: 5000
                            });
                            </c:otherwise>
                        </c:choose>
                        });
                    </script>
                    <%
                        session.removeAttribute("success");
                        session.removeAttribute("message");
                    %>
                </c:if>

                <!-- Thông báo đăng ký thành công -->
                <c:if test="${joinSuccess == true}">
                    <script>
                        document.addEventListener("DOMContentLoaded", () => {
                            iziToast.success({
                                title: "Thêm thành viên mới thành công!",
                                message: "${message}",
                                position: 'topRight',
                                timeout: 5000
                            });
                        });
                    </script>
                    <%
                        session.removeAttribute("joinSuccess");
                        session.removeAttribute("message");
                    %>
                </c:if>

                    <c:if test="${joinSuccess == false}">
                <script>
                    document.addEventListener("DOMContentLoaded", () => {
                        iziToast.error({
                            title: "Thêm thành viên mới thất bại !",
                            message: "${message}",
                            position: 'topRight',
                            timeout: 5000
                        });
                    });
                </script>
                <%
                    session.removeAttribute("joinSuccess");
                    session.removeAttribute("message");
                %>
            </c:if>
    </script>

</body>
</html>