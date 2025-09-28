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
                      <h3 class="text-dark-medium font-medium">${account.fullname}</h3>
                    </div>
                    <!--Header Information-->

                    <!--Information-->
                    <div class="info-table table-responsive">
                      <table class="table text-nowrap">
                        <tbody>
                          <tr>
                            <td>Họ và tên:</td>
                            <td class="font-medium text-dark-medium">${account.fullname}</td>
                          </tr>
                          <tr>
                            <td>Giới tính:</td>
                            <td class="font-medium text-dark-medium">
                              <c:choose>
                                <c:when test="${account.gender == 'male'}">
                                  Nam
                                </c:when>
                                <c:otherwise>
                                  Nữ
                                </c:otherwise>
                              </c:choose>
                            </td>
                          </tr>
                          <tr>
                            <td>Chức vụ trong hệ thống:</td>
                            <td class="font-medium text-dark-medium">
                              <c:choose>
                                <c:when test="${listAccountClubById.size() == 1}">
                                  <c:choose>
                                    <c:when test="${listAccountClubById.get(0).role != 'user'}">
                                      <span>${listAccountClubById.get(0).role}</span>
                                    </c:when>
                                    <c:otherwise>
                                      <span>Tài khoản này chưa tham gia câu lạc bộ.</span>
                                    </c:otherwise>
                                  </c:choose>
                                </c:when>
                                <c:otherwise>
                                  <c:forEach items="${listAccountClubById}" var="account_club">
                                    <c:forEach items="${listClub}" var="club">
                                      <c:if test="${account_club.club_id == club.id}">
                                        <div style="font-style: italic; color: #808080">
                                          <c:choose>
                                            <c:when test="${account_club.role == 'member'}">
                                              <span>Thành Viên</span>
                                            </c:when>
                                            <c:when test="${account_club.role == 'head'}">
                                              <span>Trưởng Ban</span>
                                            </c:when>
                                            <c:when test="${account_club.role == 'president'}">
                                              <span>Trưởng CLB</span>
                                            </c:when>
                                            <c:when test="${account_club.role == 'manager'}">
                                              <span>Quản Lý</span>
                                            </c:when>
                                            <c:otherwise>
                                              <span>Admin</span>
                                            </c:otherwise>
                                          </c:choose>
                                          - ${club.name}
                                        </div>

                                      </c:if>
                                    </c:forEach>
                                  </c:forEach>
                                </c:otherwise>
                              </c:choose>

                            </td>
                          </tr>
                          <tr>
                            <td>Email:</td>
                            <td class="font-medium text-dark-medium">${account.email}</td>
                          </tr>
                          <tr>
                            <td>Ngày sinh:</td>
                            <td class="font-medium text-dark-medium">${account.bod}</td>
                          </tr>
                          <tr>
                            <td>Địa chỉ:</td>
                            <td class="font-medium text-dark-medium">${account.address}</td>
                          </tr>
                          <tr>
                            <td>Trạng thái:</td>
                            <td class="font-medium text-dark-medium">
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
                          </tr>
                          <tr>
                            <td>Mã số sinh viên:</td>
                            <td class="font-medium text-dark-medium">${account.student_id}</td>
                          </tr>
                          <tr>
                            <td>Phone:</td>
                            <td class="font-medium text-dark-medium">${account.phone}</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <!--Infomation-->
                    <button data-toggle="modal" data-target="#updateModal"
                      style="color: white; background-color: #009DDC ; border: none; padding: 5px 10px; border-radius: 10px; cursor: pointer">
                      Update Status
                    </button>
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
                                    value="${account.fullname}" readonly>
                                </div>

                                <div class="col-md-6 form-group">
                                  <label for="email">Email:</label>
                                  <input type="email" class="form-control" id="email" name="email"
                                    value="${account.email}" readonly>
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-md-6 form-group">
                                  <label for="phone">Số điện thoại:</label>
                                  <input type="text" class="form-control" id="phone" name="phone"
                                    value="${account.phone}" readonly>
                                </div>

                                <div class="col-md-6 form-group">
                                  <label for="gender">Giới tính:</label>
                                  <select class="form-control" id="gender" name="gender" disabled>
                                    <option value="male" ${account.gender=='male' ? 'selected' : '' }>Nam</option>
                                    <option value="female" ${account.gender=='female' ? 'selected' : '' }>Nữ</option>
                                  </select>
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-md-6 form-group">
                                  <label for="bod">Ngày sinh:</label>
                                  <input type="date" class="form-control" id="bod" name="bod" value="${account.bod}"
                                    readonly>
                                </div>

                                <div class="col-md-6 form-group">
                                  <label for="club_id">CLB đã tham gia:</label>
                                  <select class="form-control" id="club_id" name="club_id"
                                    onchange="updateRoleOptions()">
                                    <option value="">Chọn CLB</option>
                                    <c:forEach items="${listClub}" var="club">
                                      <c:forEach items="${listAccountClubById}" var="account_club">
                                        <c:if test="${account_club.club_id == club.id}">
                                          <option value="${club.id}" data-account-club-id="${account_club.id}"
                                            data-role="${account_club.role}">${club.name}</option>
                                        </c:if>
                                      </c:forEach>
                                    </c:forEach>
                                  </select>
                                </div>

                              </div>

                              <div class="row">
                                <div class="col-md-6 form-group">
                                  <label for="student_id">Mã số sinh viên:</label>
                                  <input type="text" class="form-control" id="student_id" name="student_id"
                                    value="${account.student_id}" readonly>
                                </div>

                                <div class="col-md-6 form-group">
                                  <label for="status">Trạng thái:</label>
                                  <select class="form-control" id="status" name="status">
                                    <option value="active" ${account.status=='active' ? 'selected' : '' }>Active
                                    </option>
                                    <option value="banned" ${account.status=='banned' ? 'selected' : '' }>Banned
                                    </option>
                                  </select>
                                </div>
                              </div>

                              <div class="form-group">
                                <label for="address">Địa chỉ:</label>
                                <textarea class="form-control" id="address" name="address" rows="3"
                                  readonly="">${account.address}</textarea>
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

    <!--Thông báo update success-->
    <c:if test="${updateSuccess == true}">
      <script>
        document.addEventListener("DOMContentLoaded", () => {
          iziToast.success({
            title: "Thông báo",
            message: "${message}",
            position: 'topRight',
            timeout: 5000,
            backgroundColor: "#d4edda"
          });
        });
      </script>
      <% session.removeAttribute("updateSuccess"); session.removeAttribute("message"); %>
    </c:if>


    <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/teacher-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:19 GMT -->

    </html>