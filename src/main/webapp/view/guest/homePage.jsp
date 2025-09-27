
<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%--
Created by IntelliJ IDEA.
User: vankh
Date: 9/21/2025
Time: 3:49 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý CLB Đại học FPT</title>
        <link rel="icon" href="${pageContext.request.contextPath}/guest/assets/images/logoFPT3.png" type="image/gif" sizes="20x20">

        <!-- css file link -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/all.css">

        <!-- bootstrap 5 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/bootstrap.min.css">

        <!-- box-icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/boxicons.min.css">

        <!-- bootstrap icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/bootstrap-icons.css">

        <!-- jquery ui -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/jquery-ui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/jquery.fancybox.min.css">

        <!-- swiper-slide -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/swiper-bundle.min.css">

        <!-- slick-slide -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/slick-theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/slick.css">

        <!-- select 2 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/nice-select.css">

        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/magnific-popup.css">

        <!-- odometer css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/odometer.css">

        <!-- style css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/style.css">
    </head>

    <body>
        <!-- start preloader area -->
        <div class="egns-preloader">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-6">
                        <div class="circle-border">
                            <div class="moving-circle"></div>
                            <div class="moving-circle"></div>
                            <div class="moving-circle"></div>
                            <svg width="180px" height="150px" viewBox="0 0 187.3 93.7" preserveAspectRatio="xMidYMid meet"
                                 style="left: 50%; top: 50%; position: absolute; transform: translate(-50%, -50%) matrix(1, 0, 0, 1, 0, 0);">
                            <path stroke="#D90A2C" id="outline" fill="none" stroke-width="4" stroke-linecap="round"
                                  stroke-linejoin="round" stroke-miterlimit="10"
                                  d="M93.9,46.4c9.3,9.5,13.8,17.9,23.5,17.9s17.5-7.8,17.5-17.5s-7.8-17.6-17.5-17.5c-9.7,0.1-13.3,7.2-22.1,17.1 c-8.9,8.8-15.7,17.9-25.4,17.9s-17.5-7.8-17.5-17.5s7.8-17.5,17.5-17.5S86.2,38.6,93.9,46.4z" />
                            <path id="outline-bg" opacity="0.05" fill="none" stroke="#959595" stroke-width="4"
                                  stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10"
                                  d="M93.9,46.4c9.3,9.5,13.8,17.9,23.5,17.9s17.5-7.8,17.5-17.5s-7.8-17.6-17.5-17.5c-9.7,0.1-13.3,7.2-22.1,17.1 c-8.9,8.8-15.7,17.9-25.4,17.9s-17.5-7.8-17.5-17.5s7.8-17.5,17.5-17.5S86.2,38.6,93.9,46.4z" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End preloader area  -->


        <!-- ========== Top Bar start============= -->
        <div class="top-bar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="top-bar-items">
                            <div class="email d-flex align-items-center">
                                <div class="email-icon">
                                    <svg width="26" height="26" viewBox="0 0 26 26" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_461_205)">
                                    <path
                                        d="M23.5117 3.30075H2.38674C1.04261 3.30075 -0.0507812 4.39414 -0.0507812 5.73827V20.3633C-0.0507812 21.7074 1.04261 22.8008 2.38674 22.8008H23.5117C24.8558 22.8008 25.9492 21.7074 25.9492 20.3633V5.73827C25.9492 4.39414 24.8558 3.30075 23.5117 3.30075ZM23.5117 4.92574C23.6221 4.92574 23.7271 4.94865 23.8231 4.98865L12.9492 14.4131L2.07526 4.98865C2.17127 4.9487 2.27629 4.92574 2.38668 4.92574H23.5117ZM23.5117 21.1757H2.38674C1.93844 21.1757 1.57421 20.8116 1.57421 20.3632V6.70547L12.4168 16.1024C12.57 16.2349 12.7596 16.3008 12.9492 16.3008C13.1388 16.3008 13.3285 16.2349 13.4816 16.1024L24.3242 6.70547V20.3633C24.3242 20.8116 23.96 21.1757 23.5117 21.1757Z" />
                                    </g>
                                    </svg>
                                </div>
                                <div class="email-info">
                                    <span>Email</span>
                                    <h6><a
                                            href="#"><span
                                                class="__cf_email__"
                                                data-cfemail="284d50494558444d684f45494144064b4745">fptuniversity@fpt.edu.vn</span></a>
                                    </h6>
                                </div>
                            </div>
                            <div class="social-icon">
                                <ul class="d-flex align-items-center">
                                    <li><a href="https://www.facebook.com/"><i class='bx bxl-facebook'></i></a></li>
                                    <li><a href="https://twitter.com/"><i class='bx bxl-twitter'></i></a></li>
                                    <li><a href="https://www.pinterest.com/"><i class='bx bxl-pinterest-alt'></i></a></li>
                                    <li><a href="https://www.instagram.com/"><i class='bx bxl-instagram'></i></a></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ========== Top Bar End============= -->
        <!-- ========== header start============= -->
        <jsp:include page="./common/header.jsp"></jsp:include>
            <!-- ========== header end============= -->
            <!-- ========== Hero start============= -->
            <div class="hero-style1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 px-0">
                            <div class="hero-video">
                                <video autoplay loop="loop" muted preload="auto">
                                    <source src="${pageContext.request.contextPath}/guest/assets/video/videofpt.mp4" type="video/mp4">
                            </video>
                            <div class="hero-content">
                                <h1 style="color: orangered;font-weight: 800">FPT University.</h1>
                            </div>
                            <div class="scroll-dowm">
                                <a href="#about-area"><img src="${pageContext.request.contextPath}/guest/assets/images/icons/scroll-down.svg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ========== Hero end============= -->
        <!-- ========== Home1 About start============= -->
        <div class="home-one-about pt-120 pb-120" id="about-area">
            <img class="about-vector" src="${pageContext.request.contextPath}/guest/assets/images/bg/h1-about-bg.png" alt="">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="about-content">
                            <div class="section-title1">
                                <span>Quản lý câu lạc bộ FPT</span>
                                <h2>ĐẠI HỌC FPT</h2>
                            </div>
                            <p>Chào mừng bạn đến với thế giới sôi động và đa dạng của các câu lạc bộ tại FPT University! Với hàng chục câu lạc bộ trải dài từ học thuật, kỹ năng mềm, nghệ thuật, thể thao cho đến các hoạt động xã hội, FPT University mang đến cho sinh viên vô vàn cơ hội để phát triển bản thân, kết nối bạn bè và khám phá đam mê.</p>
                            <p>Ban Quản lý Câu lạc bộ là đơn vị hỗ trợ và điều phối các hoạt động của câu lạc bộ trong trường, đóng vai trò quan trọng trong việc xây dựng đời sống sinh viên năng động và đầy màu sắc. Nếu bạn đang tìm kiếm một môi trường để rèn luyện kỹ năng, mở rộng mối quan hệ hay đơn giản là tận hưởng quãng đời sinh viên trọn vẹn – thì CLB chính là nơi dành cho bạn!</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about-img">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/anhhome1.png" alt="">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ========== Home1 About end============= -->
    <!-- ========== Home1 Room start============= -->
<%--    <div class="our-room-section mb-120">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-12">--%>
<%--                    <div class="section-title1 text-center">--%>
<%--                        <span>FPT Clubs</span>--%>
<%--                        <h2>Our Clubs</h2>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="row g-4 justify-content-center">--%>
<%--                <div class="col-lg-4 col-md-6">--%>
<%--                    <div class="single-room">--%>
<%--                        <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/room1.png" alt="">--%>
<%--                        <div class="background"></div>--%>
<%--                        <div class="room-content">--%>
<%--                            <div class="price-tag">--%>
<%--                                <span>$350</span> / Per Night--%>
<%--                            </div>--%>
<%--                            <h3><a href="room-suits-details.html">Double Room</a></h3>--%>
<%--                            <div class="bed-and-person d-flex align-items-center">--%>
<%--                                <div class="bed-qty">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/double-bed.svg" alt=""> 2 Double Bed</p>--%>
<%--                                </div>--%>
<%--                                <div class="persons">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/persons.svg" alt="">8 Guest</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="book-btn">--%>
<%--                                <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-4 col-md-6">--%>
<%--                    <div class="single-room">--%>
<%--                        <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/room2.png" alt="">--%>
<%--                        <div class="background"></div>--%>
<%--                        <div class="room-content">--%>
<%--                            <div class="price-tag">--%>
<%--                                <span>$550</span> / Per Night--%>
<%--                            </div>--%>
<%--                            <h3><a href="room-suits-details.html">Family Room</a></h3>--%>
<%--                            <div class="bed-and-person d-flex align-items-center">--%>
<%--                                <div class="bed-qty">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/double-bed.svg" alt=""> 3 Double Bed</p>--%>
<%--                                </div>--%>
<%--                                <div class="persons">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/persons.svg" alt="">10 Guest</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="book-btn">--%>
<%--                                <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-4 col-md-6">--%>
<%--                    <div class="single-room">--%>
<%--                        <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/room3.png" alt="">--%>
<%--                        <div class="background"></div>--%>
<%--                        <div class="room-content">--%>
<%--                            <div class="price-tag">--%>
<%--                                <span>$450</span> / Per Night--%>
<%--                            </div>--%>
<%--                            <h3><a href="room-suits-details.html">Deluxe Room</a></h3>--%>
<%--                            <div class="bed-and-person d-flex align-items-center">--%>
<%--                                <div class="bed-qty">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/double-bed.svg" alt=""> 1 Double Bed</p>--%>
<%--                                </div>--%>
<%--                                <div class="persons">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/persons.svg" alt="">3 Guest</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="book-btn">--%>
<%--                                <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-4 col-md-6">--%>
<%--                    <div class="single-room">--%>
<%--                        <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/room4.png" alt="">--%>
<%--                        <div class="background"></div>--%>
<%--                        <div class="room-content">--%>
<%--                            <div class="price-tag">--%>
<%--                                <span>$380</span> / Per Night--%>
<%--                            </div>--%>
<%--                            <h3><a href="room-suits-details.html">Superior Room</a></h3>--%>
<%--                            <div class="bed-and-person d-flex align-items-center">--%>
<%--                                <div class="bed-qty">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/double-bed.svg" alt=""> 2 Single Bed</p>--%>
<%--                                </div>--%>
<%--                                <div class="persons">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/persons.svg" alt=""> 4 Guest</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="book-btn">--%>
<%--                                <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-4 col-md-6">--%>
<%--                    <div class="single-room">--%>
<%--                        <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/room5.png" alt="">--%>
<%--                        <div class="background"></div>--%>
<%--                        <div class="room-content">--%>
<%--                            <div class="price-tag">--%>
<%--                                <span>$600</span> / Per Night--%>
<%--                            </div>--%>
<%--                            <h3><a href="room-suits-details.html">Luxury Room</a></h3>--%>
<%--                            <div class="bed-and-person d-flex align-items-center">--%>
<%--                                <div class="bed-qty">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/double-bed.svg" alt=""> 2 Double Bed</p>--%>
<%--                                </div>--%>
<%--                                <div class="persons">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/persons.svg" alt="">6 Guest</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="book-btn">--%>
<%--                                <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-4 col-md-6">--%>
<%--                    <div class="single-room">--%>
<%--                        <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/room6.png" alt="">--%>
<%--                        <div class="background"></div>--%>
<%--                        <div class="room-content">--%>
<%--                            <div class="price-tag">--%>
<%--                                <span>$560</span> / Per Night--%>
<%--                            </div>--%>
<%--                            <h3><a href="room-suits-details.html">Standard Room</a></h3>--%>
<%--                            <div class="bed-and-person d-flex align-items-center">--%>
<%--                                <div class="bed-qty">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/double-bed.svg" alt=""> 1 Single Bed</p>--%>
<%--                                </div>--%>
<%--                                <div class="persons">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/persons.svg" alt="">2 Guest</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="book-btn">--%>
<%--                                <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="row pt-70">--%>
<%--                <div class="col-12 d-flex justify-content-center">--%>
<%--                    <a class="room-btn btn--primary eg-btn" href="room-suits1-2.html">Room & Suites</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!-- ========== Home1 Room end============= -->
    <!-- ========== Home1 Feature start============= -->
<%--    <div class="home-one-features mb-120">--%>
<%--        <div class="container-fluid">--%>
<%--            <div class="row align-items-center">--%>
<%--                <div class=" col-xl-6 px-0">--%>
<%--                    <div class="feature-content">--%>
<%--                        <div class="section-title1">--%>
<%--                            <span>Our Facilites</span>--%>
<%--                            <h2>Core Feature</h2>--%>
<%--                        </div>--%>
<%--                        <div class="row g-3 justify-content-center nav nav-tabs" id="pills-tab" role="tablist">--%>
<%--                            <div class="col-md-3 col-sm-4 col-6 nav-item" role="presentation">--%>
<%--                                <button class="nav-link feature-items active" id="pills-restaurant-tab"--%>
<%--                                        data-bs-toggle="tab" data-bs-target="#pills-restaurant" type="button" role="tab"--%>
<%--                                        aria-controls="pills-restaurant-tab" aria-selected="true">--%>

<%--                                    <svg width="50" height="50" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M0.498068 0.136719C2.07573e-05 0.410156 0.00978639 0.273438 0.00978639 7.08008C2.07662e-05 14.209 2.07573e-05 14.2188 0.683614 15.6055C1.16213 16.5625 2.08986 17.5488 3.00783 18.0664L3.6133 18.4082L3.63283 33.1055L3.66213 47.8027L3.86721 48.252C4.16994 48.8965 4.62893 49.3652 5.25393 49.6777C5.71291 49.9023 5.93752 49.9512 6.54299 49.9512C7.76369 49.9512 8.71096 49.3457 9.21877 48.252L9.42385 47.8027L9.45315 33.1055L9.48244 18.4082L10.0879 18.0664C10.9961 17.5488 11.9238 16.5625 12.4024 15.6055C13.086 14.2188 13.086 14.1992 13.086 7.09961C13.086 0.234375 13.0957 0.361328 12.5488 0.117188C12.2266 -0.0292969 11.9922 -0.0292969 11.6699 0.117188C11.1328 0.361328 11.1328 0.3125 11.1328 6.15234V11.5234H10.2539H9.37502V6.15234C9.37502 2.20703 9.34572 0.722656 9.25783 0.537109C9.13088 0.253906 8.72072 0 8.39846 0C8.07619 0 7.66604 0.253906 7.53908 0.537109C7.45119 0.722656 7.4219 2.20703 7.4219 6.15234V11.5234H6.54299H5.66408V6.15234C5.66408 2.20703 5.63479 0.722656 5.5469 0.537109C5.34182 0.078125 4.74611 -0.117188 4.24807 0.117188C3.71096 0.361328 3.71096 0.3125 3.71096 6.15234V11.5234H2.83205H1.95315V6.15234C1.95315 2.20703 1.92385 0.722656 1.83596 0.537109C1.62111 0.0683594 0.976583 -0.126953 0.498068 0.136719ZM11.0059 13.8086C10.8399 14.8535 9.71682 16.1719 8.63283 16.5918C8.32033 16.7188 7.93947 16.9434 7.79299 17.0996L7.51955 17.3828V32.334C7.51955 48.584 7.54885 47.6758 6.98244 47.9297C6.66018 48.0762 6.4258 48.0762 6.10354 47.9297C5.53713 47.6758 5.56643 48.584 5.56643 32.334V17.4023L5.31252 17.0996C5.1758 16.9336 5.00979 16.7969 4.94143 16.7969C4.63869 16.7969 3.6133 16.1719 3.15432 15.7129C2.63674 15.1953 2.16799 14.3652 2.0801 13.8086L2.02151 13.4766H6.54299H11.0645L11.0059 13.8086Z" />--%>
<%--                                    <path--%>
<%--                                        d="M48.1843 0.380859C47.2956 0.976562 46.0358 2.10938 45.196 3.06641C43.1354 5.39062 41.7194 8.30078 41.0944 11.4453C40.8796 12.5195 40.8796 12.7637 40.8405 20.127C40.8112 28.4961 40.8014 28.3887 41.4167 29.6094C41.6413 30.0488 42.0612 30.5664 42.9304 31.4453L44.1413 32.6758L44.1608 40.2441C44.1901 47.6953 44.1901 47.8125 44.3952 48.252C44.6979 48.8965 45.1569 49.3652 45.7819 49.6777C46.2409 49.9023 46.4655 49.9512 47.071 49.9512C48.2917 49.9512 49.2389 49.3457 49.7468 48.252L49.9518 47.8027L49.9811 24.3164C50.0007 6.74805 49.9714 0.761719 49.8932 0.556641C49.7663 0.253906 49.3561 0 48.9948 0C48.8581 0 48.4968 0.175781 48.1843 0.380859ZM47.9401 47.4902C47.8132 47.7832 47.403 48.0469 47.071 48.0469C46.7878 48.0469 46.3288 47.793 46.2311 47.5879C46.1823 47.4902 46.1237 43.9062 46.0944 39.6289L46.0456 31.8457L44.6686 30.4492C43.7702 29.5312 43.2136 28.8867 43.0573 28.5645L42.8229 28.0762L42.7936 20.9082C42.7741 14.9707 42.7936 13.5352 42.9206 12.6074C43.3503 9.25781 44.8444 6.18164 47.1686 3.81836L47.9987 2.97852L48.028 25.0977C48.0475 41.6016 48.0182 47.2852 47.9401 47.4902Z" />--%>
<%--                                    <path--%>
<%--                                        d="M22.8516 6.45508C21.0547 6.66016 18.8379 7.28516 17.2363 8.04687C16.2598 8.50586 16.0156 8.75 16.0156 9.25781C16.0156 9.70703 16.4648 10.1562 16.9043 10.1562C17.0801 10.1562 17.793 9.92187 18.4961 9.62891C21.3281 8.44727 24.2188 8.05664 27.1777 8.44727C30.7227 8.91602 33.7598 10.3516 36.416 12.8418C37.334 13.6914 37.4414 13.7695 37.8027 13.7695C38.3691 13.7695 38.7695 13.3594 38.7695 12.7832C38.7695 12.4023 38.7207 12.3242 38.0371 11.6602C35 8.71094 31.1621 6.91406 26.9336 6.45508C25.8398 6.32812 23.9258 6.33789 22.8516 6.45508Z" />--%>
<%--                                    <path--%>
<%--                                        d="M23.584 11.1914C21.4453 11.4258 19.0723 12.3047 17.1973 13.5547C16.1035 14.2773 14.2774 16.1035 13.5547 17.1875C12.5 18.7793 11.8067 20.4102 11.4063 22.2559C11.1035 23.5938 11.1133 26.3867 11.4063 27.7441C12.6172 33.2813 16.7481 37.4023 22.2949 38.5938C23.7207 38.8965 26.2793 38.8965 27.6953 38.5938C29.1211 38.291 30.0781 37.9492 31.3574 37.2852C35.0781 35.3809 37.6856 31.9238 38.5938 27.7051C38.877 26.377 38.8965 23.8184 38.6328 22.5098C37.7637 18.1152 35.0391 14.5215 31.1035 12.5684C29.2481 11.6504 27.5488 11.2402 25.3906 11.1816C24.6094 11.1621 23.7988 11.1719 23.584 11.1914ZM26.7676 13.2324C30.586 13.8086 33.9063 16.2207 35.6738 19.7266C36.1621 20.7031 36.6016 22.0898 36.7676 23.2324C37.7442 29.707 33.252 35.791 26.7578 36.7773C21.6113 37.5488 16.5137 34.834 14.2578 30.127C11.5918 24.5508 13.6328 17.9297 18.9942 14.7266C21.2598 13.3691 24.0918 12.8223 26.7676 13.2324Z" />--%>
<%--                                    <path--%>
<%--                                        d="M24.5508 16.1133C24.2285 16.2402 24.0234 16.6015 24.0234 17.0215C24.0234 17.998 25.3906 18.3301 25.8398 17.4707C26.2793 16.6113 25.4492 15.7422 24.5508 16.1133Z" />--%>
<%--                                    <path--%>
<%--                                        d="M20.957 17.002C18.3594 18.3106 16.5235 20.8887 16.1231 23.7793C15.9473 25.0488 15.9668 25.2637 16.3477 25.6445C16.7188 26.0156 17.0313 26.0645 17.4707 25.8301C17.8125 25.6543 17.9199 25.3711 18.0469 24.2578C18.1641 23.2324 18.4961 22.1973 18.9649 21.4063C19.4531 20.5664 20.7129 19.3652 21.6309 18.8574C22.0606 18.6133 22.4902 18.3594 22.5781 18.2813C22.832 18.0664 22.9004 17.5586 22.7149 17.207C22.4024 16.6113 21.8457 16.543 20.957 17.002Z" />--%>
<%--                                    <path--%>
<%--                                        d="M38.5548 35.0391C38.4669 35.0781 37.8712 35.6543 37.2462 36.3184C34.7169 38.9648 32.1779 40.4492 28.7794 41.2598C24.7169 42.2266 20.2247 41.5527 16.6505 39.4531C16.1036 39.1309 15.6544 38.9355 15.4591 38.9355C14.7853 38.916 14.297 39.6191 14.5509 40.2441C14.7072 40.6055 15.2443 40.9668 16.6505 41.6699C24.5216 45.6152 34.0822 43.5156 39.5802 36.6406C39.7462 36.4258 39.8439 36.1816 39.8439 35.9766C39.8439 35.3711 39.0724 34.8145 38.5548 35.0391Z" />--%>
<%--                                    <path--%>
<%--                                        d="M12.0214 36.6602C11.8944 36.7285 11.7284 36.8945 11.6601 37.0215C11.1132 38.0078 12.4022 38.9844 13.1933 38.1934C13.9843 37.4024 13.0077 36.1133 12.0214 36.6602Z" />--%>
<%--                                    </svg>--%>
<%--                                    Restaurant--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-3 col-sm-4 col-6 nav-item" role="presentation">--%>
<%--                                <button class="nav-link feature-items" id="pills-spa-tab" data-bs-toggle="tab"--%>
<%--                                        data-bs-target="#pills-spa" type="button" role="tab" aria-controls="pills-spa-tab"--%>
<%--                                        aria-selected="false">--%>

<%--                                    <svg width="50" height="50" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M8.23234 2.76394C7.88078 2.95925 7.33391 3.7405 7.12883 4.34597C6.7968 5.32253 6.91398 6.62136 7.41203 7.42214C7.49016 7.55886 7.72453 7.87136 7.92961 8.1155C8.69133 9.053 8.70109 9.81472 7.95891 10.8303C7.57805 11.3577 7.68547 11.9925 8.21281 12.2659C8.9257 12.6272 9.5507 12.2073 10.1366 10.9671C10.3612 10.4788 10.4003 10.2835 10.4003 9.47292C10.4003 8.66237 10.3612 8.46706 10.1366 7.97878C9.99016 7.65651 9.68742 7.19753 9.47258 6.93386C8.69133 5.99636 8.6718 5.23464 9.42375 4.20925C9.56047 4.0237 9.66789 3.77956 9.66789 3.65261C9.66789 2.90065 8.86711 2.41237 8.23234 2.76394Z" />--%>
<%--                                    <path--%>
<%--                                        d="M26.0254 5.66431C24.0918 6.05494 22.4121 7.49048 21.7773 9.30689C21.1719 11.0354 21.416 13.0081 22.4219 14.4241L22.7539 14.8928L21.416 14.9612C20.6738 14.9905 19.8047 15.0979 19.4824 15.1858C18.6816 15.4006 17.5977 15.9377 17.002 16.4065C16.7285 16.6213 16.4844 16.7971 16.4648 16.7971C16.4355 16.7971 15.8887 16.1428 15.2441 15.342C14.5996 14.551 14.0039 13.8674 13.916 13.8284C13.6133 13.7112 13.1055 13.7698 12.9102 13.9358C12.5781 14.2288 9.55078 18.0764 9.19922 18.6526C8.25195 20.2249 8.26172 22.3831 9.22852 23.8381C9.36523 24.0432 9.47266 24.2385 9.47266 24.2678C9.47266 24.2971 8.99414 24.3167 8.41797 24.3167H7.35352L6.51367 24.844C5.2832 25.6155 4.63867 26.1428 3.69141 27.1292C1.93359 28.9749 0.732422 31.3088 0.224609 33.8674C-0.00976562 35.0491 -0.00976562 37.7151 0.224609 38.887C0.527344 40.4006 1.28906 42.3342 2.03125 43.4963C2.86133 44.7952 4.43359 46.5139 5.35156 47.1194L5.73242 47.3635L23.6426 47.344L41.5527 47.3147L42.5293 47.051C44.9707 46.3772 46.9531 44.9417 48.3789 42.8225C48.7305 42.2952 48.8281 42.0706 48.8281 41.7483C48.8281 41.1721 48.4766 40.8206 47.9102 40.8206C47.4023 40.8303 47.3145 40.8987 46.709 41.7971C45.9375 42.9495 44.834 43.926 43.623 44.5217C41.9434 45.3616 41.5625 45.4104 36.5234 45.4104H32.2754L32.6172 45.1467C35.5078 42.9104 37.168 39.3459 36.9727 35.762C36.9043 34.5803 36.7578 34.0627 36.4258 33.887C36.3184 33.8284 35.8203 33.7307 35.332 33.6721C33.6328 33.4573 31.4062 33.8381 29.707 34.6194C29.3066 34.8049 28.9648 34.9612 28.9453 34.9612C28.9355 34.9612 28.8477 34.7268 28.75 34.4436C28.2617 32.9592 27.0996 31.1819 25.8594 30.0295L25.166 29.385L33.3105 29.4241C42.5293 29.4534 41.7969 29.3948 43.6426 30.2932C44.541 30.7229 44.7754 30.8889 45.6152 31.7288C46.1523 32.2659 46.6895 32.9104 46.875 33.2327C47.041 33.5354 47.2949 33.8772 47.4316 33.9846C48.0273 34.4534 48.9258 34.0042 48.9258 33.2424C48.9258 32.4514 47.4805 30.5471 46.0742 29.4924C45.2734 28.887 43.8965 28.1545 43.0957 27.9202L42.6855 27.803L43.3594 27.0706C44.1113 26.26 44.6777 25.2542 45.0391 24.1213C45.2246 23.5159 45.2637 23.1741 45.2637 22.1682C45.2637 20.7522 45.0781 20.0002 44.4043 18.7014C43.8477 17.6174 42.6367 16.4065 41.5527 15.8499C40.2246 15.1663 39.6094 15.0198 37.8809 14.9612L36.3574 14.9221L36.748 14.3362C37.8418 12.6956 37.9785 10.5667 37.0996 8.73072C36.6504 7.79322 35.459 6.59204 34.541 6.16236C33.418 5.62525 32.9199 5.56665 29.4922 5.57642C27.8027 5.58619 26.2402 5.62525 26.0254 5.66431ZM33.4473 7.80298C33.8574 7.969 34.209 8.21314 34.6289 8.63306C35.4199 9.42408 35.6836 10.0784 35.6836 11.2307C35.6836 12.3831 35.4199 13.0374 34.6289 13.8284C34.209 14.2483 33.8574 14.4924 33.4473 14.6585C32.8809 14.8831 32.7637 14.8928 29.8438 14.9221C28.0078 14.9417 26.6406 14.9124 26.3574 14.8538C24.3848 14.4241 23.0957 12.5491 23.4375 10.6252C23.7012 9.219 24.5703 8.19361 25.9375 7.72486C26.4844 7.52954 26.6992 7.51978 29.6875 7.54908C32.7832 7.56861 32.8711 7.57837 33.4473 7.80298ZM14.7949 17.9202C15.4785 18.7795 16.1523 19.717 16.2793 20.0002C16.748 20.9963 16.5625 22.3049 15.8496 23.1448C15.5176 23.5256 14.7168 24.1213 14.5312 24.1213C14.4922 24.1213 14.4531 23.3499 14.4531 22.4026V20.6838L14.1699 20.4006C13.9746 20.2053 13.7793 20.1174 13.5742 20.1174C13.2031 20.1174 12.7539 20.342 12.6367 20.5764C12.5879 20.6741 12.5293 21.5042 12.5 22.4319L12.4512 24.1116L12.1387 23.9651C11.6211 23.7112 11.0938 23.1936 10.791 22.6467C10.5273 22.1682 10.498 22.0315 10.498 21.2405C10.498 20.5276 10.5371 20.2737 10.7129 19.9221C10.9277 19.5022 13.457 16.26 13.5254 16.3284C13.5449 16.3479 14.1211 17.0608 14.7949 17.9202ZM39.3945 17.0901C40.3613 17.3342 41.0938 17.7542 41.7969 18.4573C42.5 19.1604 42.9199 19.8928 43.1641 20.8596C43.4082 21.8167 43.4082 22.5198 43.1641 23.4768C42.9199 24.4436 42.5 25.176 41.7969 25.8792C41.0938 26.5823 40.3613 27.0022 39.3945 27.2463C38.6719 27.4319 38.3008 27.4417 31.1328 27.4417H23.6133L22.9688 26.7971C22.1484 25.9866 21.3672 25.3811 20.3711 24.7854L19.5996 24.3167H18.5254H17.4609L17.6367 24.0432C18.2227 23.1643 18.4766 22.3049 18.4863 21.2405C18.4961 20.3713 18.291 19.5413 17.9004 18.8479L17.6562 18.4084L18.0371 18.0764C18.4961 17.676 19.6191 17.1292 20.2734 17.012C20.5469 16.9534 24.5605 16.9143 29.6973 16.9045C38.3203 16.8948 38.6719 16.9045 39.3945 17.0901ZM19.873 26.7776C20.6445 27.2756 22.3633 28.887 22.7051 29.4241L22.8809 29.6975L22.2461 30.3518C21.123 31.5237 20.3125 32.7932 19.7754 34.2288C19.6289 34.5999 19.502 34.9221 19.4922 34.9417C19.4727 34.9514 19.1406 34.8147 18.7402 34.6292C17.0898 33.8479 14.8047 33.4573 13.1152 33.6721C12.1875 33.7795 11.9238 33.887 11.7285 34.1995C11.543 34.5022 11.4062 35.9963 11.4746 36.9631C11.709 40.2346 13.1738 43.0081 15.7715 45.0881L16.1621 45.4006L11.2012 45.4104H6.23047L5.38086 44.5608C4.36523 43.5354 3.7793 42.7346 3.19336 41.553C1.30859 37.7834 1.60156 33.428 3.98438 29.8342C4.60938 28.9065 6.02539 27.5002 7.03125 26.8264L7.86133 26.2698H13.4766H19.1016L19.873 26.7776ZM24.7754 31.6604C25.8105 32.7542 26.4941 33.8577 26.9434 35.2053L27.2363 36.0842L26.4746 36.8655C25.6152 37.7542 24.9512 38.6526 24.5508 39.4729C24.3945 39.7854 24.248 40.0393 24.2188 40.0393C24.1895 40.0393 24.0918 39.8635 23.9941 39.6487C23.6426 38.887 22.8418 37.7834 22.0605 36.9631L21.2598 36.1331L21.377 35.5862C21.6992 34.1604 23.6328 31.2502 24.2578 31.2502C24.3262 31.2502 24.5508 31.4358 24.7754 31.6604ZM16.3184 35.8303C18.0371 36.2698 19.4434 37.0803 20.6543 38.3206C22.2949 40.01 23.2422 42.3147 23.2422 44.6487V45.4104H22.5195C21.6602 45.4104 20.3809 45.1956 19.5801 44.9221C16.0449 43.7014 13.6816 40.5764 13.418 36.7483C13.3203 35.4592 13.2812 35.5081 14.5312 35.5764C15.1074 35.6155 15.9082 35.7229 16.3184 35.8303ZM34.9902 36.6702C34.9121 40.928 31.748 44.5217 27.4316 45.2737C26.9629 45.3518 26.2695 45.4104 25.9082 45.3909L25.2441 45.3616L25.2148 44.7756C25.1758 44.053 25.3418 42.8518 25.6055 42.0022C26.7578 38.2131 30.4297 35.4983 34.2773 35.5764L35.0098 35.5959L34.9902 36.6702Z" />--%>
<%--                                    <path--%>
<%--                                        d="M3.06638 6.64087C2.56833 6.83618 1.93356 7.92017 1.75778 8.86743C1.57224 9.92212 1.94333 11.1721 2.67575 11.9827C3.47653 12.8811 3.51559 13.7893 2.78317 14.6682C2.25583 15.303 2.58786 16.1721 3.39841 16.2795C3.7988 16.3381 3.83786 16.3186 4.28708 15.8499C4.94138 15.1663 5.21481 14.4534 5.21481 13.3792C5.21481 12.3342 4.97067 11.6897 4.30661 10.8987C3.50583 9.96118 3.44724 9.11157 4.12106 8.26196C4.55075 7.72485 4.55075 7.20728 4.12106 6.82642C3.7988 6.54321 3.46677 6.47485 3.06638 6.64087Z" />--%>
<%--                                    <path--%>
<%--                                        d="M48.5448 36.6604C47.6952 37.1292 48.0565 38.4768 49.0233 38.4768C49.5214 38.4768 49.9999 37.9983 49.9999 37.51C49.9999 36.7776 49.1893 36.2991 48.5448 36.6604Z" />--%>
<%--                                    </svg>--%>
<%--                                    Spa--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-3 col-sm-4 col-6 nav-item" role="presentation">--%>
<%--                                <button class="nav-link feature-items" id="pills-gym-tab" data-bs-toggle="tab"--%>
<%--                                        data-bs-target="#pills-gym" type="button" role="tab" aria-controls="pills-gym-tab"--%>
<%--                                        aria-selected="false">--%>

<%--                                    <svg width="50" height="50" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M25.625 0.537109C25.5078 0.615234 25.3125 0.908203 25.1856 1.19141C24.9903 1.62109 24.9512 1.875 24.9512 2.63672C24.9512 3.62305 25.0781 4.00391 25.625 4.6582L25.8594 4.94141L25.4785 5.71289C24.8047 7.07031 24.6485 8.35938 25 9.70703C25.3418 11.0449 26.1719 12.3145 27.2364 13.1152L27.8125 13.5449L26.8653 15.0293L25.9278 16.5039L25.1465 16.4844L24.3653 16.4551L23.4375 15.1172C22.3047 13.4863 22.1485 13.3203 21.5332 13.0273C20.9668 12.7637 20.0977 12.7246 19.502 12.9297C18.2813 13.3691 17.5293 14.834 17.8906 16.084C17.9883 16.4062 18.4766 17.1973 19.336 18.418C21.875 22.0117 21.6016 21.8066 23.9551 21.8555L25.586 21.8945V23.3203V24.7461L23.6914 26.6504C21.1719 29.209 21.3574 28.6816 21.3086 33.252L21.2696 36.7676L20.625 37.0605C19.1992 37.7051 18.2422 38.877 17.9297 40.3516L17.8711 40.625H16.3672H14.8535L14.7949 40.0586C14.5117 37.4121 12.9785 35.6738 10.4297 35.1172L10.1563 35.0586V28.4668C10.1563 24.8438 10.1758 21.875 10.2051 21.875C10.2246 21.875 10.6934 22.1094 11.2305 22.3828C12.1485 22.8613 12.2656 22.9004 12.8711 22.8906C13.9844 22.8809 14.8926 22.3242 15.3711 21.3672C15.8594 20.3906 15.625 19.1016 14.834 18.4082C14.4238 18.0469 4.09181 12.1777 3.57424 12.0117C3.05666 11.8457 2.00197 11.9336 1.51369 12.1875C1.05471 12.4219 0.488299 12.998 0.234392 13.4766C-0.0292795 13.9844 -0.0195138 15.1562 0.263689 15.6738C0.595721 16.2891 0.97658 16.582 2.81252 17.6367L4.54103 18.6133L4.58986 22.4023L4.63869 26.1914L4.91213 26.4258C5.24416 26.709 5.459 26.7188 5.8008 26.4551L6.05471 26.2598V22.8809C6.05471 20.8496 6.09377 19.5312 6.1426 19.5508C6.19142 19.5605 6.78713 19.8828 7.46096 20.2637L8.69143 20.9473V28.0078V35.0684L7.40236 35.0391L6.10353 35.0098L6.05471 32.0508C6.00588 29.2578 5.99611 29.082 5.82033 28.9453C5.53713 28.7402 5.03908 28.7695 4.82424 29.0137C4.64846 29.209 4.63869 29.4238 4.60939 32.1289L4.5801 35.0488L3.02736 35.0781C1.64064 35.1074 1.44533 35.127 1.21096 35.3125C0.82033 35.5957 0.585955 35.9473 0.488299 36.3867C0.371111 36.8848 0.371111 47.7832 0.488299 48.2812C0.605486 48.8086 0.859393 49.1309 1.36721 49.3848L1.79689 49.6094H23.8477C39.5215 49.6094 46.0352 49.5801 46.4063 49.502C47.6953 49.2383 48.9942 48.2227 49.541 47.0508C50.7227 44.5508 49.4434 41.6309 46.8067 40.8203C46.2696 40.6543 45.8985 40.625 44.4727 40.625C43.5352 40.625 42.7735 40.6055 42.7735 40.5762C42.7735 40.5469 43.2227 39.3262 43.7598 37.8613C44.7949 35.0879 44.9121 34.5703 44.6387 34.043C44.5606 33.8965 44.3555 33.7012 44.1992 33.5938C43.8477 33.3887 41.211 32.4316 38.5254 31.543C37.5098 31.2012 36.6602 30.918 36.6407 30.9082C36.6309 30.8984 36.3574 29.5801 36.0449 27.9883L35.4785 25.0879L35.8594 23.1152C36.0742 22.0312 36.2598 21.1328 36.2793 21.1133C36.2989 21.0938 36.4453 21.1035 36.6114 21.1426L36.8946 21.2012L36.9336 23.0762C36.9629 24.9414 36.9629 24.9512 37.2461 25.4688C37.7735 26.416 38.6817 26.9141 39.7266 26.8359C40.4297 26.7871 40.9571 26.5332 41.4746 26.0059C42.168 25.2832 42.2071 25.0684 42.168 21.6113C42.1387 18.2227 42.1387 18.2324 41.3282 17.4512C40.918 17.0508 40.3125 16.8066 37.0313 15.7129L35.5469 15.2148L34.961 14.3945C34.6387 13.9453 34.375 13.5449 34.375 13.5156C34.375 13.4863 34.5996 13.252 34.8828 13.0078C36.2598 11.7676 37.0313 9.69727 37.0215 7.22656C37.0215 6.51367 36.9727 5.88867 36.8653 5.51758C36.377 3.64258 35.127 2.32422 33.1641 1.5918C32.8906 1.48438 32.1387 1.41602 30.7617 1.35742C28.6426 1.2793 28.1641 1.19141 26.8848 0.683594C26.0547 0.351562 25.9082 0.332031 25.625 0.537109ZM26.9629 2.30469C27.8711 2.61719 28.8086 2.75391 30.6641 2.82227C32.5293 2.89062 32.5781 2.90039 33.2129 3.20312C34.1406 3.65234 34.6973 4.17969 35.1074 5.00977C35.4785 5.77148 35.6934 6.99219 35.5664 7.60742L35.4981 7.93945L34.5996 7.10938C33.2422 5.83984 32.5293 5.50781 30.7813 5.32227C28.8574 5.12695 26.9336 4.24805 26.5235 3.37891C26.3574 3.02734 26.3086 2.14844 26.4551 2.14844C26.5039 2.14844 26.7285 2.2168 26.9629 2.30469ZM29.3164 6.54297C29.7656 6.64062 30.4883 6.77734 30.9375 6.82617C31.875 6.94336 32.4707 7.17773 33.0762 7.67578C33.5645 8.07617 34.2285 8.97461 34.668 9.84375L34.9805 10.459L34.7071 10.918C33.5645 12.8711 30.9961 13.5449 28.8965 12.4414C28.086 12.0117 27.0996 11.0156 26.7188 10.2246C26.1426 9.05273 26.1524 7.65625 26.7578 6.39648L27.0508 5.78125L27.7832 6.06445C28.1836 6.2207 28.877 6.43555 29.3164 6.54297ZM3.44728 13.5449C4.96096 14.3262 13.7696 19.4043 13.9453 19.5898C14.3457 20.0391 14.1699 20.8691 13.6035 21.2402C13.4375 21.3477 13.1543 21.4258 12.8906 21.4258C12.4903 21.4258 11.9238 21.123 7.13869 18.4082C1.64064 15.2832 1.46486 15.166 1.46486 14.5703C1.46486 13.6816 2.58791 13.0957 3.44728 13.5449ZM30.1953 14.3848C30.8985 14.4824 32.0801 14.4043 32.7735 14.1992C32.9395 14.1602 33.0469 14.2383 33.3399 14.6289C33.5352 14.8926 33.6914 15.1367 33.6914 15.166C33.6914 15.1953 33.5938 15.2344 33.4668 15.2734C33.1055 15.3613 32.4903 15.957 32.2266 16.4648C31.8946 17.1094 31.8848 18.2129 32.1973 18.7988C32.5586 19.4824 33.1739 19.9609 34.0723 20.2637C34.8438 20.5176 34.8828 20.5371 34.834 20.791C34.8047 20.9277 34.6387 21.7773 34.4629 22.6758L34.1406 24.3164H30.5957H27.0508V20.8887V17.4512L28.1055 15.8105C28.8672 14.6094 29.1895 14.1699 29.2969 14.2188C29.375 14.248 29.7852 14.3164 30.1953 14.3848ZM21.0645 14.4043C21.1817 14.4922 21.7383 15.2246 22.2949 16.0449C22.8614 16.8555 23.418 17.6172 23.5352 17.7246C23.711 17.8809 23.916 17.9297 24.668 17.9492L25.586 17.9883V19.1992V20.4102H24.1309C22.8906 20.4102 22.6465 20.3809 22.4805 20.2344C22.1192 19.9219 19.3946 15.9668 19.3067 15.625C19.1895 15.1953 19.4043 14.6777 19.8047 14.4336C20.1367 14.2188 20.791 14.209 21.0645 14.4043ZM37.4512 17.4023C39.3262 18.0469 40.166 18.3789 40.3809 18.5645L40.6739 18.8281L40.7032 21.6504C40.7324 24.1016 40.7129 24.502 40.5762 24.7656C40.2637 25.3516 39.5215 25.5566 38.9551 25.2246C38.4375 24.9219 38.3789 24.6387 38.3789 22.4805C38.3789 20.6934 38.3594 20.5176 38.1836 20.293C38.0371 20.1074 37.5391 19.8926 36.0254 19.3848C33.8574 18.6523 33.5254 18.457 33.4278 17.8516C33.3203 17.1387 33.8379 16.5039 34.5215 16.5039C34.6875 16.5039 35.9961 16.9043 37.4512 17.4023ZM33.7891 25.8594C33.7891 26.0742 33.0371 27.1582 32.5391 27.666C31.836 28.3887 30.9375 28.9746 28.418 30.3711C27.3145 30.9766 26.2989 31.5625 26.1524 31.6699C25.6348 32.0508 25.586 32.3145 25.586 34.5605V36.6211H24.1602H22.7344L22.7735 33.2715C22.8028 30.0684 22.8125 29.9121 23.0176 29.541C23.125 29.3262 23.9942 28.3887 24.9317 27.4609L26.6309 25.7812H30.2149C32.1778 25.7812 33.7891 25.8203 33.7891 25.8594ZM34.8047 29.2969C35.1758 31.2891 35.3028 31.6797 35.6446 31.9629C35.8203 32.1191 36.6309 32.4414 37.7637 32.8125C38.7696 33.1543 39.668 33.457 39.7559 33.5059C39.9024 33.584 39.8633 33.7402 39.4141 34.9121C39.1309 35.6348 38.877 36.25 38.8477 36.2793C38.8184 36.3086 38.5547 36.25 38.2715 36.1426C37.9785 36.0352 36.5137 35.5273 35.0098 35.0098C33.5156 34.502 32.1778 34.0137 32.0508 33.9258C31.9043 33.8281 31.5625 33.2422 31.1328 32.3535C30.7617 31.5723 30.4688 30.9277 30.4883 30.918C30.5078 30.8984 30.8692 30.6836 31.2989 30.4297C32.5391 29.6777 33.9746 28.457 34.3067 27.8711C34.3555 27.7832 34.4336 27.7539 34.4727 27.8027C34.5117 27.8418 34.668 28.5156 34.8047 29.2969ZM29.8633 33.0859C30.3028 34.0039 30.6934 34.668 30.918 34.8926C31.3281 35.3027 31.6114 35.4102 35.5567 36.7578L38.3496 37.7148L38.4082 38.6035C38.4473 39.1016 38.5352 39.7168 38.6231 39.9902C38.7012 40.2539 38.7696 40.5078 38.7696 40.5469C38.7696 40.5957 37.8711 40.625 36.7676 40.625C34.7656 40.625 34.7559 40.625 34.5215 40.8691C34.1406 41.2402 34.209 41.709 34.6778 41.9434C34.9121 42.0703 35.8203 42.0898 40.5078 42.0898C46.7871 42.0898 46.6016 42.0703 47.461 42.8418C48.2129 43.5156 48.4864 44.1113 48.4864 45.0684C48.4864 45.6543 48.4375 45.957 48.2715 46.2988C47.9785 46.9434 47.4317 47.5098 46.7969 47.8223L46.2403 48.0957L30.5469 48.125L14.8438 48.1445V46.9727V45.8008H30.3418H45.8399L46.0645 45.5859C46.3379 45.332 46.3574 44.9316 46.1035 44.6191L45.918 44.3848L30.3809 44.3555L14.8438 44.3359V43.2129V42.0898H23.2227C32.1485 42.0898 31.9531 42.0996 32.1875 41.6113C32.3145 41.3672 32.2071 40.8789 32.002 40.7422C31.9336 40.7031 30.8106 40.6543 29.4922 40.625L27.0996 40.5762V36.6797V32.793L28.0762 32.2266C28.6133 31.9141 29.0821 31.6504 29.1114 31.6504C29.1406 31.6406 29.4824 32.2949 29.8633 33.0859ZM42.3926 34.4336L43.3496 34.7852L43.1739 35.2344C43.0762 35.4883 42.5879 36.8066 42.0801 38.1543C41.2696 40.3711 41.1524 40.625 40.9571 40.625C40.8399 40.625 40.6641 40.5957 40.5762 40.5664C40.2344 40.4297 39.8438 39.2383 39.8438 38.3203C39.8438 38.0176 40.0391 37.373 40.4883 36.2012C41.3379 33.9746 41.2989 34.082 41.3672 34.082C41.4063 34.082 41.8653 34.2383 42.3926 34.4336ZM11.0645 36.8359C11.7774 37.1777 12.627 37.9785 12.9395 38.6133C13.3203 39.4141 13.3789 40.127 13.3789 44.2578V48.1445H7.6758C2.56838 48.1445 1.97267 48.125 1.91408 47.9883C1.83596 47.7832 1.83596 36.875 1.91408 36.6699C1.97267 36.5332 2.38283 36.5137 6.24025 36.543L10.4981 36.5723L11.0645 36.8359ZM25.586 39.3555V40.625H22.5098C19.0528 40.625 19.2578 40.6738 19.6192 39.8926C19.9414 39.1797 20.8399 38.4473 21.6602 38.2227C21.9434 38.1445 22.7832 38.0957 23.8574 38.0957L25.586 38.0859V39.3555Z" />--%>
<%--                                    <path--%>
<%--                                        d="M5.85938 40.0098C5.57617 40.1172 5.27344 40.4687 5.27344 40.6738C5.27344 40.791 5.36133 41.0059 5.47852 41.1523C5.67383 41.3965 5.71289 41.4062 6.74805 41.4062C7.68555 41.4062 7.83203 41.3867 8.00781 41.2109C8.25195 40.9668 8.26172 40.5176 8.01758 40.2246C7.85156 40.0098 7.74414 39.9902 6.91406 39.9707C6.41602 39.9609 5.9375 39.9707 5.85938 40.0098Z" />--%>
<%--                                    <path--%>
<%--                                        d="M5.51758 43.7012C5.38086 43.8281 5.27344 44.0527 5.27344 44.1895C5.27344 44.3262 5.38086 44.5508 5.51758 44.6777C5.73242 44.9023 5.82031 44.9219 6.71875 44.9219C7.54883 44.9219 7.72461 44.8926 7.94922 44.7168C8.28125 44.4531 8.30078 43.9453 7.98828 43.6523C7.80273 43.4863 7.64648 43.457 6.76758 43.457C5.82031 43.457 5.73242 43.4766 5.51758 43.7012Z" />--%>
<%--                                    </svg>--%>
<%--                                    Gym--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-3 col-sm-4 col-6 nav-item" role="presentation">--%>
<%--                                <button class="nav-link feature-items" id="pills-pool-tab" data-bs-toggle="tab"--%>
<%--                                        data-bs-target="#pills-pool" type="button" role="tab" aria-controls="pills-pool-tab"--%>
<%--                                        aria-selected="false">--%>

<%--                                    <svg width="50" height="50" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M32.1289 3.89647C30.2637 4.39452 28.7988 5.791 28.1543 7.666C27.8906 8.43749 27.8906 8.46679 27.8516 11.543C27.8223 13.8086 27.7832 14.6484 27.7051 14.6484C27.5195 14.6484 25.498 15.6543 24.9023 16.0351C24.0918 16.5527 23.2812 16.9433 22.3633 17.2461C21.5918 17.5 21.4258 17.5195 19.9219 17.5195C18.4863 17.5195 18.2031 17.4902 17.2852 17.2558C15.8398 16.8848 14.707 16.7578 13.2812 16.8359C7.20703 17.1289 2.20703 21.4746 1.00586 27.5195C0.771484 28.7109 0.771484 31.2012 1.00586 32.3144C1.58203 34.9902 2.65625 37.0801 4.42383 38.9258C6.68945 41.2988 9.44336 42.6367 12.7441 42.9687C14.2969 43.125 15.5664 43.0078 17.5781 42.5098C18.3887 42.3047 18.8477 42.2461 19.7754 42.2461C21.6797 42.2363 22.9883 42.6269 24.7754 43.7305C26.6309 44.873 28.4473 45.6055 30.5078 46.0254C32.0703 46.3379 35.0977 46.3379 36.6797 46.0156C38.2422 45.7031 39.4238 45.293 40.9668 44.5312C44.8535 42.5976 47.8809 39.0723 49.1992 34.9609C50.6445 30.4297 50.1074 25.6836 47.6953 21.5527C46.7188 19.8926 45 17.9883 43.4375 16.8262L42.5781 16.1914V12.832C42.5781 9.13085 42.6074 8.88671 43.1348 8.68163C43.6523 8.48632 44.2383 8.84764 44.2383 9.35546C44.2383 10.4199 45.0293 11.4746 46.0547 11.7773C47.3926 12.1582 48.8184 11.3183 49.1113 9.96093C49.2285 9.41405 49.1211 8.30077 48.8867 7.63671C48.0469 5.26366 45.8887 3.71093 43.457 3.71093C43.0566 3.71093 42.4414 3.77929 42.0996 3.85741C40.8789 4.15038 39.502 5.06835 38.8184 6.05468L38.5352 6.46483L38.3398 6.18163C37.9199 5.58593 36.9336 4.71679 36.2695 4.37499C35.0098 3.71093 33.457 3.53514 32.1289 3.89647ZM35.3613 5.74218C36.5723 6.32811 37.5195 7.65624 37.6562 8.96483C37.7344 9.65819 37.6172 9.97069 37.2363 10.1465C36.6016 10.4394 36.1621 10.0879 36.0352 9.18944C35.918 8.3496 35.5469 7.75389 34.8828 7.36327C34.2188 6.96288 33.6426 6.87499 32.9492 7.08007C32.2852 7.27538 31.6895 7.79296 31.3867 8.44725L31.1523 8.93554V15.0683V21.2012L30.9082 21.4355C30.6152 21.7383 30.0977 21.7578 29.7754 21.4941L29.541 21.3086V14.9219V8.54491L29.7656 7.9785C30.2051 6.89452 31.1621 5.95702 32.2266 5.57616C32.6562 5.41991 32.959 5.38085 33.7402 5.40038C34.6094 5.42968 34.7852 5.45897 35.3613 5.74218ZM44.8438 5.59569C46.3574 6.18163 47.334 7.44139 47.5195 9.06249C47.5781 9.63866 47.5684 9.66796 47.2852 9.96093C46.9043 10.3418 46.5625 10.3418 46.1816 9.97069C45.9668 9.75585 45.8984 9.58983 45.8984 9.30663C45.8984 8.01757 44.4336 6.7871 43.1152 6.98241C42.4609 7.08983 41.709 7.57811 41.3574 8.14452L41.0645 8.62304L41.0156 14.8828C40.9863 18.3301 40.9277 21.2207 40.8789 21.3183C40.6738 21.7383 39.9609 21.8066 39.5996 21.4355L39.3555 21.2012V15.0683C39.3555 11.2305 39.3945 8.76952 39.4629 8.49608C39.6777 7.54882 40.4492 6.46483 41.2793 5.94725C42.2559 5.34179 43.7891 5.18554 44.8438 5.59569ZM34.1992 8.89647C34.2969 9.00389 34.3945 9.2578 34.4238 9.45311C34.5215 10.0488 34.6582 10.4785 34.8633 10.8105C35.3125 11.543 36.4453 12.0215 37.2852 11.8262L37.6953 11.7383V12.6074V13.4766H35.2539H32.8125V11.2988C32.8125 9.02343 32.8223 8.9453 33.252 8.70116C33.5156 8.55468 33.9941 8.65233 34.1992 8.89647ZM37.6953 15.9668V16.7969H35.2539H32.8125V15.9668V15.1367H35.2539H37.6953V15.9668ZM27.832 17.2851V18.1641L27.4316 18.3594C27.2168 18.4766 26.8066 18.7109 26.5332 18.8867C25.2637 19.6973 23.7109 20.332 22.1484 20.6641C21.0449 20.9082 18.6133 20.8984 17.5781 20.6641C15.2246 20.1172 15.0391 20.0976 13.5742 20.1465C12.4219 20.1855 12.002 20.2344 11.2793 20.4492C5.78125 22.0801 2.76367 27.9199 4.6875 33.2324C5.81055 36.3379 8.28125 38.5644 11.6016 39.4726C12.207 39.6387 12.6367 39.6777 13.8672 39.6875C15.2637 39.6875 15.4785 39.668 16.6992 39.3652C17.7637 39.1015 18.2715 39.0234 19.3555 38.9844C22.0605 38.8867 23.9355 39.4043 26.5625 40.9668C28.623 42.1973 30.2637 42.7539 32.4414 42.9687C34.2871 43.1445 36.25 42.8906 38.0859 42.2265C42.4414 40.664 45.7324 36.7187 46.5234 32.1387C46.7285 30.957 46.7285 28.8183 46.5332 27.6758C46.1133 25.2734 44.9219 22.8613 43.2715 21.0742L42.5781 20.332V19.3457C42.5781 18.7891 42.6172 18.3594 42.666 18.3594C42.8418 18.3594 44.0332 19.4336 44.6875 20.1855C46.2305 21.9629 47.3438 24.0625 47.9004 26.2695C48.2715 27.7441 48.3691 28.789 48.3105 30.5176C48.2227 32.8906 47.793 34.5312 46.6699 36.7285C44.502 40.9375 40.3516 43.8574 35.5664 44.541C34.4922 44.6875 31.6406 44.5996 30.6641 44.3848C28.9746 44.0137 27.0117 43.2129 25.6152 42.3144C23.0078 40.6445 20.1855 40.2051 17.0215 40.9668C13.4766 41.8164 10.3809 41.3183 7.51953 39.4336C6.76758 38.9453 5.41992 37.6758 4.83398 36.914C3.82812 35.6055 3.04688 33.8867 2.67578 32.1289C2.44141 31.0351 2.44141 28.6816 2.67578 27.6562C3.19336 25.3418 4.15039 23.5644 5.75195 21.9141C6.69922 20.9473 7.58789 20.3027 8.83789 19.6777C11.4258 18.3984 13.9844 18.1445 16.9922 18.8574C18.1934 19.1504 18.4473 19.1797 19.873 19.1797C21.5918 19.1797 22.1191 19.0918 23.6133 18.5254C24.082 18.3496 25 17.8906 25.6543 17.5C26.7578 16.8457 27.5879 16.416 27.7637 16.4062C27.8027 16.4062 27.832 16.7969 27.832 17.2851ZM37.6953 19.2871V20.1172H35.2539H32.8125V19.2871V18.457H35.2539H37.6953V19.2871ZM28.1055 21.9043C28.3105 22.373 28.7793 22.8711 29.2383 23.1152C29.6777 23.3594 30.8887 23.3496 31.3867 23.1055C31.8457 22.8808 32.3633 22.3633 32.5195 21.9726L32.6367 21.6797H35.2148H37.7832L38.125 22.207C38.9355 23.4766 40.625 23.7207 41.7578 22.7246L42.2168 22.3242L42.5195 22.6953C44.3652 24.9512 45.332 28.1445 45.0293 30.9766C44.5312 35.5957 41.4648 39.4336 37.1582 40.8105C35.8203 41.2402 35.1367 41.3476 33.5938 41.3476C31.1133 41.3476 29.5898 40.8887 27.041 39.3457C24.0137 37.5195 20.3906 36.875 17.1387 37.5879C16.6602 37.6953 15.9277 37.8515 15.5273 37.9394C14.502 38.164 12.6172 38.0957 11.6699 37.793C8.85742 36.8945 6.79688 34.7265 6.04492 31.8848C5.79102 30.8887 5.76172 29.1601 5.99609 28.1836C6.69922 25.2344 8.7793 22.9883 11.6699 22.0703C12.1777 21.9043 12.6855 21.8359 13.6328 21.8066C14.8145 21.7578 15.0195 21.7773 16.2988 22.0605C17.0605 22.2266 18.1543 22.4121 18.7305 22.4707C21.4941 22.7344 24.6484 21.9726 27.1484 20.4297L27.7832 20.0391L27.8516 20.7617C27.8906 21.1621 28.0078 21.6699 28.1055 21.9043Z" />--%>
<%--                                    <path--%>
<%--                                        d="M21.6307 25.127C21.0447 25.3223 20.7029 25.5274 20.1951 25.9669C19.6971 26.4063 19.1893 26.6602 18.7987 26.6602C18.1541 26.6602 17.8319 27.5782 18.3104 28.0274C18.8279 28.5157 20.1756 28.1837 21.1424 27.334C21.7967 26.7676 22.0213 26.6602 22.5975 26.6602C23.0272 26.6602 23.6912 27.0118 24.0721 27.4415C24.1795 27.5587 24.4822 27.7637 24.7459 27.9005C25.9764 28.5255 27.4608 28.3204 28.4666 27.3829C29.0526 26.8458 29.4041 26.6602 29.8533 26.6602C30.4197 26.6602 30.7127 26.7872 31.2889 27.3145C31.8651 27.8321 32.4119 28.1055 33.1248 28.213C33.994 28.3497 34.3748 28.1055 34.3748 27.4024C34.3748 27.0118 34.0233 26.6602 33.6229 26.6602C33.242 26.6602 32.7147 26.3965 32.2557 25.9669C32.0115 25.752 31.5721 25.4493 31.2694 25.3126C30.8006 25.088 30.5858 25.0489 29.8826 25.0489C29.1697 25.0587 28.9744 25.0977 28.5154 25.3321C28.2225 25.4786 27.783 25.7911 27.5291 26.0255C27.1385 26.3868 26.5819 26.6602 26.2205 26.6602C25.8592 26.6602 25.3416 26.3965 24.8533 25.9669C24.5311 25.6934 24.0819 25.3809 23.8377 25.2735C23.2713 25.0294 22.1483 24.961 21.6307 25.127Z" />--%>
<%--                                    <path--%>
<%--                                        d="M11.9629 30.0195C11.3086 30.1855 10.9375 30.3906 10.3418 30.9179C9.79492 31.4062 9.51172 31.5429 9.07227 31.5429C8.7207 31.5429 8.20312 32.0019 8.20312 32.3144C8.20312 33.5351 9.98047 33.4472 11.4453 32.1484C12.3438 31.3574 13.1152 31.3671 14.0137 32.1777C15.0098 33.0761 16.1328 33.3788 17.2266 33.0663C17.8711 32.8808 18.3887 32.5781 18.75 32.1777C19.043 31.8554 19.668 31.5527 20.0488 31.5429C20.459 31.5429 20.9766 31.7968 21.4551 32.2363C22.002 32.7343 22.793 33.1054 23.4766 33.1738C23.9746 33.2226 24.0332 33.2128 24.3066 32.9296C24.4922 32.7441 24.6094 32.5292 24.6094 32.373C24.6094 32.0117 24.1211 31.5429 23.7402 31.5429C23.291 31.5429 22.9688 31.3867 22.3828 30.8593C21.6992 30.2538 20.9766 29.9609 20.1172 29.9511C19.2383 29.9413 18.5938 30.1855 17.9102 30.7812C16.748 31.787 16.0156 31.8066 14.9609 30.8398C14.1406 30.0878 12.959 29.7656 11.9629 30.0195Z" />--%>
<%--                                    <path--%>
<%--                                        d="M30.7812 30.0292C30.0879 30.2245 29.7754 30.3906 29.1895 30.9179C28.6426 31.4062 28.3594 31.5429 27.9199 31.5429C27.5391 31.5429 27.0508 32.0117 27.0508 32.373C27.0508 32.5292 27.168 32.7441 27.3535 32.9296C27.6367 33.2128 27.6758 33.2226 28.2031 33.164C28.9453 33.0761 29.6191 32.7538 30.293 32.1484C31.2305 31.3183 31.9434 31.3476 32.9688 32.246C33.291 32.5195 33.7305 32.832 33.9551 32.9296C35.0781 33.4277 36.4941 33.1835 37.4316 32.3242C38.5254 31.3281 39.2871 31.2988 40.3027 32.2363C40.8496 32.7343 41.6406 33.1054 42.3242 33.1738C42.8223 33.2226 42.8809 33.2128 43.1543 32.9296C43.3398 32.7441 43.457 32.5292 43.457 32.373C43.457 32.0117 42.9688 31.5429 42.5879 31.5429C42.1387 31.5429 41.8164 31.3867 41.2305 30.8593C39.8828 29.6581 38.0664 29.6288 36.7383 30.8007C35.6055 31.787 34.8535 31.7968 33.8086 30.8398C32.9688 30.0683 31.7871 29.7558 30.7812 30.0292Z" />--%>
<%--                                    </svg>--%>
<%--                                    Pool--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-3 col-sm-4 col-6 nav-item" role="presentation">--%>
<%--                                <button class="nav-link feature-items" id="pills-gamming-tab" data-bs-toggle="tab"--%>
<%--                                        data-bs-target="#pills-gaming" type="button" role="tab"--%>
<%--                                        aria-controls="pills-gamming-tab" aria-selected="false">--%>

<%--                                    <svg width="50" height="50" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M10.3027 6.53319C9.36523 6.96288 8.99414 7.65624 8.98438 8.95507V9.86327L8.47656 10.1172C6.13281 11.2891 4.4043 13.3496 3.67188 15.8203C3.49609 16.3965 2.34375 23.1543 2.34375 23.5742C2.34375 24.1406 3.18359 24.4531 3.56445 24.0234C3.69141 23.8769 3.88672 22.9297 4.35547 20.1953C5 16.3965 5.13672 15.8008 5.53711 14.9902C6.5918 12.9004 8.45703 11.4258 10.7227 10.8691C11.6211 10.6543 13.3203 10.6543 14.209 10.8789C15.127 11.1133 16.5332 11.8066 17.1875 12.3437L17.7246 12.793L17.7832 13.6914C17.8613 15.0391 18.3105 15.7812 19.3164 16.2793C19.873 16.5527 19.8828 16.5527 21.8359 16.5527C23.6328 16.5527 23.8281 16.5332 24.0137 16.3672C24.2969 16.1133 24.2969 15.5273 24.0137 15.2734C23.8281 15.1074 23.5938 15.0781 21.8848 15.0391C19.7852 14.9902 19.6484 14.9512 19.3848 14.3945C19.3066 14.2187 19.2383 13.9062 19.2383 13.6816V13.2812H25H30.7617V13.6816C30.7617 14.1601 30.5176 14.707 30.2344 14.873C30.0977 14.9512 29.3555 15.0098 28.1152 15.0391C26.4062 15.0781 26.1719 15.1074 25.9863 15.2734C25.7031 15.5273 25.7031 16.1133 25.9863 16.3672C26.1719 16.5332 26.3672 16.5527 28.1641 16.5527C30.1172 16.5527 30.127 16.5527 30.6836 16.2793C31.6895 15.7812 32.1387 15.0391 32.2168 13.6914L32.2754 12.793L32.8125 12.3437C33.4863 11.7871 34.8926 11.0937 35.791 10.8789C36.6211 10.6738 38.291 10.6543 39.1113 10.8301C41.7676 11.4062 43.9648 13.3496 44.8242 15.9082C45.0488 16.5918 48.5352 37.1387 48.5352 37.8125C48.5352 38.8672 48.0078 40.0879 47.207 40.8887C45.8105 42.2851 43.6426 42.5879 41.875 41.6308C41.2793 41.3086 40.4297 40.4101 40.1172 39.7851C39.9805 39.5215 39.707 38.7988 39.502 38.1836C39.3066 37.5683 39.0527 36.9726 38.9551 36.875C38.6133 36.5137 37.9785 36.6797 37.7832 37.168C37.6758 37.4512 38.5352 40.0488 38.9844 40.8008C40.5664 43.4473 43.9844 44.4043 46.8066 42.9883C48.6621 42.0605 49.9902 39.9023 50 37.8027C50 37.1875 46.5723 16.6308 46.3281 15.8203C45.6152 13.3984 43.8965 11.3183 41.6797 10.1953L41.0156 9.86327V8.99413C41.0156 7.6953 40.6836 7.03124 39.8145 6.59179C39.3359 6.35741 39.248 6.34764 37.5195 6.34764C35.5469 6.34764 35.1562 6.416 34.6289 6.84569C34.0625 7.31444 33.8867 7.82225 33.8867 8.95507V9.93163L33.1152 10.3808C32.6953 10.625 32.0801 11.0547 31.7578 11.3183L31.1621 11.8164H25H18.8379L18.2422 11.3183C17.9199 11.0547 17.3047 10.625 16.8848 10.3808L16.1133 9.93163V8.95507C16.1133 7.82225 15.9375 7.31444 15.3711 6.84569C14.8438 6.416 14.4531 6.34764 12.4902 6.34764C10.957 6.34764 10.6348 6.37694 10.3027 6.53319ZM14.4531 8.0078C14.6094 8.16405 14.6484 8.33007 14.6484 8.84764C14.6484 9.48241 14.6484 9.49218 14.4141 9.43358C13.3984 9.17968 12.0898 9.15038 10.8203 9.34569L10.4492 9.40429V8.86718C10.4492 8.46679 10.498 8.26171 10.6543 8.06639L10.8496 7.81249H12.5586C14.1309 7.81249 14.2773 7.83202 14.4531 8.0078ZM39.3457 8.06639C39.502 8.26171 39.5508 8.46679 39.5508 8.86718V9.40429L39.1895 9.34569C37.9102 9.15038 36.6016 9.17968 35.5859 9.43358C35.3516 9.49218 35.3516 9.48241 35.3516 8.84764C35.3516 7.82225 35.3711 7.81249 37.4414 7.81249H39.1504L39.3457 8.06639Z" />--%>
<%--                                    <path--%>
<%--                                        d="M37.1583 12.9785C35.2735 13.8281 35.5665 16.5234 37.5978 16.9824C38.8868 17.2754 40.1368 16.2402 40.1368 14.8926C40.1368 13.3691 38.545 12.3438 37.1583 12.9785ZM38.4767 14.4531C38.8282 14.8047 38.6622 15.4492 38.1837 15.5371C37.8517 15.6055 37.5001 15.4297 37.4317 15.1563C37.3439 14.8242 37.3829 14.6484 37.5685 14.4238C37.7735 14.1992 38.2325 14.209 38.4767 14.4531Z" />--%>
<%--                                    <path--%>
<%--                                        d="M11.6698 13.9258C10.9472 14.1894 10.3514 14.9512 10.2147 15.7812C10.1464 16.1719 10.1464 16.1719 9.55067 16.2988C9.04285 16.4062 8.8866 16.4941 8.44715 16.9238C8.04676 17.334 7.91004 17.5488 7.81239 17.959C7.49989 19.2578 8.37879 20.5859 9.66785 20.7617L10.1366 20.8203L10.244 21.3476C10.6542 23.4179 13.1737 23.9258 14.3944 22.1972C14.58 21.9238 14.6874 21.6308 14.7264 21.2988C14.7655 20.8203 14.785 20.8008 15.078 20.8008C15.244 20.8008 15.6054 20.6933 15.869 20.5664C16.7577 20.1465 17.1874 19.4726 17.1874 18.5058C17.1874 17.3144 16.3866 16.4062 15.1854 16.2402C14.7948 16.1914 14.746 16.1523 14.746 15.9375C14.746 14.4726 13.1151 13.3984 11.6698 13.9258ZM13.037 15.4785C13.2518 15.6836 13.2811 15.8008 13.2811 16.4551C13.2811 17.1094 13.3104 17.2265 13.5253 17.4316C13.7304 17.6465 13.8475 17.6758 14.4042 17.6758C15.078 17.6758 15.5565 17.8418 15.6639 18.1152C15.7909 18.457 15.7225 18.8574 15.4784 19.0918C15.2733 19.3066 15.1561 19.3359 14.5214 19.3359C13.4764 19.3359 13.3593 19.4531 13.2909 20.5566C13.2421 21.289 13.203 21.4258 12.9979 21.5918C12.6854 21.8457 12.2753 21.8262 11.9432 21.5429C11.6991 21.3281 11.6698 21.2402 11.6405 20.5176C11.5917 19.4922 11.4354 19.3359 10.4296 19.3359C9.80457 19.3359 9.72645 19.3164 9.45301 19.0429C9.20887 18.789 9.16981 18.6914 9.21864 18.4277C9.24793 18.2519 9.38465 18.0176 9.53114 17.8906C9.73621 17.7148 9.89246 17.6758 10.4882 17.6758C11.4843 17.6758 11.5526 17.6074 11.6307 16.5429C11.6796 15.7715 11.7089 15.6738 11.953 15.4687C12.3046 15.166 12.7343 15.166 13.037 15.4785Z" />--%>
<%--                                    <path--%>
<%--                                        d="M33.5449 16.5723C33.1054 16.7969 32.6074 17.2949 32.4511 17.666C32.2851 18.0566 32.2656 18.877 32.4218 19.2871C32.7343 20.0977 33.4961 20.6152 34.3945 20.6152C35.039 20.6152 35.3222 20.5078 35.7812 20.1074C36.9824 19.0625 36.6796 17.168 35.2343 16.5625C34.7656 16.3672 33.9257 16.3672 33.5449 16.5723ZM34.8828 18.0371C35.0976 18.2324 35.1074 18.7207 34.8925 18.9648C34.6972 19.1797 34.2089 19.1895 33.9648 18.9746C33.75 18.7793 33.7402 18.291 33.955 18.0469C34.1504 17.832 34.6386 17.8223 34.8828 18.0371Z" />--%>
<%--                                    <path--%>
<%--                                        d="M40.7616 16.543C40.2538 16.7676 39.7656 17.334 39.5995 17.8906C38.9648 20.039 41.6406 21.582 43.1835 19.9512C44.1796 18.9062 43.7988 17.1191 42.4609 16.5625C42.0116 16.3769 41.1718 16.3672 40.7616 16.543ZM42.1288 18.0859C42.4706 18.5644 42.207 19.1406 41.6601 19.1406C41.2988 19.1406 41.1816 19.0722 41.0253 18.7793C40.8788 18.4863 40.8886 18.4277 41.123 18.125C41.3866 17.793 41.914 17.7734 42.1288 18.0859Z" />--%>
<%--                                    <path--%>
<%--                                        d="M20.1173 20.1172C19.8731 20.3613 19.8634 20.8105 20.1075 21.1035C20.293 21.3281 20.3419 21.3379 21.7091 21.3379C22.9591 21.3379 23.1446 21.3184 23.3302 21.1523C23.5938 20.9082 23.6036 20.3809 23.3399 20.1172C23.1641 19.9414 23.0177 19.9219 21.7286 19.9219C20.4395 19.9219 20.293 19.9414 20.1173 20.1172Z" />--%>
<%--                                    <path--%>
<%--                                        d="M26.6602 20.1172C26.3966 20.3809 26.4063 20.9082 26.67 21.1523C26.8555 21.3184 27.0411 21.3379 28.2911 21.3379C29.6583 21.3379 29.7071 21.3281 29.8926 21.1035C30.1368 20.8105 30.127 20.3613 29.8829 20.1172C29.7071 19.9414 29.5606 19.9219 28.2716 19.9219C26.9825 19.9219 26.836 19.9414 26.6602 20.1172Z" />--%>
<%--                                    <path--%>
<%--                                        d="M37.2266 20.1172C35.6934 20.7324 35.4493 22.9199 36.7969 23.8769C37.3536 24.2676 38.3399 24.3457 38.9258 24.043C40.9571 22.998 40.2735 20 38.0176 20.0293C37.7051 20.0293 37.3536 20.0683 37.2266 20.1172ZM38.4962 21.6504C38.711 21.8457 38.7208 22.334 38.5059 22.5781C38.1446 22.9785 37.3829 22.6758 37.3829 22.1191C37.3829 21.5722 38.086 21.2695 38.4962 21.6504Z" />--%>
<%--                                    <path--%>
<%--                                        d="M16.0352 23.5937C15.4395 23.8184 14.6192 24.5996 14.3457 25.2148C14.0332 25.9473 14.0332 27.0117 14.3555 27.6855C14.6582 28.3105 15.2442 28.8965 15.8692 29.1992C16.25 29.375 16.5235 29.4336 17.0899 29.4336C18.0567 29.4434 18.6817 29.1699 19.3262 28.457C19.9512 27.7734 20.1563 27.1777 20.0977 26.2305C20.0195 25.1269 19.502 24.3066 18.5352 23.7793C18.1152 23.5449 17.8809 23.4961 17.2363 23.4668C16.709 23.4473 16.3184 23.4863 16.0352 23.5937ZM17.8613 25.1074C18.3594 25.3906 18.584 25.7422 18.6328 26.3184C18.6817 26.9238 18.5059 27.3144 18.0371 27.6758C17.0899 28.3984 15.7129 27.793 15.5567 26.582C15.4981 26.1133 15.8496 25.4199 16.2988 25.1269C16.7285 24.834 17.3731 24.834 17.8613 25.1074Z" />--%>
<%--                                    <path--%>
<%--                                        d="M31.9727 23.5449C31.1426 23.7793 30.2149 24.7266 29.9805 25.5664C29.834 26.1035 29.8633 26.9531 30.0391 27.4805C30.2539 28.1055 31.0157 28.916 31.6602 29.209C32.0411 29.375 32.3633 29.4336 32.8614 29.4434C34.3067 29.4434 35.3809 28.6328 35.7911 27.207C35.9864 26.5332 35.9375 25.8887 35.625 25.1758C35.3711 24.5703 34.5411 23.8086 33.9258 23.5938C33.4278 23.4277 32.461 23.3984 31.9727 23.5449ZM33.7012 25.127C34.7266 25.8105 34.6387 27.3047 33.5352 27.832C32.5098 28.3301 31.3477 27.6074 31.3477 26.4648C31.3477 25.7812 31.6895 25.2734 32.3243 24.9805C32.6563 24.834 33.3692 24.9023 33.7012 25.127Z" />--%>
<%--                                    <path--%>
<%--                                        d="M2.10938 25.8985C1.875 26.1133 1.80664 26.4063 0.927734 31.709C0.419922 34.7852 0 37.5293 0 37.8125C0.00976563 40.4981 1.98242 42.9199 4.64844 43.5156C5.61523 43.7305 6.92383 43.6621 7.8125 43.3594C9.10156 42.9199 10.332 41.9434 11.0156 40.8008C11.2012 40.4785 11.8945 38.6133 12.7539 36.0645L14.1797 31.8555L14.7852 32.0801C16.7578 32.8223 19.0918 32.4707 20.6738 31.1914L21.0742 30.8594H24.9902H28.9063L29.3652 31.211C31.0547 32.5 33.2422 32.8223 35.2246 32.0801L35.8301 31.8457L36.3379 33.3789C36.8652 34.961 37.0996 35.3516 37.5195 35.3516C37.8418 35.3516 38.1445 35.1074 38.2227 34.8047C38.3301 34.4043 36.9727 30.4395 36.6504 30.1758C36.5137 30.0684 36.3477 29.9805 36.2891 29.9805C36.2305 29.9805 35.791 30.1758 35.3027 30.4199C33.3691 31.3867 31.5234 31.1621 29.9121 29.7656L29.4824 29.3946H25H20.5176L20.0879 29.7656C18.4766 31.1621 16.6309 31.3867 14.6973 30.4199C14.2188 30.1758 13.7695 29.9805 13.7109 29.9805C13.6523 29.9805 13.4863 30.0684 13.3496 30.1758C13.1445 30.3418 12.8418 31.1426 11.6113 34.8438C10.8008 37.2949 10.0195 39.5215 9.88281 39.7852C9.57031 40.4102 8.7207 41.3086 8.125 41.6309C6.83594 42.3242 5.3418 42.3731 4.05273 41.7676C2.50977 41.0352 1.46484 39.4336 1.46484 37.8028C1.46484 37.5586 1.88477 34.8926 2.39258 31.875C3.36914 26.1231 3.37891 26.0156 2.93945 25.791C2.63672 25.625 2.37305 25.6641 2.10938 25.8985Z" />--%>
<%--                                    </svg>--%>
<%--                                    Gaming--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-3 col-sm-4 col-6 nav-item" role="presentation">--%>
<%--                                <button class="nav-link feature-items" id="pills-parking-tab" data-bs-toggle="tab"--%>
<%--                                        data-bs-target="#pills-parking" type="button" role="tab"--%>
<%--                                        aria-controls="pills-parking-tab" aria-selected="false">--%>

<%--                                    <svg width="50" height="50" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M33.6426 4.06251C33.252 4.25782 32.9297 4.57032 32.7344 4.93165C32.5879 5.18555 32.5684 5.61524 32.5684 8.2129C32.5684 11.0254 32.5781 11.2207 32.7539 11.416C33.0078 11.6992 33.4961 11.6895 33.7695 11.3965C33.9844 11.1719 33.9844 11.1035 33.9844 8.38868C33.9844 6.86524 34.0234 5.55665 34.0625 5.48829C34.1309 5.39063 35.6445 5.3711 41.3184 5.39063L48.4863 5.41993L48.5156 12.5391C48.5254 17.7149 48.5059 19.6973 48.4277 19.7852C48.2715 19.9707 34.2871 19.9902 34.1016 19.8047C34.0137 19.7168 33.9844 19.082 33.9844 17.5488C33.9844 16.2305 33.9453 15.3418 33.877 15.2246C33.7305 14.9316 33.3203 14.8145 32.9883 14.9512C32.5586 15.127 32.5 15.5176 32.5391 17.8711C32.5684 19.9024 32.5781 19.9902 32.8125 20.4102C32.959 20.6738 33.2129 20.9277 33.4473 21.0645C33.8281 21.2793 33.9062 21.2891 36.7969 21.2891H39.7461V25.5859C39.7461 29.0625 39.7266 29.8828 39.6191 29.8828C39.1992 29.8828 37.7148 29.4043 36.9727 29.0332C36.4941 28.7988 34.7852 27.7051 33.1641 26.6211C29.5312 24.1602 28.7109 23.7402 26.7578 23.2813C26.1328 23.1445 25.3223 23.1055 21.1426 23.0762C17.8906 23.0469 15.8594 23.0664 15.0586 23.1445C12.4609 23.3789 10.5371 24.2481 8.44727 26.1328C6.76758 27.6367 5.51758 28.3008 3.38867 28.7988C2.70508 28.9648 1.97266 29.1895 1.74805 29.2969C1.21094 29.5801 0.644531 30.1856 0.322266 30.8398L0.0488281 31.3965V35.5469C0.0488281 39.3066 0.0683594 39.7266 0.214844 40.0098C0.537109 40.5859 0.947266 40.8691 2.49023 41.5527L4.02344 42.2461L4.23828 42.832C4.56055 43.7012 4.89258 44.2188 5.50781 44.8047C7.79297 46.9629 11.5723 46.25 12.9395 43.4082L13.291 42.6758H25.0977H36.8945L37.2461 43.418C37.8027 44.5996 38.9258 45.5469 40.1855 45.9082C40.8789 46.1035 42.2949 46.0645 42.9688 45.8301C44.1699 45.4199 45.1953 44.4922 45.7324 43.3496L46.0352 42.6953L47.0117 42.6563C47.5879 42.627 48.1445 42.5391 48.3594 42.4512C48.9648 42.1973 49.5801 41.5527 49.8047 40.9375C50 40.4199 50.0098 40.2344 49.9805 37.8906C49.9414 35.0391 49.9023 34.8828 49.0137 33.5449C47.9297 31.9336 46.8457 31.3281 44.0234 30.7617L43.457 30.6543V25.9766V21.2988L46.1719 21.2695L48.8965 21.2402L49.2578 20.957C49.4629 20.8008 49.7168 20.4883 49.8145 20.2539C50 19.8535 50 19.5313 49.9805 12.4707L49.9512 5.1172L49.6875 4.7168C49.5312 4.48243 49.2578 4.23829 49.0039 4.11134C48.5742 3.90626 48.5156 3.90626 41.25 3.90626C34.8145 3.90626 33.8965 3.92579 33.6426 4.06251ZM41.9922 25.8398C41.9922 30.1172 41.9824 30.3809 41.8262 30.3418C41.7285 30.3125 41.5332 30.2637 41.3867 30.2344L41.1133 30.1758V25.791C41.1133 23.3887 41.1426 21.3867 41.1816 21.3574C41.2109 21.3184 41.416 21.2891 41.6211 21.2891H41.9922V25.8398ZM26.416 24.6973C27.5391 24.9316 28.6816 25.3711 29.5215 25.8984C29.8828 26.1328 31.3477 27.1094 32.7832 28.0762C35.3809 29.8242 36.8066 30.6348 37.7539 30.918C38.0273 30.9961 39.8633 31.3867 41.8359 31.7773C44.9609 32.4023 45.5176 32.5391 46.1426 32.8516C46.9824 33.2617 47.7539 34.043 48.2031 34.9316L48.4863 35.4981L48.5156 37.8906C48.5449 39.9512 48.5254 40.3223 48.3887 40.5859C48.1348 41.0547 47.7832 41.2109 46.9434 41.2109H46.2012L46.1328 40.7422C45.7617 38.1641 43.3984 36.3672 40.8398 36.7188C38.877 36.9824 37.2754 38.4668 36.8652 40.4004C36.7871 40.7715 36.7188 41.0938 36.7188 41.1426C36.7188 41.1816 31.4746 41.2012 25.0781 41.1914L13.4277 41.1621L13.3594 40.6738C12.959 37.5781 9.54102 35.791 6.66016 37.1582C5.41992 37.7441 4.375 39.043 4.15039 40.2637C4.08203 40.6055 4.05273 40.6348 3.82812 40.5762C3.70117 40.5469 3.125 40.293 2.54883 40.0098L1.51367 39.502L1.48438 35.6152C1.46484 31.8945 1.47461 31.7188 1.66016 31.3477C1.97266 30.7324 2.35352 30.5176 3.71094 30.1953C6.13281 29.6094 7.61719 28.8477 9.17969 27.3926C10.127 26.5039 10.7715 26.0352 11.6699 25.5664C13.6523 24.5606 13.8867 24.5313 20.2637 24.5215C25.0488 24.5117 25.6152 24.5313 26.416 24.6973ZM10.1758 38.457C10.918 38.8184 11.3477 39.2676 11.6895 40.0195C12.4805 41.7383 11.6406 43.7695 9.87305 44.4434C9.43359 44.6094 9.16992 44.6387 8.54492 44.6094C7.14844 44.5313 6.06445 43.7402 5.60547 42.4609C5.36133 41.7773 5.41016 40.7324 5.71289 40.0586C6.51367 38.3106 8.45703 37.6074 10.1758 38.457ZM42.9199 38.4277C44.9316 39.4531 45.3516 42.0703 43.7598 43.6621C42.1582 45.2637 39.502 44.8242 38.5059 42.7832C38.2715 42.3047 38.2324 42.1191 38.2324 41.3574C38.2324 40.625 38.2715 40.4004 38.4668 40C38.7793 39.3652 39.1797 38.916 39.7363 38.5938C40.4199 38.1934 40.8008 38.0957 41.6113 38.125C42.207 38.1445 42.4805 38.2031 42.9199 38.4277Z" />--%>
<%--                                    <path--%>
<%--                                        d="M14.1797 25.7324C12.6465 26.0645 10.7324 27.0996 9.91211 28.0273C9.56055 28.4277 8.33008 29.3652 7.4707 29.8828C6.38672 30.5371 6.10352 30.9277 6.10352 31.7871C6.10352 32.2949 6.15234 32.4512 6.38672 32.793C6.875 33.5059 7.19727 33.5938 9.30664 33.5938C11.0059 33.5938 11.1426 33.584 11.3281 33.3984C11.4355 33.291 11.5234 33.0762 11.5234 32.9102C11.5234 32.7441 11.4355 32.5293 11.3281 32.4219C11.1523 32.2461 11.0059 32.2266 9.51172 32.2266C8.58398 32.2266 7.8125 32.1875 7.70508 32.1289C7.37305 31.9434 7.4707 31.5723 7.93945 31.2891C9.13086 30.5371 9.73633 30.0879 10.6543 29.2773C12.6953 27.4707 13.6816 27.0703 16.2891 26.9824L17.8711 26.9238V29.5801V32.2266H16.5527C15.3613 32.2266 15.2148 32.2461 15.0391 32.4219C14.9316 32.5293 14.8437 32.7441 14.8437 32.9102C14.8437 33.0762 14.9316 33.291 15.0391 33.3984C15.2344 33.5938 15.3613 33.5938 25.3418 33.5938H35.4492L35.7617 33.3105C36.0547 33.0566 36.084 32.9688 36.0742 32.5C36.0742 32.0215 35.9277 31.6309 35.625 31.2402C35.4785 31.0645 29.2676 26.9043 28.6621 26.582C27.9687 26.2109 27.3144 25.9668 26.4844 25.7715C25.7324 25.5957 25.293 25.5859 20.2344 25.5957C16.0156 25.5957 14.6582 25.6348 14.1797 25.7324ZM26.3379 27.1777C27.4121 27.4609 28.1055 27.8516 31.2012 29.9121C32.8711 31.0254 34.3164 31.9922 34.4238 32.0703C34.5996 32.1973 33.7012 32.2168 26.9824 32.2266H19.3359V29.5801V26.9336L22.5391 26.9824C25.0586 27.0117 25.8594 27.0605 26.3379 27.1777Z" />--%>
<%--                                    <path--%>
<%--                                        d="M18.6427 34.7754C18.1251 34.9707 18.0665 35.7715 18.545 36.0254C18.6524 36.084 19.297 36.1328 20.0001 36.1328C21.1329 36.1328 21.2892 36.1133 21.5235 35.9277C21.8263 35.6836 21.8556 35.2832 21.5919 34.9512C21.4161 34.7266 21.338 34.7168 20.1466 34.6973C19.463 34.6875 18.7794 34.7168 18.6427 34.7754Z" />--%>
<%--                                    <path--%>
<%--                                        d="M7.73446 39.4629C7.27548 39.6875 6.92391 40.0879 6.68954 40.6543C6.06454 42.1582 7.59774 43.877 9.18954 43.457C10.8399 43.0273 11.4063 40.9668 10.1954 39.8242C9.56063 39.2383 8.50595 39.082 7.73446 39.4629ZM9.02352 40.7324C9.52157 40.957 9.56063 41.7383 9.09188 41.9824C8.3204 42.3926 7.58798 41.3574 8.2618 40.8301C8.55477 40.5957 8.68173 40.5762 9.02352 40.7324Z" />--%>
<%--                                    <path--%>
<%--                                        d="M40.5272 39.4433C39.3065 40.0976 38.955 41.5625 39.7558 42.6855C40.4686 43.6816 42.1972 43.7793 43.0272 42.8515C44.0136 41.7773 43.6718 40.0488 42.3534 39.4238C41.8847 39.1992 40.9667 39.209 40.5272 39.4433ZM41.9433 40.8691C42.0897 41.0058 42.1874 41.2207 42.1874 41.3672C42.1874 41.7285 41.8358 42.0898 41.4843 42.0898C41.1327 42.0898 40.7225 41.6992 40.7225 41.3574C40.7225 41.0351 41.1327 40.625 41.455 40.625C41.5917 40.625 41.8163 40.7324 41.9433 40.8691Z" />--%>
<%--                                    <path--%>
<%--                                        d="M17.8613 7.66601C16.289 7.95898 14.5605 8.65234 13.3301 9.46289C12.4414 10.0488 11.3281 11.0254 11.2207 11.3086C11.0156 11.8457 11.5527 12.3926 12.0996 12.1875C12.2265 12.1484 12.5683 11.8945 12.8515 11.6309C15.2832 9.40429 18.8086 8.46679 22.168 9.15039C24.0722 9.53125 25.5762 10.3027 27.2754 11.7578C27.9101 12.3047 28.3301 12.3828 28.6328 12.0019C28.9551 11.6113 28.8574 11.3086 28.2519 10.7324C26.7871 9.33593 25.0097 8.38867 22.9004 7.84179C21.6699 7.52929 19.0625 7.4414 17.8613 7.66601Z" />--%>
<%--                                    <path--%>
<%--                                        d="M38.9454 8.1152C38.7793 8.2031 38.7696 8.5156 38.7696 12.3437C38.7696 17.041 38.7305 16.7968 39.5704 16.7968C40.2832 16.7968 40.3321 16.6894 40.3321 15.0097V13.5742H40.8008C41.6797 13.5742 42.8614 13.3886 43.2422 13.1933C44.1504 12.7343 44.5801 11.8164 44.5118 10.5078C44.4434 9.25778 43.8868 8.43747 42.9297 8.15427C42.3536 7.97849 39.2188 7.94919 38.9454 8.1152ZM42.3731 9.52146C42.7832 9.72653 42.9981 10.2636 42.9493 10.9472C42.8711 11.9726 42.4414 12.2851 41.0938 12.2949L40.3321 12.3047V10.8398V9.37497H41.211C41.7969 9.37497 42.1973 9.4238 42.3731 9.52146Z" />--%>
<%--                                    <path--%>
<%--                                        d="M18.5644 11.7676C17.3046 12.0019 16.1718 12.5097 15.0585 13.3496C14.2187 13.9941 13.9941 14.3457 14.1601 14.7461C14.3847 15.2832 15.1073 15.3027 15.537 14.7851C15.83 14.4238 17.1484 13.6621 17.9101 13.4179C18.9452 13.0859 20.3515 13.0078 21.3866 13.2226C22.3046 13.4179 23.5155 14.0039 24.2089 14.5996C24.5019 14.8535 24.8437 15.0976 24.9706 15.1465C25.4101 15.3125 25.8788 14.9511 25.8788 14.4629C25.8788 13.9551 24.2773 12.7246 22.9296 12.207C21.5233 11.6601 19.9999 11.5136 18.5644 11.7676Z" />--%>
<%--                                    <path--%>
<%--                                        d="M19.1602 15.8301C18.1738 16.0254 16.9922 16.8652 16.9922 17.373C16.9922 17.7051 17.3535 18.0664 17.6855 18.0664C17.8223 18.0664 18.0859 17.9492 18.2715 17.8125C19.375 16.9727 20.6055 16.9727 21.7187 17.8223C22.1094 18.1152 22.4902 18.1348 22.7539 17.8711C23.3691 17.2559 22.4707 16.2695 20.9277 15.8691C20.3223 15.7129 19.8145 15.6934 19.1602 15.8301Z" />--%>
<%--                                    </svg>--%>
<%--                                    Car Parking--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-3 col-sm-4 col-6 nav-item" role="presentation">--%>
<%--                                <button class="nav-link feature-items" id="pills-locker-tab" data-bs-toggle="tab"--%>
<%--                                        data-bs-target="#pills-locker" type="button" role="tab"--%>
<%--                                        aria-controls="pills-locker-tab" aria-selected="true">--%>

<%--                                    <svg width="50" height="50" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M1.9043 0.156254C1.36719 0.341801 0.839844 0.800785 0.507813 1.34766L0.244141 1.80664V20.0195V38.2324L0.458984 38.623C0.703125 39.082 1.18164 39.5508 1.66016 39.8047C1.98242 39.9805 2.36328 39.9902 7.98828 40.0195L13.9648 40.0488L14.209 39.8047C14.502 39.5117 14.5215 39.1699 14.2676 38.8574L14.082 38.623L8.16406 38.5742L2.24609 38.5254L1.98242 38.252L1.70898 37.9883L1.67969 29.3945L1.66016 20.8008H10.5469H19.4336V29.6875V38.5742H18.2129C17.5195 38.5742 16.8945 38.623 16.7578 38.6816C16.2598 38.9063 16.2207 39.6875 16.6895 39.9316C16.8164 40.0098 18.9746 40.0391 23.3301 40.0391H29.7754L29.8047 44.1113C29.834 48.0859 29.8438 48.2031 30.0488 48.584C30.293 49.043 30.7715 49.5117 31.25 49.7656C31.5723 49.9414 31.9824 49.9512 39.7949 49.9512H47.9981L48.3887 49.7363C48.9063 49.4629 49.3555 48.9746 49.5996 48.4375C49.7949 48.0176 49.8047 47.8125 49.8047 42.7637C49.8047 36.8457 49.8145 36.9141 49.0723 36.1816C48.8477 35.957 48.4668 35.6934 48.2227 35.5957L47.7734 35.4297L47.7344 33.1152C47.6953 31.0547 47.666 30.7422 47.4707 30.127C46.7676 27.9395 45.1953 26.1523 43.1641 25.2148C42.334 24.8242 41.2695 24.5117 40.8008 24.5117C40.1856 24.5117 40.2344 25.4785 40.2344 13.291C40.2344 0.72266 40.293 1.61133 39.4531 0.781254C38.6133 -0.0683556 40.3516 3.8147e-06 20.1758 0.00976944C4.91211 0.00976944 2.23633 0.0390663 1.9043 0.156254ZM19.4531 3.03711C19.4824 4.55079 19.4922 4.60938 19.7168 4.79493C20.0098 5.03907 20.459 5.0293 20.7031 4.78516C20.8789 4.60938 20.8984 4.46289 20.8984 3.02735V1.46485H29.3945C36.8066 1.46485 37.9395 1.48438 38.1836 1.61133C38.7988 1.92383 38.7695 1.50391 38.7695 10.8398V19.3359L29.8633 19.3164L20.9473 19.2871L20.918 13.3594L20.8984 7.43164L20.6445 7.23633C20.3027 6.97266 20.0879 6.98243 19.7559 7.26563L19.4824 7.5L19.4531 13.418L19.4336 19.3359H10.5469H1.66016V10.8398C1.66016 3.4375 1.67969 2.29493 1.80664 2.05079C2.11914 1.44532 1.67969 1.47461 10.957 1.46485H19.4141L19.4531 3.03711ZM38.7695 22.6367V24.4727L38.0176 24.6484C35.459 25.2344 33.2715 27.1387 32.334 29.5703C31.9141 30.6738 31.8359 31.2695 31.8359 33.4473V35.4199L31.377 35.5957C30.4199 35.9668 29.7852 36.9434 29.7852 38.0566V38.5742H25.3418H20.8984V29.6875V20.8008H29.834H38.7695V22.6367ZM41.6797 26.1816C42.9688 26.582 44.3945 27.6074 45.127 28.6816C46.0938 30.0781 46.2891 30.8887 46.2891 33.4766V35.459L45.7813 35.4297L45.2637 35.4004L45.2148 33.3008C45.166 31.6211 45.127 31.1035 44.9805 30.7129C44.4922 29.3457 43.4863 28.1934 42.2656 27.5977C41.5234 27.2266 40.4688 26.9531 39.7949 26.9531C39.1211 26.9531 38.0664 27.2266 37.3242 27.5977C36.1035 28.1934 35.0977 29.3457 34.6094 30.7129C34.4629 31.1035 34.4238 31.6211 34.375 33.3008L34.3262 35.4004L33.8184 35.4297L33.3008 35.459V33.4766C33.3008 31.1914 33.3789 30.7715 34.0039 29.4922C34.707 28.0469 36.2402 26.7188 37.7832 26.2207C38.9648 25.8398 40.4883 25.8203 41.6797 26.1816ZM41.582 28.8672C42.3145 29.2285 43.0176 29.9512 43.3887 30.7324L43.7012 31.3965L43.7305 33.418L43.7598 35.4492H39.7949H35.8301L35.8594 33.418L35.8887 31.3965L36.2012 30.7324C36.582 29.9414 37.2852 29.2188 38.0273 28.8672C38.3203 28.7305 38.6133 28.6133 38.6621 28.6133C38.7402 28.6133 38.7695 29.3066 38.7695 30.752C38.7695 32.7637 38.7793 32.9004 38.9746 33.1445C39.2285 33.4668 39.6875 33.4863 40.0098 33.1836C40.2344 32.9785 40.2344 32.9492 40.2344 30.7324V28.4863L40.6543 28.5547C40.8789 28.5938 41.2988 28.7305 41.582 28.8672ZM47.9102 37.0898C48.0273 37.1777 48.1738 37.3535 48.2324 37.4707C48.3106 37.6172 48.3398 39.2188 48.3398 42.7637V47.8516L48.0566 48.1641L47.7734 48.4863H39.8047H31.8359L31.5723 48.2129L31.2988 47.9492L31.2695 42.8906C31.2598 40.1172 31.2695 37.7539 31.2891 37.6367C31.3184 37.5293 31.4648 37.3145 31.6016 37.1777L31.8652 36.9141H39.7852C47.1387 36.9141 47.7246 36.9336 47.9102 37.0898Z" />--%>
<%--                                    <path--%>
<%--                                        d="M5.22464 10.1855C3.61331 10.7227 2.55863 12.0508 2.46097 13.6719C2.25589 17.2754 6.53324 19.2285 9.06253 16.6797C9.668 16.0742 10.0391 15.3516 10.1758 14.5215C10.4493 12.8906 9.53128 11.1523 8.01761 10.4297C7.47074 10.166 7.24613 10.1172 6.49417 10.0879C5.9473 10.0684 5.46878 10.1074 5.22464 10.1855ZM7.40238 11.7773C9.39456 12.7734 9.12113 15.6445 6.97269 16.2695C4.68753 16.9336 2.92972 14.1504 4.51175 12.3633C5.27347 11.4941 6.38675 11.2695 7.40238 11.7773Z" />--%>
<%--                                    <path--%>
<%--                                        d="M5.22461 13.5254C5.08789 13.6523 4.98047 13.877 4.98047 14.0137C4.98047 14.1504 5.08789 14.375 5.22461 14.502C5.43945 14.7266 5.53711 14.7461 6.29883 14.7461C7.26563 14.7461 7.51953 14.5996 7.51953 14.0234C7.51953 13.4766 7.17773 13.2812 6.23047 13.2812C5.54688 13.2812 5.42969 13.3105 5.22461 13.5254Z" />--%>
<%--                                    <path--%>
<%--                                        d="M24.6582 10.1855C23.0469 10.7227 21.9922 12.0508 21.8946 13.6719C21.6895 17.2754 25.9668 19.2285 28.4961 16.6797C29.1016 16.0742 29.4727 15.3516 29.6094 14.5215C29.8828 12.8906 28.9649 11.1523 27.4512 10.4297C26.9043 10.166 26.6797 10.1172 25.9278 10.0879C25.3809 10.0684 24.9024 10.1074 24.6582 10.1855ZM26.836 11.7773C28.8282 12.7734 28.5547 15.6445 26.4063 16.2695C24.1211 16.9336 22.3633 14.1504 23.9453 12.3633C24.7071 11.4941 25.8203 11.2695 26.836 11.7773Z" />--%>
<%--                                    <path--%>
<%--                                        d="M24.6582 13.5254C24.5215 13.6523 24.4141 13.877 24.4141 14.0137C24.4141 14.1504 24.5215 14.375 24.6582 14.502C24.873 14.7266 24.9707 14.7461 25.7324 14.7461C26.6992 14.7461 26.9531 14.5996 26.9531 14.0234C26.9531 13.4766 26.6113 13.2812 25.6641 13.2812C24.9805 13.2812 24.8633 13.3105 24.6582 13.5254Z" />--%>
<%--                                    <path--%>
<%--                                        d="M24.8047 29.5312C23.6719 29.8438 22.7441 30.6055 22.2461 31.6211C21.9434 32.2363 21.9238 32.3438 21.9238 33.3008C21.9238 34.2676 21.9434 34.375 22.2461 34.9805C22.6465 35.8008 23.4961 36.6113 24.2871 36.9238C24.7363 37.1094 25.0488 37.1484 25.791 37.1582C26.6699 37.1582 26.7578 37.1387 27.4609 36.7871C29.7852 35.6445 30.3711 32.6855 28.6719 30.7129C27.793 29.6777 26.1133 29.1699 24.8047 29.5312ZM26.7969 31.1035C28.0469 31.6992 28.5547 33.252 27.8906 34.4531C27.2559 35.6055 25.9082 36.0547 24.7559 35.5078C22.7832 34.5801 22.9102 31.7578 24.9609 30.9961C25.4297 30.8203 26.3086 30.8789 26.7969 31.1035Z" />--%>
<%--                                    <path--%>
<%--                                        d="M24.6094 32.9297C24.1992 33.3789 24.4824 34.0137 25.1563 34.1406C25.6738 34.2383 26.5527 34.1211 26.7676 33.9258C27.0117 33.7012 27.0215 33.0957 26.7773 32.8809C26.6406 32.7539 26.3965 32.7148 25.7031 32.7148C24.9121 32.7148 24.7852 32.7344 24.6094 32.9297Z" />--%>
<%--                                    <path--%>
<%--                                        d="M39.1992 37.9883C38.2031 38.1934 37.2168 38.9844 36.7871 39.9219C36.6211 40.2832 36.5723 40.5664 36.5723 41.2598C36.5723 42.3437 36.7676 42.8223 37.5488 43.6426L38.0859 44.209V44.9316C38.0859 45.7715 38.2031 46.0449 38.6719 46.3672C38.9844 46.5723 39.1016 46.5918 39.9609 46.5625C40.8496 46.5332 40.918 46.5137 41.2012 46.25C41.5625 45.9082 41.6992 45.4687 41.6992 44.6973C41.6992 44.1504 41.7188 44.1016 42.1289 43.7012C42.373 43.4668 42.6855 43.0469 42.8418 42.7637C43.0859 42.2852 43.1152 42.1387 43.1152 41.2598C43.1152 40.3906 43.0859 40.2344 42.8516 39.7852C42.5098 39.1406 41.6406 38.3496 41.0449 38.1445C40.4492 37.9395 39.707 37.8809 39.1992 37.9883ZM40.3613 39.4629C40.8203 39.5898 41.3965 40.0781 41.5625 40.498C41.6406 40.6738 41.6992 41.0156 41.6992 41.2598C41.6992 41.5039 41.6406 41.8457 41.5625 42.0215C41.4453 42.3047 41.2793 42.4707 40.459 43.1641C40.2539 43.3301 40.2344 43.4277 40.2344 44.2285V45.1172H39.9023H39.5703L39.5312 44.2285C39.502 43.2617 39.5703 43.3789 38.6719 42.6855C37.5586 41.8359 37.8809 39.9805 39.2285 39.502C39.6875 39.3359 39.8828 39.3262 40.3613 39.4629Z" />--%>
<%--                                    <path--%>
<%--                                        d="M5.37109 29.5312C4.23828 29.8438 3.31055 30.6055 2.8125 31.6211C2.50977 32.2363 2.49023 32.3438 2.49023 33.3008C2.49023 34.2676 2.50977 34.375 2.8125 34.9805C3.21289 35.8008 4.0625 36.6113 4.85352 36.9238C5.30273 37.1094 5.61523 37.1484 6.35742 37.1582C7.23633 37.1582 7.32422 37.1387 8.02734 36.7871C10.3516 35.6445 10.9375 32.6855 9.23828 30.7129C8.35938 29.6777 6.67969 29.1699 5.37109 29.5312ZM7.36328 31.1035C8.61328 31.6992 9.12109 33.252 8.45703 34.4531C7.82227 35.6055 6.47461 36.0547 5.32227 35.5078C3.34961 34.5801 3.47656 31.7578 5.52734 30.9961C5.99609 30.8203 6.875 30.8789 7.36328 31.1035Z" />--%>
<%--                                    <path--%>
<%--                                        d="M5.17579 32.9297C4.76563 33.3789 5.04883 34.0137 5.72266 34.1406C6.24024 34.2383 7.11914 34.1211 7.33399 33.9258C7.57813 33.7012 7.58789 33.0957 7.34375 32.8809C7.20704 32.7539 6.96289 32.7148 6.26954 32.7148C5.47852 32.7148 5.35157 32.7344 5.17579 32.9297Z" />--%>
<%--                                    </svg>--%>
<%--                                    Locker--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="col-md-3 col-sm-4 col-6 nav-item" role="presentation">--%>
<%--                                <button class="nav-link feature-items" id="pills-transport-tab" data-bs-toggle="tab"--%>
<%--                                        data-bs-target="#pills-transport" type="button" role="tab"--%>
<%--                                        aria-controls="pills-transport-tab" aria-selected="false">--%>

<%--                                    <svg width="50" height="50" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <g clip-path="url(#clip0_2_10678)">--%>
<%--                                    <path--%>
<%--                                        d="M14.2969 0.107399C13.7695 0.253883 13.0567 0.810524 12.7734 1.26951C12.4707 1.75779 12.3047 2.53904 12.3047 3.48631V4.08201L10.625 4.12107C9.02345 4.15037 8.90626 4.1699 8.34962 4.42381C7.57813 4.78513 6.82618 5.53709 6.48438 6.28904C6.23048 6.84568 6.20118 6.99216 6.17188 8.41795L6.13282 9.95115L3.51563 9.98045C1.04493 10.0097 0.878915 10.0195 0.615243 10.2148C-0.00975665 10.6738 8.96752e-06 10.5957 8.96752e-06 15.8691C8.96752e-06 21.1426 -0.00975665 21.0644 0.615243 21.5234C0.859384 21.709 1.03517 21.7285 2.19727 21.7285C3.35938 21.7285 3.53517 21.709 3.77931 21.5234C4.40431 21.0644 4.39454 21.123 4.39454 16.0351V11.4258H5.27345H6.15235V14.5508V17.6855L6.39649 17.9199C6.69923 18.2324 7.07032 18.2324 7.37306 17.9199L7.6172 17.6855V12.5781C7.6172 9.14061 7.65626 7.34373 7.72462 7.08006C7.8711 6.55271 8.61329 5.82029 9.1504 5.67381C9.4336 5.59568 13.916 5.56638 25.2246 5.58591L40.8984 5.61521L41.3184 5.90818C41.5527 6.0742 41.875 6.39646 42.041 6.63084L42.334 7.05076L42.3633 20.957L42.3828 34.8633H39.7949C37.0215 34.8633 36.7871 34.9023 36.3574 35.3613C36.1328 35.6152 34.4727 39.4043 34.4727 39.6777C34.4727 39.9707 34.707 40.3418 34.9707 40.4883C35.1953 40.5957 35.918 40.625 38.8184 40.625H42.3828V41.2695C42.3828 41.6308 42.3242 42.0996 42.2656 42.3242C42.1094 42.8515 41.3867 43.5742 40.8594 43.7304C40.3223 43.8867 9.71681 43.9062 9.1504 43.7402C8.63282 43.6035 7.86134 42.832 7.72462 42.334C7.66602 42.1191 7.6172 41.6504 7.6172 41.2793V40.625H11.2109C14.5899 40.625 14.8145 40.6152 15.1074 40.4297C15.6934 40.0781 15.6641 39.8144 14.6973 37.5781C14.2285 36.4844 13.75 35.4883 13.6426 35.3613C13.2129 34.9023 12.9785 34.8633 10.2051 34.8633H7.6172V27.7441C7.6172 20.6933 7.6172 20.625 7.41212 20.3711C7.13868 20.0195 6.63087 20.0195 6.35743 20.3808L6.15235 20.6347L6.17188 31.582L6.20118 42.5293L6.47462 43.1152C6.83595 43.8769 7.5879 44.6387 8.31056 44.9707L8.88673 45.2246V46.582C8.88673 47.9199 8.88673 47.9394 9.19923 48.5449C9.55079 49.2187 10.166 49.7168 10.8496 49.9023C11.1035 49.9707 12.3242 50 14.2383 49.9804C17.1192 49.9512 17.2559 49.9414 17.6367 49.7363C18.2031 49.4336 18.6426 48.9648 18.9063 48.3887C19.1113 47.959 19.1406 47.7539 19.1406 46.6015V45.3125H25H30.8594V46.6211C30.8594 47.9101 30.8692 47.9394 31.1817 48.5449C31.5234 49.2187 32.1387 49.7168 32.8223 49.9023C33.0762 49.9707 34.2969 50 36.2109 49.9804C39.0918 49.9512 39.2285 49.9414 39.6094 49.7363C40.1758 49.4336 40.6152 48.9648 40.8789 48.3887C41.084 47.9492 41.1133 47.7539 41.1133 46.5625V45.2246L41.6895 44.9707C42.4121 44.6387 43.1641 43.8769 43.5254 43.1152L43.7988 42.5293L43.8281 26.9726L43.8477 11.4258H44.7266H45.6055V16.0351C45.6055 21.123 45.5957 21.0644 46.2207 21.5234C46.4649 21.709 46.6406 21.7285 47.8027 21.7285C48.9649 21.7285 49.1406 21.709 49.3848 21.5234C50.0098 21.0644 50 21.1426 50 15.8691C50 10.5957 50.0098 10.6738 49.3848 10.2148C49.1211 10.0195 48.9551 10.0097 46.4844 9.98045L43.8672 9.95115L43.8281 8.41795C43.7988 6.93357 43.7891 6.86521 43.4961 6.24998C43.1055 5.43943 42.5 4.83396 41.6992 4.4531C41.0742 4.16013 41.0254 4.15037 39.3945 4.12107L37.7246 4.08201L37.666 3.06638C37.5781 1.57224 37.1875 0.839821 36.1914 0.312477L35.6934 0.0488052L25.1465 0.029274C18.9844 0.0195084 14.4727 0.0488052 14.2969 0.107399ZM35.5078 1.62107C35.9961 1.85545 36.1621 2.24607 36.2109 3.24216L36.25 4.10154H25H13.75L13.7891 3.24216C13.8379 2.25584 14.0039 1.85545 14.4727 1.63084C14.7656 1.48435 15.7715 1.46482 24.9805 1.46482C34.2188 1.46482 35.2051 1.48435 35.5078 1.62107ZM2.9297 15.8691V20.3125H2.19727H1.46485V15.8691V11.4258H2.19727H2.9297V15.8691ZM48.5352 15.8691V20.3125H47.8027H47.0703V15.8691V11.4258H47.8027H48.5352V15.8691ZM13.0371 37.4219C13.291 38.0273 13.5645 38.6719 13.6426 38.8379L13.7695 39.1601H10.6934H7.6172V37.7441V36.3281H10.0879H12.5684L13.0371 37.4219ZM42.3828 37.7441V39.1601H39.3066H36.2305L36.3574 38.8379C36.4356 38.6719 36.709 38.0273 36.9629 37.4219L37.4316 36.3281H39.9121H42.3828V37.7441ZM17.6758 46.5332V47.7539L17.3438 48.125L17.0117 48.4863H14.0137H11.0156L10.6836 48.125L10.3516 47.7539V46.5332V45.3125H14.0137H17.6758V46.5332ZM39.6484 46.5332V47.7539L39.3164 48.125L38.9844 48.4863H35.9863H32.9883L32.6563 48.125L32.3242 47.7539V46.5332V45.3125H35.9863H39.6484V46.5332Z" />--%>
<%--                                    <path--%>
<%--                                        d="M12.6171 7.22656C12.1582 7.65625 12.4707 8.49609 13.0859 8.49609C13.457 8.49609 13.7695 8.16406 13.7695 7.76367C13.7695 7.36328 13.457 7.03125 13.0859 7.03125C12.9492 7.03125 12.7343 7.11914 12.6171 7.22656Z" />--%>
<%--                                    <path--%>
<%--                                        d="M16.7578 7.23633C16.5723 7.38281 16.5039 7.5293 16.5039 7.76367C16.5039 7.99805 16.5723 8.14453 16.7578 8.29102C17.0215 8.49609 17.0703 8.49609 25 8.49609C32.9297 8.49609 32.9785 8.49609 33.2422 8.29102C33.5938 8.01758 33.5938 7.50977 33.2422 7.23633C32.9785 7.03125 32.9297 7.03125 25 7.03125C17.0703 7.03125 17.0215 7.03125 16.7578 7.23633Z" />--%>
<%--                                    <path--%>
<%--                                        d="M36.4453 7.22654C36.1523 7.49997 36.1523 8.02732 36.4453 8.30076C36.9043 8.72068 37.5977 8.39841 37.5977 7.76365C37.5977 7.36326 37.2852 7.03122 36.9141 7.03122C36.7773 7.03122 36.5625 7.11911 36.4453 7.22654Z" />--%>
<%--                                    <path--%>
<%--                                        d="M10.0586 10.1465C9.87305 10.2441 9.58984 10.4883 9.42383 10.6836L9.13086 11.0547L9.10156 19.5117C9.0918 24.1699 9.10156 28.125 9.13086 28.3008C9.19922 28.6914 9.70703 29.2871 10.127 29.4531C10.3906 29.5703 12.998 29.5898 25.0195 29.5898C39.0332 29.5898 39.6191 29.5801 39.9414 29.4043C40.127 29.3066 40.4102 29.0625 40.5762 28.8672L40.8691 28.4961V19.7754V11.0547L40.5762 10.6836C40.4102 10.4883 40.127 10.2441 39.9414 10.1465C39.6191 9.9707 39.0332 9.96094 25 9.96094C10.9668 9.96094 10.3809 9.9707 10.0586 10.1465ZM39.4043 19.7754V28.0762H25H10.5957L10.5664 19.873C10.5566 15.3613 10.5664 11.6113 10.5957 11.543C10.625 11.4453 13.5645 11.4258 25.0195 11.4453L39.4043 11.4746V19.7754Z" />--%>
<%--                                    <path--%>
<%--                                        d="M16.5919 32.7441C16.1817 33.0176 15.8985 33.5449 15.9571 33.9355C15.9962 34.2285 18.3692 39.707 18.6232 40.1074C18.9649 40.625 18.9649 40.625 25.0001 40.625C31.0353 40.625 31.0353 40.625 31.3771 40.1074C31.631 39.707 34.004 34.2285 34.0431 33.9355C34.1017 33.5449 33.8185 33.0176 33.4083 32.7441C33.0958 32.5293 32.9884 32.5195 31.2306 32.5195C29.4044 32.5195 29.3849 32.5195 29.1505 32.7637C28.8575 33.0469 28.838 33.3887 29.0919 33.7012C29.2677 33.9258 29.3458 33.9355 30.879 33.9844L32.4903 34.0332L31.3575 36.5918L30.2345 39.1602H25.0001H19.7755L18.6427 36.5918L17.5099 34.0332L22.0411 33.9844L26.5821 33.9355L26.7677 33.7012C27.0216 33.3887 27.0021 33.0469 26.7091 32.7637L26.4747 32.5195H21.6993H16.9239L16.5919 32.7441Z" />--%>
<%--                                    <path--%>
<%--                                        d="M21.1523 36.0449C20.9668 36.1914 20.8984 36.3379 20.8984 36.5723C20.8984 36.8066 20.9668 36.9531 21.1523 37.0996C21.4062 37.2949 21.5234 37.3047 25 37.3047C28.4766 37.3047 28.5938 37.2949 28.8477 37.0996C29.0332 36.9531 29.1016 36.8066 29.1016 36.5723C29.1016 36.3379 29.0332 36.1914 28.8477 36.0449C28.5938 35.8496 28.4766 35.8398 25 35.8398C21.5234 35.8398 21.4062 35.8496 21.1523 36.0449Z" />--%>
<%--                                    </g>--%>
<%--                                    </svg>--%>
<%--                                    Transport--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class=" col-xl-6 px-0">--%>
<%--                    <div class="tab-content" id="pills-tabContent">--%>
<%--                        <div class="tab-pane fade show active" id="pills-restaurant" role="tabpanel"--%>
<%--                             aria-labelledby="pills-restaurant-tab">--%>
<%--                            <div class="swiper feature-slider">--%>
<%--                                <div class="swiper-wrapper">--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Restaurant001.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Restaurant002.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Restaurant003.png" alt=""></div>--%>
<%--                                </div>--%>
<%--                                <div class="swiper-pagination"></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="tab-pane fade" id="pills-parking" role="tabpanel"--%>
<%--                             aria-labelledby="pills-parking-tab">--%>
<%--                            <div class="swiper feature-slider">--%>
<%--                                <div class="swiper-wrapper">--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Car-Parking001.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Car-Parking002.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Car-Parking003.png" alt=""></div>--%>
<%--                                </div>--%>
<%--                                <div class="swiper-pagination"></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="tab-pane fade" id="pills-gym" role="tabpanel" aria-labelledby="pills-gym-tab">--%>
<%--                            <div class="swiper feature-slider">--%>
<%--                                <div class="swiper-wrapper">--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Gym001.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Gym002.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Gym003.png" alt=""></div>--%>
<%--                                </div>--%>
<%--                                <div class="swiper-pagination"></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="tab-pane fade" id="pills-spa" role="tabpanel" aria-labelledby="pills-spa-tab">--%>
<%--                            <div class="swiper feature-slider">--%>
<%--                                <div class="swiper-wrapper">--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Spa001.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Spa002.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Spa003.png" alt=""></div>--%>
<%--                                </div>--%>
<%--                                <div class="swiper-pagination"></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="tab-pane fade" id="pills-gaming" role="tabpanel"--%>
<%--                             aria-labelledby="pills-gamming-tab">--%>
<%--                            <div class="swiper feature-slider">--%>
<%--                                <div class="swiper-wrapper">--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Gaming001.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Gaming002.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Gaming003.png" alt=""></div>--%>
<%--                                </div>--%>
<%--                                <div class="swiper-pagination"></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="tab-pane fade" id="pills-transport" role="tabpanel"--%>
<%--                             aria-labelledby="pills-transport-tab">--%>
<%--                            <div class="swiper feature-slider">--%>
<%--                                <div class="swiper-wrapper">--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Transport001.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Transport002.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Transport003.png" alt=""></div>--%>
<%--                                </div>--%>
<%--                                <div class="swiper-pagination"></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="tab-pane fade" id="pills-pool" role="tabpanel" aria-labelledby="pills-pool-tab">--%>
<%--                            <div class="swiper feature-slider">--%>
<%--                                <div class="swiper-wrapper">--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Pool001.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Pool002.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Pool003.png" alt=""></div>--%>
<%--                                </div>--%>
<%--                                <div class="swiper-pagination"></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="tab-pane fade" id="pills-locker" role="tabpanel" aria-labelledby="pills-locker-tab">--%>
<%--                            <div class="swiper feature-slider">--%>
<%--                                <div class="swiper-wrapper">--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Locker001.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Locker002.png" alt=""></div>--%>
<%--                                    <div class="swiper-slide"><img class="img-fluid"--%>
<%--                                                                   src="${pageContext.request.contextPath}/guest/assets/images/bg/Locker003.png" alt=""></div>--%>
<%--                                </div>--%>
<%--                                <div class="swiper-pagination"></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!-- ========== Home1 Feature end============= -->

    <!-- ========== Home1 Offers start============= -->
<%--    <div class="home-one-offers mb-120">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-12">--%>
<%--                    <div class="section-title1 text-center">--%>
<%--                        <span>Hotel Offer</span>--%>
<%--                        <h2>Best Summer Offer</h2>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="row g-4 justify-content-center">--%>
<%--                <div class="col-lg-7">--%>
<%--                    <div class="scroll-offer">--%>
<%--                        <div class="single-offer mb-30">--%>
<%--                            <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/offer-img-1.png" alt="">--%>
<%--                            <div class="offer-card d-flex align-items-center">--%>
<%--                                <div class="offer">--%>
<%--                                    <svg width="64" height="64" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M64 27.723L61.2363 30.7235L63.3536 34.1993L60.055 36.6196L61.4815 40.4269L57.7984 42.2117L58.5283 46.2124L54.5945 47.3452L54.639 51.4122L50.5659 51.8874L49.9307 55.8992L45.8408 55.6947L44.5314 59.5462L40.5363 58.6455L38.5582 62.2041L34.7971 60.5961L32.1839 63.7237L29.0636 61.4194L26.1717 64L23.5528 61.1432L20.1985 63.0938L18.2427 59.7562L14.5429 60.9442L13.3839 57.2585L9.50583 57.5845L9.22723 53.733L5.37698 53.1749L5.9899 49.3621L2.36253 47.9586L3.81125 44.3723L0.573916 42.2283L2.74142 39.0178L0 36.277L2.76371 33.282L0.651924 29.8007L3.94498 27.3859L2.51854 23.5731L6.20164 21.7883L5.4717 17.7931L9.40554 16.6548L9.36653 12.5933L13.4341 12.1181L14.0693 8.10085L18.1592 8.3053L19.4686 4.45933L23.4637 5.36004L25.4418 1.80142L29.2029 3.4039L31.8217 0.276291L34.942 2.58608L37.8339 0L40.4472 2.86237L43.8071 0.906234L45.7573 4.24383L49.4627 3.0613L50.6161 6.74702L54.4942 6.41547L54.7728 10.267L58.623 10.8251L58.0101 14.6379L61.6375 16.0414L60.1888 19.6277L63.4261 21.7717L61.2586 24.9822L64 27.723Z" />--%>
<%--                                    </svg>--%>
<%--                                    <div class="content">--%>
<%--                                        <h4>50%</h4>--%>
<%--                                        <span>OFF</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="day">--%>
<%--                                    <span>01 Day Left</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="content d-flex justify-content-between align-items-center">--%>
<%--                                <div class="left-content">--%>
<%--                                    <div class="price-tag">--%>
<%--                                        <span>$350</span> / Per Night--%>
<%--                                    </div>--%>
<%--                                    <h3><a href="room-suits-details.html">Double Room</a></h3>--%>
<%--                                    <ul class="stars d-flex align-items-center">--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="book-btn">--%>
<%--                                    <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="single-offer mb-30">--%>
<%--                            <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/offer-img-2.png" alt="">--%>
<%--                            <div class="offer-card d-flex align-items-center">--%>
<%--                                <div class="offer">--%>
<%--                                    <svg width="64" height="64" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M64 27.723L61.2363 30.7235L63.3536 34.1993L60.055 36.6196L61.4815 40.4269L57.7984 42.2117L58.5283 46.2124L54.5945 47.3452L54.639 51.4122L50.5659 51.8874L49.9307 55.8992L45.8408 55.6947L44.5314 59.5462L40.5363 58.6455L38.5582 62.2041L34.7971 60.5961L32.1839 63.7237L29.0636 61.4194L26.1717 64L23.5528 61.1432L20.1985 63.0938L18.2427 59.7562L14.5429 60.9442L13.3839 57.2585L9.50583 57.5845L9.22723 53.733L5.37698 53.1749L5.9899 49.3621L2.36253 47.9586L3.81125 44.3723L0.573916 42.2283L2.74142 39.0178L0 36.277L2.76371 33.282L0.651924 29.8007L3.94498 27.3859L2.51854 23.5731L6.20164 21.7883L5.4717 17.7931L9.40554 16.6548L9.36653 12.5933L13.4341 12.1181L14.0693 8.10085L18.1592 8.3053L19.4686 4.45933L23.4637 5.36004L25.4418 1.80142L29.2029 3.4039L31.8217 0.276291L34.942 2.58608L37.8339 0L40.4472 2.86237L43.8071 0.906234L45.7573 4.24383L49.4627 3.0613L50.6161 6.74702L54.4942 6.41547L54.7728 10.267L58.623 10.8251L58.0101 14.6379L61.6375 16.0414L60.1888 19.6277L63.4261 21.7717L61.2586 24.9822L64 27.723Z" />--%>
<%--                                    </svg>--%>
<%--                                    <div class="content">--%>
<%--                                        <h4>30%</h4>--%>
<%--                                        <span>OFF</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="day">--%>
<%--                                    <span>01 Day Left</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="content d-flex justify-content-between align-items-center">--%>
<%--                                <div class="left-content">--%>
<%--                                    <div class="price-tag">--%>
<%--                                        <span>$550</span> / Per Night--%>
<%--                                    </div>--%>
<%--                                    <h3><a href="room-suits-details.html">Family Room</a></h3>--%>
<%--                                    <ul class="stars d-flex align-items-center">--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="book-btn">--%>
<%--                                    <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="single-offer mb-30">--%>
<%--                            <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/offer-img-3.png" alt="">--%>
<%--                            <div class="offer-card d-flex align-items-center">--%>
<%--                                <div class="offer">--%>
<%--                                    <svg width="64" height="64" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M64 27.723L61.2363 30.7235L63.3536 34.1993L60.055 36.6196L61.4815 40.4269L57.7984 42.2117L58.5283 46.2124L54.5945 47.3452L54.639 51.4122L50.5659 51.8874L49.9307 55.8992L45.8408 55.6947L44.5314 59.5462L40.5363 58.6455L38.5582 62.2041L34.7971 60.5961L32.1839 63.7237L29.0636 61.4194L26.1717 64L23.5528 61.1432L20.1985 63.0938L18.2427 59.7562L14.5429 60.9442L13.3839 57.2585L9.50583 57.5845L9.22723 53.733L5.37698 53.1749L5.9899 49.3621L2.36253 47.9586L3.81125 44.3723L0.573916 42.2283L2.74142 39.0178L0 36.277L2.76371 33.282L0.651924 29.8007L3.94498 27.3859L2.51854 23.5731L6.20164 21.7883L5.4717 17.7931L9.40554 16.6548L9.36653 12.5933L13.4341 12.1181L14.0693 8.10085L18.1592 8.3053L19.4686 4.45933L23.4637 5.36004L25.4418 1.80142L29.2029 3.4039L31.8217 0.276291L34.942 2.58608L37.8339 0L40.4472 2.86237L43.8071 0.906234L45.7573 4.24383L49.4627 3.0613L50.6161 6.74702L54.4942 6.41547L54.7728 10.267L58.623 10.8251L58.0101 14.6379L61.6375 16.0414L60.1888 19.6277L63.4261 21.7717L61.2586 24.9822L64 27.723Z" />--%>
<%--                                    </svg>--%>
<%--                                    <div class="content">--%>
<%--                                        <h4>20%</h4>--%>
<%--                                        <span>OFF</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="day">--%>
<%--                                    <span>01 Day Left</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="content d-flex justify-content-between align-items-center">--%>
<%--                                <div class="left-content">--%>
<%--                                    <div class="price-tag">--%>
<%--                                        <span>$380</span> / Per Night--%>
<%--                                    </div>--%>
<%--                                    <h3><a href="room-suits-details.html">Deluxe Room</a></h3>--%>
<%--                                    <ul class="stars d-flex align-items-center">--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="book-btn">--%>
<%--                                    <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="single-offer mb-30">--%>
<%--                            <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/offer-img-1.png" alt="">--%>
<%--                            <div class="offer-card d-flex align-items-center">--%>
<%--                                <div class="offer">--%>
<%--                                    <svg width="64" height="64" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                    <path--%>
<%--                                        d="M64 27.723L61.2363 30.7235L63.3536 34.1993L60.055 36.6196L61.4815 40.4269L57.7984 42.2117L58.5283 46.2124L54.5945 47.3452L54.639 51.4122L50.5659 51.8874L49.9307 55.8992L45.8408 55.6947L44.5314 59.5462L40.5363 58.6455L38.5582 62.2041L34.7971 60.5961L32.1839 63.7237L29.0636 61.4194L26.1717 64L23.5528 61.1432L20.1985 63.0938L18.2427 59.7562L14.5429 60.9442L13.3839 57.2585L9.50583 57.5845L9.22723 53.733L5.37698 53.1749L5.9899 49.3621L2.36253 47.9586L3.81125 44.3723L0.573916 42.2283L2.74142 39.0178L0 36.277L2.76371 33.282L0.651924 29.8007L3.94498 27.3859L2.51854 23.5731L6.20164 21.7883L5.4717 17.7931L9.40554 16.6548L9.36653 12.5933L13.4341 12.1181L14.0693 8.10085L18.1592 8.3053L19.4686 4.45933L23.4637 5.36004L25.4418 1.80142L29.2029 3.4039L31.8217 0.276291L34.942 2.58608L37.8339 0L40.4472 2.86237L43.8071 0.906234L45.7573 4.24383L49.4627 3.0613L50.6161 6.74702L54.4942 6.41547L54.7728 10.267L58.623 10.8251L58.0101 14.6379L61.6375 16.0414L60.1888 19.6277L63.4261 21.7717L61.2586 24.9822L64 27.723Z" />--%>
<%--                                    </svg>--%>
<%--                                    <div class="content">--%>
<%--                                        <h4>50%</h4>--%>
<%--                                        <span>OFF</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="day">--%>
<%--                                    <span>01 Day Left</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="content d-flex justify-content-between align-items-center">--%>
<%--                                <div class="left-content">--%>
<%--                                    <div class="price-tag">--%>
<%--                                        <span>$350</span> / Per Night--%>
<%--                                    </div>--%>
<%--                                    <h3><a href="room-suits-details.html">Double Room</a></h3>--%>
<%--                                    <ul class="stars d-flex align-items-center">--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                        <li><i class="bi bi-star-fill"></i></li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="book-btn">--%>
<%--                                    <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-5 col-md-9">--%>
<%--                    <div class="single-offer2 mb-30">--%>
<%--                        <div class="offer-img">--%>
<%--                            <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/offer-img-21.png" alt="">--%>
<%--                        </div>--%>
<%--                        <div class="offer-batch">--%>
<%--                            <div class="offer">--%>
<%--                                <img src="${pageContext.request.contextPath}/guest/assets/images/icons/offer-bg.svg" alt="">--%>
<%--                                <div class="content">--%>
<%--                                    <h4>50%</h4>--%>
<%--                                    <span>OFF</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="background"></div>--%>
<%--                        <div class="offer-content">--%>
<%--                            <div class="price-tag">--%>
<%--                                <span>$600</span> / Per Night--%>
<%--                            </div>--%>
<%--                            <h3><a href="room-suits-details.html">Luxury Room</a></h3>--%>
<%--                            <div class="bed-and-person d-flex align-items-center">--%>
<%--                                <div class="bed-qty">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/double-bed.svg" alt=""> 2 Double Bed</p>--%>
<%--                                </div>--%>
<%--                                <div class="persons">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/persons.svg" alt="">6 Guest</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="book-btn">--%>
<%--                                <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-offer2 mb-30">--%>
<%--                        <div class="offer-img">--%>
<%--                            <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/offer-img-22.png" alt="">--%>
<%--                        </div>--%>
<%--                        <div class="offer-batch">--%>
<%--                            <div class="offer">--%>
<%--                                <img src="${pageContext.request.contextPath}/guest/assets/images/icons/offer-bg.svg" alt="">--%>
<%--                                <div class="content">--%>
<%--                                    <h4>50%</h4>--%>
<%--                                    <span>OFF</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="background"></div>--%>
<%--                        <div class="offer-content">--%>
<%--                            <div class="price-tag">--%>
<%--                                <span>$320</span> / Per Night--%>
<%--                            </div>--%>
<%--                            <h3><a href="room-suits-details.html">Luxury Room</a></h3>--%>
<%--                            <div class="bed-and-person d-flex align-items-center">--%>
<%--                                <div class="bed-qty">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/double-bed.svg" alt=""> 2 Double Bed</p>--%>
<%--                                </div>--%>
<%--                                <div class="persons">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/persons.svg" alt="">6 Guest</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="book-btn">--%>
<%--                                <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-offer2 mb-30">--%>
<%--                        <div class="offer-img">--%>
<%--                            <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/bg/offer-img-23.png" alt="">--%>
<%--                        </div>--%>
<%--                        <div class="offer-batch">--%>
<%--                            <div class="offer">--%>
<%--                                <img src="${pageContext.request.contextPath}/guest/assets/images/icons/offer-bg.svg" alt="">--%>
<%--                                <div class="content">--%>
<%--                                    <h4>50%</h4>--%>
<%--                                    <span>OFF</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="background"></div>--%>
<%--                        <div class="offer-content">--%>
<%--                            <div class="price-tag">--%>
<%--                                <span>$600</span> / Per Night--%>
<%--                            </div>--%>
<%--                            <h3><a href="room-suits-details.html">Luxury Room</a></h3>--%>
<%--                            <div class="bed-and-person d-flex align-items-center">--%>
<%--                                <div class="bed-qty">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/double-bed.svg" alt=""> 2 Double Bed</p>--%>
<%--                                </div>--%>
<%--                                <div class="persons">--%>
<%--                                    <p><img src="${pageContext.request.contextPath}/guest/assets/images/icons/persons.svg" alt="">6 Guest</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="book-btn">--%>
<%--                                <a class="btn--primary2" href="room-suits-details.html">Book Now</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="offer-banner d-flex align-items-center">--%>
<%--                        <div class="left-banner">--%>
<%--                            <span class="vector"></span>--%>
<%--                            <h5>Get 20% Off Of 1st Book!</h5>--%>
<%--                            <span>Use Coupon Code</span>--%>
<%--                            <p>BOOK-NOW-0256</p>--%>
<%--                        </div>--%>
<%--                        <div class="right-banner">--%>
<%--                            <h3>This</h3>--%>
<%--                            <h3 class="sammer">Summer</h3>--%>
<%--                            <h3 class="offer">Offer</h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!-- ========== Home1 Offers end============= -->
    <!-- ========== Home1 Testimonial Start============= -->


    <!--Footer-->
    <jsp:include page="./common/footer.jsp"></jsp:include>
        <!-- ========== Home1 Footer End============= -->







        <!-- js file link -->
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="${pageContext.request.contextPath}/guest/assets/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/slick.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/jquery.nice-select.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/odometer.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/viewport.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/main.js"></script>


</body>


<!-- Mirrored from demo.egenslab.com/html/hotelina/preview/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 21 Sep 2025 06:39:58 GMT -->

</html>