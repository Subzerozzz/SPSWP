<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>AKKHOR | Đổi Trưởng CLB</title>
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
        <!-- Select 2 CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/select2.min.css">
        <!-- Data Table CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/jquery.dataTables.min.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">
        <!-- Modernize js -->
        <script src="${pageContext.request.contextPath}/admin/js/modernizr-3.6.0.min.js"></script>
        <!--IzizToast-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
    </head>
    <body>
        <div id="wrapper" class="wrapper bg-ash">
            <!-- Giữ nguyên header và sider như trang gốc -->
            <jsp:include page="../common/header.jsp" />
            <div class="dashboard-page-one">
                <jsp:include page="../common/sider.jsp" />

                <div class="dashboard-content-one">
                    <br />

                    <!-- Card chứa form đổi trưởng CLB -->
                    <div class="card height-auto">
                        <div class="card-body">
                            <div class="heading-layout1">
                                <div class="item-title">
                                    <h3>Đổi Trưởng Câu Lạc Bộ</h3>
                                </div>
                            </div>

                            <!-- Form đổi trưởng CLB -->
                            <form action="${pageContext.request.contextPath}/changePresident?action=changePresident" method="post">
                                <div class="row">
                                    <!-- Thông tin CLB -->
                                    <div class="col-12 form-group">
                                        <h4 class="text-primary mb-3">Thông tin Câu Lạc Bộ</h4>
                                    </div>

                                    <div class="col-md-6 form-group">
                                        <label>Tên Câu Lạc Bộ</label>
                                        <input type="text" class="form-control" value="${club.name}" readonly>
                                        <input type="hidden" name="clubId" value=${club.id}>
                                    </div>

                                    <div class="col-md-6 form-group">
                                        <label>Trưởng CLB Hiện Tại</label>
                                        <input type="text" class="form-control" value="${account.fullname}" readonly>
                                        <input type="hidden" name="accountId" value="${account.id}">
                                    </div>

                                    <!-- Thông tin trưởng CLB mới -->
                                    <div class="col-12 form-group mt-4">
                                        <h4 class="text-primary mb-3">Thông tin Trưởng CLB Mới</h4>
                                    </div>

                                    <div class="col-md-6 form-group">
                                        <label>Chọn Trưởng CLB Mới</label>
                                        <select name="preNew" id="newLeaderSelect" class="form-control" onchange="showRole(this.value)">
                                            <option value="">-- Chọn thành viên --</option>
                                            <c:forEach var="account" items="${listAccount}">
                                                <option value="${account.id}">${account.fullname} - ${account.student_id}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-6 form-group">
                                        <label>Vai trò hiện tại</label>
                                        <input type="text" id="currentRole" class="form-control" readonly>
                                    </div>

                                    <!-- Lý do đổi trưởng -->
                                    <div class="col-12 form-group">
                                        <label>Lý do đổi trưởng CLB</label>
                                        <select name="reason_type" class="form-control">
                                            <option value="">-- Chọn lý do --</option>
                                            <option value="graduation">Tốt nghiệp</option>
                                            <option value="transfer">Chuyển trường</option>
                                            <option value="personal">Lý do cá nhân</option>
                                            <option value="performance">Hiệu suất không tốt</option>
                                            <option value="election">Bầu cử mới</option>
                                            <option value="other">Lý do khác</option>
                                        </select>
                                    </div>

                                    <div class="col-12 form-group">
                                        <label>Mô tả chi tiết lý do</label>
                                        <textarea name="reason_description" rows="4" class="form-control" style="height:150px"
                                                  placeholder="Mô tả chi tiết lý do đổi trưởng CLB..."></textarea>
                                    </div>
                                    <!-- Xác nhận -->
                                    <div class="col-12 form-group mt-4">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="confirmation">
                                            <label class="form-check-label" for="confirmation">
                                                Tôi xác nhận thông tin trên là chính xác
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <c:if test="${not empty successReq}">
                                            <div class="alert alert-success">
                                                <ul>
                                                    <li><c:out value="${successReq}"/></li>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </div>

                                    <div class="col-12 form-group text-right mt-4">
                                        <button type="button" class="btn btn-secondary"
                                                style="width:140px; height:40px; margin: 10px 10px 0px 0px">Hủy bỏ</button>
                                        <button type="submit" class="btn btn-primary"
                                                style="width:140px; height:40px; margin: 10px 50px 0px 0px">Xác nhận</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JS cuối trang -->
        <script src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
    </body>
    <script>
                                            // Tạo map chứa role của từng account
                                            const roleMap = {
        <c:forEach var="account" items="${listAccount}">
            ${account.id}: "${accountRoles[account.id]}",
        </c:forEach>
                                            };

                                            function showRole(accountId) {
                                                const roleInput = document.getElementById('currentRole');
                                                if (accountId && roleMap[accountId]) {
                                                    roleInput.value = roleMap[accountId];
                                                } else {
                                                    roleInput.value = '';
                                                }
                                            }
    </script>
</html>