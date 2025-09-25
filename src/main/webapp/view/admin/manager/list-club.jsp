<%-- Document : view-clubs Created on : Sep 24, 2025, 7:58:37 PM Author : Dell --%>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
      <!doctype html>
      <html class="no-js" lang="">


      <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/class-routine.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:21 GMT -->

      <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>AKKHOR | Class Routine</title>
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
              <!-- Class Routine Area Start Here -->
              <div class="row">
                <div class="col-4-xxxl col-12">
                  <div class="card height-auto">
                    <div class="card-body">
                      <div class="heading-layout1">
                        <div class="item-title">
                          <h3>Add Club</h3>
                        </div>
                        <div class="dropdown">
                          <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                            aria-expanded="false">...</a>

                          <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                            <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                            <a class="dropdown-item" href="#"><i
                                class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                          </div>
                        </div>
                      </div>
                      <form class="new-added-form" action="${pageContext.request.contextPath}/club?action=add-club"
                        method="post">
                        <div class="row">

                          <div class="col-12-xxxl col-lg-6 col-12 form-group">
                            <label>Tên CLB *</label>
                            <input type="text" placeholder="" class="form-control">
                          </div>

                          <div class="col-12-xxxl col-lg-6 col-12 form-group">
                            <label>Trưởng CLB *</label>
                            <input type="text" placeholder="" class="form-control">
                          </div>

                          <div class="col-12-xxxl col-lg-6 col-12 form-group">
                            <label>Loại *</label>
                            <select class="select2">
                              <option value="">Please Select</option>
                              <option value="1">Bangla</option>
                              <option value="2">English</option>
                              <option value="3">Mathematics</option>
                              <option value="3">Economics</option>
                              <option value="3">Chemistry</option>
                            </select>
                          </div>

                          <div class="col-12-xxxl col-lg-6 col-12 form-group">
                            <label>Mô tả ngắn *</label>
                            <input type="text" placeholder="Mô tả ngắn" class="form-control">
                          </div>

                          <div class="col-12 form-group mg-t-8">
                            <button type="submit"
                              class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Add</button>
                            <button type="reset" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Reset</button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                <div class="col-8-xxxl col-12">
                  <div class="card height-auto">
                    <div class="card-body">
                      <div class="heading-layout1">
                        <div class="item-title">
                          <h3>List Club</h3>
                        </div>
                      </div>
                      <!--Form search-->
                      <form class="mg-b-20">
                        <div class="row gutters-8">
                          <div class="col-lg-4 col-12 form-group">
                            <input type="text" placeholder="Search by Day ..." class="form-control">
                          </div>
                          <div class="col-lg-3 col-12 form-group">
                            <input type="text" placeholder="Search by Class ..." class="form-control">
                          </div>
                          <div class="col-lg-3 col-12 form-group">
                            <input type="text" placeholder="Search by Section ..." class="form-control">
                          </div>
                          <div class="col-lg-2 col-12 form-group">
                            <button type="submit" class="fw-btn-fill btn-gradient-yellow">SEARCH</button>
                          </div>
                        </div>
                      </form>
                      <!--Form search-->
                      <div class="table-responsive">
                        <table class="table display data-table text-nowrap">
                          <thead>
                            <tr>
                              <th>
                                Tên CLB
                              </th>
                              <th>Trưởng CLB</th>
                              <th>Ngày tạo</th>
                              <th>Ngày cập nhật</th>
                              <th>Trạng thái</th>
                              <th>Danh mục CLB</th>
                              <th></th>
                            </tr>

                          </thead>
                          <tbody>
                            <c:forEach var="item" items="${listClub}">
                              <tr>
                                <td>
                                  <span style="color: #FFA601; font-weight: 700">${item.name}</span>
                                </td>
                                <td>${item.president_id}</td>
                                <td>${item.created_at}</td>
                                <td>${item.updated_at}</td>
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
                                <td>CLB Thể Thao</td>
                                <td>
                                  <div class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                      <span class="flaticon-more-button-of-three-dots"></span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                      <a class="dropdown-item" href="#"><i
                                          class="fas fa-times text-orange-red"></i>Close</a>
                                      <a class="dropdown-item" href="#"><i
                                          class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                                      <a class="dropdown-item" href="#"><i
                                          class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
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
              <!-- Class Routine Area End Here -->
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
        <!-- Select 2 Js -->
        <script src="${pageContext.request.contextPath}/admin/js/select2.min.js"></script>
        <!-- Scroll Up Js -->
        <script src="${pageContext.request.contextPath}/admin/js/jquery.scrollUp.min.js"></script>
        <!-- Data Table Js -->
        <script src="${pageContext.request.contextPath}/admin/js/jquery.dataTables.min.js"></script>
        <!-- Custom Js -->
        <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>

      </body>


      <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/class-routine.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:21 GMT -->

      </html>