<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!doctype html>
    <html class="no-js" lang="">


    <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/add-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:19 GMT -->

    <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>AKKHOR | Add Teacher</title>
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
      <!-- Date Picker CSS -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/datepicker.min.css">
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
            <br></br>
            <!-- Add New Account Area Start Here -->
            <div class="card height-auto">
              <div class="card-body">
                <div class="heading-layout1" style='margin-bottom: 20px'>
                  <div class="item-title">
                    <h3>Change Password</h3>
                  </div>
                </div>
                <form class="new-added-form" method="post" action="${pageContext.request.contextPath}/change-password">
                  <div class="row" style="margin-bottom: 10px">
                    <div class="col-xl-3 col-lg-6 col-12 form-group">
                      <label>Old Password *</label>
                      <input type="password" placeholder="" class="form-control" name="old-password">
                    </div>
                  </div>

                  <div class="row" style="margin-bottom: 10px">
                    <div class="col-xl-3 col-lg-6 col-12 form-group">
                      <label>New Password *</label>
                      <input type="password" placeholder="" class="form-control" name="new-password">
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-xl-3 col-lg-6 col-12 form-group">
                      <label>Confirm New Password *</label>
                      <input type="password" placeholder="" class="form-control" name="confirm-password">
                    </div>
                  </div>

                  <br></br>
                  <div class="col-12 form-group mg-t-8">
                    <button type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Update</button>
                    <button type="reset" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Reset</button>
                  </div>
                </form>
              </div>
            </div>
            <!-- Add New Account Area End Here -->
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
      <!-- Date Picker Js -->
      <script src="${pageContext.request.contextPath}/admin/js/datepicker.min.js"></script>
      <!-- Smoothscroll Js -->
      <script src="${pageContext.request.contextPath}/admin/js/jquery.smoothscroll.min.html"></script>
      <!-- Scroll Up Js -->
      <script src="${pageContext.request.contextPath}/admin/js/jquery.scrollUp.min.js"></script>
      <!-- Custom Js -->
      <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>

      <c:if test="${error == true}">
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
        <% session.removeAttribute("error"); session.removeAttribute("message"); %>
      </c:if>

      <!-- Thông báo thay đổi mật khẩu thành công -->
      <c:if test="${changePass == true}">
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
            session.removeAttribute("changePass"); 
            session.removeAttribute("message"); 
          %>
      </c:if>
       
      <!--Thông báo thay đổi mk thất bại-->
      <c:if test="${changePass == false}">
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
            session.removeAttribute("changePass"); 
            session.removeAttribute("message"); 
          %>
      </c:if>
      
    </body>


    <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/add-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:19 GMT -->

    </html>