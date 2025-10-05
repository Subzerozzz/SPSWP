<%-- Document : view-clubs Created on : Sep 24, 2025, 7:58:37 PM Author : Dell --%>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
          <!--IzizToast-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css">
          <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
        </head>

        <style>
          .pagination {
            text-align: end;
          }

          .pagination ul {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 20px;
            gap: 10px;
          }

          .pagination li a {
            border: 1px solid #ccc;
            padding: 5px 10px;
            border-radius: 5px;
            color: black;
          }

          .pagination li a:hover {
            background-color: #FFA701;
            color: white;
            font-weight: 600;
          }

          .pagination li.active a {
            background-color: #FFA701;
            color: white;
            font-weight: 600;
          }
        </style>

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
                              <a class="dropdown-item" href="#"><i
                                  class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
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
                              <input type="text" placeholder="CLB Name" class="form-control" name="name">
                            </div>

                            <div class="col-12-xxxl col-lg-6 col-12 form-group">
                              <label>Trưởng CLB *</label>
                              <input type="text" placeholder="President" class="form-control" name="presidentId">
                            </div>

                            <div class="col-12-xxxl col-lg-6 col-12 form-group">
                              <label>Loại *</label>
                              <select class="select2" name="categoryId">
                                <option value="">Please Select</option>
                                <c:forEach var="item" items="${listCategoryClub}">
                                  <option value="${item.id}">${item.name}</option>
                                </c:forEach>
                              </select>
                            </div>

                            <div class="col-12-xxxl col-lg-6 col-12 form-group">
                              <label>Mô tả ngắn *</label>
                              <input type="text" placeholder="Description" class="form-control" name="description">
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
                        <form id="search-club" class="mg-b-20" method="post"
                          action="${pageContext.request.contextPath}/club?action=filterChanning">
                          <div class="row gutters-8">

                            <input type="hidden" name="currentPage" value="${not empty currentPage ? 1 : currentPage}">

                            <div class="col-lg-4 col-12 form-group">
                              <input type="text" placeholder="Search by Name ..." class="form-control" name="name"
                                value="${not empty name ? name : ''}">
                            </div>

                            <div class="col-lg-3 col-12 form-group">
                              <select class="select2" name="status">
                                <option value="">Select by Status</option>
                                <option value="active" ${status=='active' ? 'selected' : '' }>Active</option>
                                <option value="banned" ${status=='banned' ? 'selected' : '' }>Banned</option>
                              </select>
                            </div>

                            <div class="col-lg-3 col-12 form-group">
                              <select class="select2" name="categoryId">
                                <option value="">Select category</option>
                                <c:forEach var="item" items="${listCategoryClub}">
                                  <option value="${item.id}" ${categoryId==item.id ? 'selected' : '' }>${item.name}
                                  </option>
                                </c:forEach>
                              </select>
                            </div>

                            <div class="col-lg-2 col-12 form-group">
                              <button type="submit" class="fw-btn-fill btn-gradient-yellow">SEARCH</button>
                            </div>
                          </div>
                        </form>
                        <!--Form search-->
                        <div class="table-responsive">
                          <!--Table-->
                          <table class="table display text-nowrap">
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
                                  <td>
                                    <c:forEach var="account" items="${listAccount}">
                                      <c:if test="${account.id == item.president_id}">
                                        <span style="color: #4B2A1F; font-weight: 700">${account.fullname}</span>
                                      </c:if>
                                    </c:forEach>
                                  </td>
                                  <td>${item.created_at}</td>
                                  <td>${item.updated_at}</td>
                                  <td>
                                    <c:choose>
                                      <c:when test="${item.status == 'active'}">
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
                                    <c:forEach var="category" items="${listCategoryClub}">
                                      <c:if test="${category.id == item.category_id}">
                                        <span style="color: white;
                                                padding: 5px 10px;
                                                background-color: #0293DE;
                                                font-weight: 500;
                                                border-radius: 10px;
                                                ">${category.name}</span>
                                      </c:if>
                                    </c:forEach>
                                  </td>
                                  <td>
                                    <div class="dropdown">
                                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <span class="flaticon-more-button-of-three-dots"></span>
                                      </a>
                                      <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item"
                                          href="${pageContext.request.contextPath}/club?action=detail-club&id=${item.id}">
                                          <i class="fas fa-eye text-orange-peel" style="margin-right:10px"></i>
                                          View Detail
                                        </a>
                                        <a class="dropdown-item" href="javascript:void(0);"
                                          onclick="confirmDelete(${item.id});">
                                          <i class="fas fa-times text-orange-red" style="margin-right: 10px"></i>
                                          Delete
                                        </a>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                              </c:forEach>

                            </tbody>
                          </table>
                          <!--End Table-->

                          <!--Pagination-->
                          <div class="pagination">
                            <ul class="wg-pagination">
                              <li>
                                <a href="#" onclick=handleFormSearch(1)>
                                  <i class="fas fa-angle-left"></i>
                                </a>
                              </li>
                              <c:choose>
                                <c:when test="${currentPage <= totalPage - 2}">
                                  <c:if test="${currentPage > 1}">
                                    <li class="">
                                      <a href="#" onclick="handleFormSearch(${currentPage- 1})">${currentPage- 1}</a>
                                    </li>
                                  </c:if>
                                  <li class="active">
                                    <a href="#" onclick="handleFormSearch(${currentPage})">${currentPage}</a>
                                  </li>

                                  <li class="">
                                    <a href="#" onclick="handleFormSearch(${currentPage+ 1})">${currentPage+ 1}</a>
                                  </li>

                                  <c:if test="${currentPage < totalPage - 2}">
                                    <li>
                                      <span>...</span>
                                    </li>
                                  </c:if>

                                  <li class="">
                                    <a href="#" onclick="handleFormSearch(${totalPage})">${totalPage}</a>
                                  </li>
                                </c:when>

                                <c:otherwise>
                                  <c:forEach begin="${totalPage-2 <= 0 ? 1 : totalPage - 2}" end="${totalPage}" var="i">
                                    <li class="${currentPage == i ? 'active' : ''}">
                                      <a href="#" onclick="handleFormSearch(${i})">${i}</a>
                                    </li>
                                  </c:forEach>
                                </c:otherwise>
                              </c:choose>

                              <li>
                                <a href="#" onclick="handleFormSearch(${totalPage})"><i
                                    class="fas fa-angle-right"></i></a>
                              </li>
                            </ul>
                          </div>
                          <!--End Pagination-->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Class Routine Area End Here -->
                <!--Footer-->
                <jsp:include page="../common/footer.jsp"></jsp:include>
                <!--Footer-->

                <!-- Modal Xác Nhận Xóa -->
                <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog"
                  aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="deleteConfirmModalLabel">Xác nhận xóa câu lạc bộ</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <p>Bạn có chắc chắn muốn xóa câu lạc bộ này?</p>
                        <form id="deleteClubForm" action="${pageContext.request.contextPath}/club?action=delete-club"
                          method="post">
                          <input type="hidden" id="deleteClubId" name="delete-id" value="">
                        </form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-danger"
                          onclick="document.getElementById('deleteClubForm').submit();">Xóa</button>
                      </div>
                    </div>
                  </div>
                </div>
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

          <!--Thông báo lỗi khi add clb lỗi-->
          <c:if test="${not empty errors}">
            <script>
              document.addEventListener("DOMContentLoaded", () => {
                <c:forEach var="entry" items="${errors}">
                  iziToast.error({
                    title: "Lỗi",
                  message: "<c:out value='${entry.value}' />",
                  position: 'topRight',
                  timeout: 5000
                        });
                </c:forEach>
              });
            </script>
          </c:if>

          <!--Thông báo add club khi success-->
          <c:if test="${addClubSucess == true}">
            <script>
              document.addEventListener("DOMContentLoaded", () => {
                iziToast.success({
                  title: "Lỗi",
                  message: "${message}",
                  position: 'topRight',
                  timeout: 5000
                });
              });
            </script>
            <% session.removeAttribute("addClubSucess"); session.removeAttribute("message"); %>
          </c:if>

          <!-- Thông báo xóa club thành công  -->
          <c:if test="${deleteClubSucess == true}">
            <script>
              document.addEventListener("DOMContentLoaded", () => {
                iziToast.success({
                  title: "Thành công",
                  message: "${message}",
                  position: 'topRight',
                  timeout: 5000
                });
              });
            </script>
            <% session.removeAttribute("deleteClubSucess"); session.removeAttribute("message"); %>
          </c:if>

          <!--Thông báo xóa club that bai-->
          <c:if test="${deleteClubSucess == false}">
            <script>
              document.addEventListener("DOMContentLoaded", () => {
                iziToast.error({
                  title: "Thất bại",
                  message: "${message}",
                  position: 'topRight',
                  timeout: 5000
                })
              })
            </script>
            <% session.removeAttribute("deleteClubSucess"); session.removeAttribute("message"); %>
          </c:if>

          <!-- Script cho form search-club -->
          <script>
            const handleFormSearch = (currentPage) => {
              const formSearch = document.getElementById("search-club");
              const inputCurrentPage = formSearch.querySelector('input[name="currentPage"]');
              inputCurrentPage.value = currentPage;
              formSearch.submit();
              return false; // Ngăn chặn việc gửi form mặc định

            }
          </script>

          <!--Hiển thị modal delete-->
          <script>
            function confirmDelete(accountId) {
              document.getElementById('deleteClubId').value = accountId;
              $('#deleteConfirmModal').modal('show');
            }
          </script>

        </body>


        <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/class-routine.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:21 GMT -->

        </html>