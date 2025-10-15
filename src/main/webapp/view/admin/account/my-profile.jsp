<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!doctype html>
  <html class="no-js" lang="">


  <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/teacher-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:18 GMT -->

  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AKKHOR | Teacher Details</title>
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
          <br></br>
          <!-- Student Table Area Start Here -->
          <div class="card height-auto">
            <div class="card-body">
              <div class="heading-layout1">
                <div class="item-title">
                  <h3>About Me</h3>
                </div>
              </div>
              <div class="single-info-details">
                <div class="item-img">
                  <img src="${pageContext.request.contextPath}/admin/img/figure/teacher.jpg" alt="teacher">
                </div>
                <div class="item-content">
                  <!--Header Infomation-->
                  <div class="header-inline item-header">
                    <h3 class="text-dark-medium font-medium">${sessionScope.account.fullname}</h3>
                  </div>
                  <!--Header Information-->

                  <!--Information-->
                  <div class="info-table table-responsive">
                    <table class="table text-nowrap">
                      <tbody>
                        <tr>
                          <td>ID:</td>
                          <td class="font-medium text-dark-medium">${sessionScope.account.id}</td>
                        </tr>

                        <tr>
                          <td>Họ và tên:</td>
                          <td class="font-medium text-dark-medium">${sessionScope.account.fullname}</td>
                        </tr>
                        <tr>
                          <td>Giới tính:</td>
                          <td class="font-medium text-dark-medium">${sessionScope.account.gender == 'male' ? "Nam" :
                            "Nữ"}</td>
                        </tr>
                        <tr>
                          <td>Chức vụ:</td>
                          <td class="font-medium text-dark-medium">${sessionScope.account_club.role}</td>
                        </tr>
                        <tr>
                          <td>Email:</td>
                          <td class="font-medium text-dark-medium">${sessionScope.account.email}</td>
                        </tr>
                        <tr>
                          <td>Ngày sinh:</td>
                          <td class="font-medium text-dark-medium">${sessionScope.account.bod}</td>
                        </tr>
                        <tr>
                          <td>Địa chỉ:</td>
                          <td class="font-medium text-dark-medium">${sessionScope.account.address}</td>
                        </tr>
                        <tr>
                          <td>Mã số sinh viên:</td>
                          <td class="font-medium text-dark-medium">${sessionScope.account.student_id}</td>
                        </tr>
                        <tr>
                          <td>Trạng thái:</td>
                          <td class="font-medium text-dark-medium">
                              <c:choose>
                                <c:when test="${sessionScope.account.status == 'active'}">
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
                          
                        </tr>
                        <tr>
                          <td>Thuộc CLB:</td>
                          <td class="font-medium text-dark-medium">House #10, Road #6, Australia</td>
                        </tr>
                        <tr>
                          <td>Phone:</td>
                          <td class="font-medium text-dark-medium">${sessionScope.account.phone}</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <!--Infomation-->

                  <!--Button update-->
                  <button data-toggle="modal" data-target="#updateModal"
                    style="color: white; background-color: #009DDC ; border: none; padding: 5px 10px; border-radius: 10px; cursor: pointer">
                    Update Information
                  </button>
                  <!--Button update-->

                  <!-- Modal Update  -->
                  <div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
                    aria-labelledby="updateModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="updateModalLabel">Cập nhật thông tin tài khoản</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <form action="${pageContext.request.contextPath}/manager-account?action=account-update"
                            method="post">
                            <input type="hidden" name="id" value="${account.id}">

                            <div class="row">
                              <div class="col-md-6 form-group">
                                <label for="fullname">Họ và tên:</label>
                                <input type="text" class="form-control" id="fullname" name="fullname"
                                  value="${account.fullname}">
                              </div>

                              <div class="col-md-6 form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email"
                                  value="${account.email}">
                              </div>
                            </div>

                            <div class="row">
                              <div class="col-md-6 form-group">
                                <label for="phone">Số điện thoại:</label>
                                <input type="text" class="form-control" id="phone" name="phone" value="${account.phone}"
                                >
                              </div>

                              <div class="col-md-6 form-group">
                                <label for="gender">Giới tính:</label>
                                <select class="form-control" id="gender" name="gender">
                                  <option value="male" ${account.gender=='male' ? 'selected' : '' }>Nam</option>
                                  <option value="female" ${account.gender=='female' ? 'selected' : '' }>Nữ</option>
                                </select>
                              </div>
                            </div>

                            <div class="row">
                              <div class="col-md-6 form-group">
                                <label for="bod">Ngày sinh:</label>
                                <input type="date" class="form-control" id="bod" name="bod" value="${account.bod}"
                                  >
                              </div>

                              <div class="col-md-6 form-group">
                                <label for="role">Chức vụ:</label>
                                <select class="form-control" id="role" name="role" disabled>
                                  <option value="Admin" ${account_club.role=='admin' ? 'selected' : '' }>Admin</option>
                                  <option value="Manager" ${account_club.role=='student' ? 'selected' : '' }>Mananger
                                  </option>
                                  <option value="President" ${account_club.role=='teacher' ? 'selected' : '' }>President
                                  </option>
                                  <option value="Head" ${account_club.role=='teacher' ? 'selected' : '' }>Head
                                  </option>
                                  <option value="Member" ${account_club.role=='teacher' ? 'selected' : '' }>Member
                                  </option>
                                </select>
                              </div>
                            </div>

                            <div class="row">
                              <div class="col-md-6 form-group">
                                <label for="student_id">Mã số sinh viên:</label>
                                <input type="text" class="form-control" id="student_id" name="student_id"
                                  value="${account.student_id}">
                              </div>

                              <div class="col-md-6 form-group">
                                <label for="status">Trạng thái:</label>
                                <select class="form-control" id="status" name="status" disabled>
                                  <option value="active" ${account.status=='active' ? 'selected' : '' }>Active
                                  </option>
                                  <option value="banned" ${account.status=='banned' ? 'selected' : '' }>Banned
                                  </option>
                                </select>
                              </div>
                            </div>

                            <div class="form-group">
                              <label for="address">Địa chỉ:</label>
                              <textarea class="form-control" id="address" name="address"
                                rows="3">${account.address}</textarea>
                            </div>

                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                              <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Student Table Area End Here -->
          <!--Footer-->
          <jsp:include page="../common/footer.jsp"></jsp:include>
          <!--Footer-->
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
    <!-- Custom Js -->
    <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>

  </body>


  <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/teacher-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:19 GMT -->

  </html>