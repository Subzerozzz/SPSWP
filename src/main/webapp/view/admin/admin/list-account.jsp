<%-- 
    Document   : list-account
    Created on : Sep 22, 2025, 9:48:17 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css"
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
              <div class="dropdown">
                <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">...</a>

                <div class="dropdown-menu dropdown-menu-right">
                  <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                  <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                  <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                </div>
              </div>
            </div>
            <form class="mg-b-20">
              <div class="row gutters-8">
                <div class="col-3-xxxl col-xl-3 col-lg-3 col-12 form-group">
                  <input type="text" placeholder="Search by Roll ..." class="form-control">
                </div>
                <div class="col-4-xxxl col-xl-4 col-lg-3 col-12 form-group">
                  <input type="text" placeholder="Search by Name ..." class="form-control">
                </div>
                <div class="col-4-xxxl col-xl-3 col-lg-3 col-12 form-group">
                  <input type="text" placeholder="Search by Class ..." class="form-control">
                </div>
                <div class="col-1-xxxl col-xl-2 col-lg-3 col-12 form-group">
                  <button type="submit" class="fw-btn-fill btn-gradient-yellow">SEARCH</button>
                </div>
              </div>
            </form>
            <div class="table-responsive">
              <table class="table display data-table text-nowrap">
                <thead>
                  <tr>
                    <th>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input checkAll">
                        <label class="form-check-label">Roll</label>
                      </div>
                    </th>
                    <th>Photo</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Class</th>
                    <th>Section</th>
                    <th>Parents</th>
                    <th>Address</th>
                    <th>Date Of Birth</th>
                    <th>Phone</th>
                    <th>E-mail</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0021</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student2.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0022</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student3.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0023</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student4.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0024</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student5.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0025</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student6.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0026</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student7.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0027</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student8.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0028</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student9.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0029</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student10.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0030</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student6.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0021</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student2.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0022</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student3.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0023</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student4.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0024</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student5.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0025</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student6.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0026</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student7.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0027</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student8.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0028</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student9.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0029</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student10.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0030</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student6.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0021</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student2.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0022</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student3.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0023</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student4.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0024</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student5.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0025</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student6.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0026</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student7.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0027</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student8.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0028</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student9.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0029</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student10.png" alt="student"></td>
                    <td>Mark Willy</td>
                    <td>Male</td>
                    <td>2</td>
                    <td>A</td>
                    <td>Jack Sparrow </td>
                    <td>TA-107 Newyork</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">#0030</label>
                      </div>
                    </td>
                    <td class="text-center"><img src="${pageContext.request.contextPath}/admin/img/figure/student6.png" alt="student"></td>
                    <td>Jessia Rose</td>
                    <td>Female</td>
                    <td>1</td>
                    <td>A</td>
                    <td>Maria Jamans</td>
                    <td>59 Australia, Sydney</td>
                    <td>02/05/2001</td>
                    <td>+ 123 9988568</td>
                    <td>kazifahim93@gmail.com</td>
                    <td>
                      <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <span class="flaticon-more-button-of-three-dots"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                          <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
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


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-student.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:13 GMT -->

</html>
