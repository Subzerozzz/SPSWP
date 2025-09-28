<%--
  Created by IntelliJ IDEA.
  User: vankh
  Date: 9/25/2025
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%-- Document : list-account Created on : Sep 22, 2025, 9:48:17 AM Author : Dell --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                                <th>ID</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Role</th>
                                <th>StudentID</th>
                                <th>Address</th>
                                <th>Date Of Birth</th>
                                <th>Phone</th>
                                <th>E-mail</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="account" items="${listAccount}">
                                <tr>
                                    <td>${account.id}</td>
                                    <td>${account.fullname}</td>
                                    <td>${account.gender}</td>
                                    <td>${account.role}</td>
                                    <td>${account.student_id}</td>
                                    <td>${account.address}</td>
                                    <td>${account.bod}</td>
                                    <td>${account.phone}</td>
                                    <td>${account.email}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${account.status == 'active'}">
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
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                <span class="flaticon-more-button-of-three-dots"></span>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/manager-account?action=account-detail&id=${account.id}"><i
                                                        class="fas fa-eye text-orange-peel"></i>View Detail</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/manager-account?action=account-update&id=${account.id}"><i
                                                        class="fas fa-cogs text-dark-pastel-green"></i>Update</a>
                                                <a class="dropdown-item" href="javascript:void(0);"
                                                   onclick="confirmDelete(${account.id});"><i
                                                        class="fas fa-times text-orange-red"></i>Delete</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- Modal Xác Nhận Xóa -->
                    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog"
                         aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="deleteConfirmModalLabel">Xác nhận xóa tài khoản</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có chắc chắn muốn xóa tài khoản này?</p>
                                    <form id="deleteAccountForm"
                                          action="${pageContext.request.contextPath}/manager-account?action=account-delete"
                                          method="post">
                                        <input type="hidden" id="deleteAccountId" name="id" value="">
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                    <button type="button" class="btn btn-danger"
                                            onclick="document.getElementById('deleteAccountForm').submit();">Xóa</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Student Table Area End Here -->

            <!--Footer-->
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
<!-- Data Table Js -->
<script src="${pageContext.request.contextPath}/admin/js/jquery.dataTables.min.js"></script>
<!-- Custom Js -->
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>

</body>

<!--Hiển thị modal delete-->
<script>
    function confirmDelete(accountId) {
        document.getElementById('deleteAccountId').value = accountId;
        $('#deleteConfirmModal').modal('show');
    }
</script>

<!--Thông báo delete success-->
<c:if test="${deleteSuccess == true}">
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            iziToast.success({
                title: "Thông báo",
                message: "${message}",
                position: 'topRight',
                timeout: 5000,
                backgroundColor:"#d4edda"
            });
        });
    </script>
    <%
        session.removeAttribute("deleteSuccess");
        session.removeAttribute("message");
    %>
</c:if>
<!--Thông báo add success-->
<c:if test="${addSuccess == true}">
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            iziToast.success({
                title: "Thông báo",
                message: "${message}",
                position: 'topRight',
                timeout: 5000,
            });
        });
    </script>
    <%
        session.removeAttribute("addSuccess");
        session.removeAttribute("message");
    %>
</c:if>
<!--Thông báo add failed-->
<c:if test="${addSuccess == false}">
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            iziToast.error({
                title: "Thông báo",
                message: "${message}",
                position: 'topRight',
                timeout: 5000,
            });
        });
    </script>
    <%
        session.removeAttribute("addSuccess");
        session.removeAttribute("message");
    %>
</c:if>

<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-student.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:13 GMT -->

</html>