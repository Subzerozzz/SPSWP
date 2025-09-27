<%-- Document : header.jsp Created on : Sep 24, 2025, 4:12:14 PM Author : Dell --%>

  <%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
      <!--Link icon-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" />
    </head>
    <style>
      .dropdown {
        position: relative;
        display: inline-block;
        height: 50px;
        padding-top: 15px
      }

      .dropdown-menu {
        display: none;
        position: absolute;
        width: 100%;
        top: 40px;
        right: 30px;
        background: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        z-index: 999;
      }


      .dropdown-menu a {
        display: block;
        width: 100%;
        padding: 10px 15px;
        color: #000000;
        text-decoration: none;
        color: black
      }

      .dropdown-menu a:hover {
        background: #F77204;
        width: 100%;
        color: white;
        font-weight: 600;
      }

      .dropdown:hover .dropdown-menu {
        display: block;
      }
    </style>

    <body>
      <header class="header-area style-1">
        <div class="main-menu">
          <div class="mobile-logo-area d-lg-none d-flex justify-content-between align-items-center">
            <div class="mobile-logo-wrap ">
              <a href="index.html"><img alt="image"
                  src="${pageContext.request.contextPath}/guest/assets/images/logoFPT.svghe"></a>

            </div>
            <div class="menu-close-btn">
              <i class="bi bi-x-lg"></i>
            </div>
          </div>
          <ul class="menu-list">
            <li class="menu-item-has-children">
              <a href="#" class="drop-down">Home</a><i class='bx bx-plus dropdown-icon'></i>
              <ul class="submenu">
                <li><a href="index.html">Home 01</a></li>
                <li><a href="index2.html">Home 02</a></li>
                <li><a href="index3.html">Home 03</a></li>
                <li><a href="index4.html">Home 04</a></li>
                <li><a href="index5.html">Home 05</a></li>
              </ul>
            </li>
            <li>
              <a href="about.html">About Us</a>
            </li>
            <li class="menu-item-has-children">
              <a href="#">Suites</a><i class='bx bx-plus dropdown-icon'></i>
              <ul class="submenu">
                <li><a href="room-suits1-2.html">Room & Suits 01</a></li>
                <li><a href="room-suits2.html">Room & Suits 02</a></li>
                <li><a href="room-suits-details.html">Room & Suits Details</a></li>
              </ul>
            </li>
            <li class="menu-item-has-children">
              <a href="#" class="drop-down">Pages</a><i class='bx bx-plus dropdown-icon'></i>
              <ul class="submenu">
                <li><a href="hotel-facilities.html">Hotel Facilities</a></li>
                <li><a href="gallery.html">Gallery</a></li>
                <li><a href="faq.html">Faq</a></li>
                <li><a href="404.html">Error</a></li>
              </ul>
            </li>
            <li class="menu-item-has-children">
              <a href="#">Blog</a><i class='bx bx-plus dropdown-icon'></i>
              <ul class="submenu">
                <li><a href="blog.html">Blog Grid</a></li>
                <li><a href="blog-sidebar.html">Blog Sidebar</a></li>
                <li><a href="blog-standard.html">Blog Standard</a></li>
                <li><a href="blog-details.html">Blog Details</a></li>
              </ul>
            </li>
            <li><a href="contact.html">Contact</a></li>
          </ul>
          <!-- mobile-search-area -->
          <div class="d-lg-none d-block">
            <form class="mobile-menu-form">
              <div class="club pt-30">
                <div class="club-info">
                  <span>CLB của bạn</span>
                  <h6>
                    <c:forEach items="${listClub}" var="club">
                      <c:if test="${club.id == account_club.club_id}">
                        <span>${club.name}</span>
                      </c:if>
                    </c:forEach>
                  </h6>
                </div>
              </div>
              <div class="email pt-20 d-flex align-items-center">
                <div class="email-icon">
                  <svg width="26" height="26" viewBox="0 0 26 26" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0_461_205)">
                      <path
                        d="M23.5117 3.30075H2.38674C1.04261 3.30075 -0.0507812 4.39414 -0.0507812 5.73827V20.3633C-0.0507812 21.7074 1.04261 22.8008 2.38674 22.8008H23.5117C24.8558 22.8008 25.9492 21.7074 25.9492 20.3633V5.73827C25.9492 4.39414 24.8558 3.30075 23.5117 3.30075ZM23.5117 4.92574C23.6221 4.92574 23.7271 4.94865 23.8231 4.98865L12.9492 14.4131L2.07526 4.98865C2.17127 4.9487 2.27629 4.92574 2.38668 4.92574H23.5117ZM23.5117 21.1757H2.38674C1.93844 21.1757 1.57421 20.8116 1.57421 20.3632V6.70547L12.4168 16.1024C12.57 16.2349 12.7596 16.3008 12.9492 16.3008C13.1388 16.3008 13.3285 16.2349 13.4816 16.1024L24.3242 6.70547V20.3633C24.3242 20.8116 23.96 21.1757 23.5117 21.1757Z" />
                    </g>
                  </svg>
                </div>
                <div class="email-info">
                  <span>Email Now</span>
                  <h6><a
                      href="https://demo.egenslab.com/cdn-cgi/l/email-protection#7f1a071e120f131a3f18121e1613511c1012"><span
                        class="__cf_email__"
                        data-cfemail="debba6bfb3aeb2bb9eb9b3bfb7b2f0bdb1b3">[email&#160;protected]</span></a>
                  </h6>
                </div>
              </div>
            </form>

          </div>
        </div>
        <div class="header-logo">
          <div class="logo-inner">
            <a href="index.html"><img alt="image"
                src="${pageContext.request.contextPath}/guest/assets/images/header-logo22.svg"></a>
          </div>
        </div>
        <div class="nav-right d-flex align-items-center">
          <div class="hotline d-xxl-flex d-none">
            <div class="hotline-info">
                <span style="font-weight: 600; font-size: 15px">CLB của bạn:</span>
              <h6> 
                <c:forEach items="${listClub}" var="club">
                    <c:if test="${club.id == account_club.club_id}">
                        <a href="#">
                            <span style='font-size: 17px; color: #808080; font-style: italic'>${club.name}</span>
                        </a>
                    </c:if>
                </c:forEach>
              </h6>
            </div>
          </div>
          <div class="header-btn">
            <!-- Nếu chưa đăng nhập thì hiển thị -->
            <a class="btn--primary eg-btn" href="${pageContext.request.contextPath}/view/guest/authen/login.jsp"
              style="${empty sessionScope.account ? '' : 'display:none'}">
              Đăng nhập
            </a>

            <!-- Nếu đã đăng nhập thì hiển thị -->
            <div class="dropdown" style="${not empty sessionScope.account ? '' : 'display:none;'}">
              <div style="width: 80px">
                <i class="fa-regular fa-user" style="font-size: 20px;"></i>
              </div>

              <div class="dropdown-menu">
                <a style="color: black" href="${pageContext.request.contextPath}/account">Hồ sơ</a>
                <a style="color: black" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
              </div>
            </div>
          </div>

          <div class="mobile-menu-btn d-lg-none d-block">
            <i class='bx bx-menu'></i>
          </div>
        </div>
      </header>

      <script>
        const dropdown = document.getElementById("userDropdown");
        let hideTimeout;

        dropdown.addEventListener("mouseenter", () => {
          clearTimeout(hideTimeout);
          dropdown.classList.add("show");
        });

        dropdown.addEventListener("mouseleave", () => {
          hideTimeout = setTimeout(() => {
            dropdown.classList.remove("show");
          }, 3000); // 3 giây
        });
      </script>
    </body>


    </html>