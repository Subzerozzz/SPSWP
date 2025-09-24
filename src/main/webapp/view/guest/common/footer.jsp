<%-- 
    Document   : footer
    Created on : Sep 24, 2025, 4:04:42 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <footer>
            <div class="container">
                <div class="footer-top">
                    <div class="row g-4 justify-content-start">
                        <div class="col-lg-4 order-lg-0 order-2">
                            <div class="footer-items footer-about">
                                <h4>About Hotelina</h4>
                                <p>Hotel ut nisl quam nestibulum ac quamtoloka nec odio elementum oneni sceisuen thensopol
                                    aucan ligula. Orci varius natoque.</p>
                                <div class="footer-btn">
                                    <a class="popup-youtube" href="https://goo.gl/maps/QkfwNHnSian4PfAt5">Our SiteMap <i
                                            class="bi bi-chevron-right"></i></a>
                                    <a href="#">Legal Notice</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="footer-items social-area">
                                <span class="dot1"></span>
                                <span class="dot2"></span>
                                <div class="footer-logo text-center">
                                    <img src="${pageContext.request.contextPath}/guest/assets/images/footer-logo1.svg" alt="">
                                    <p>Hotelina Lifestyle</p>
                                    <span></span>
                                </div>
                                <div class="footer-social">
                                    <ul class="social-link d-flex align-items-center justify-content-center">
                                        <li><a href="https://www.facebook.com/"><i class='bx bxl-facebook'></i></a></li>
                                        <li><a href="https://twitter.com/"><i class='bx bxl-twitter'></i></a></li>
                                        <li><a href="https://www.pinterest.com/"><i class='bx bxl-pinterest-alt'></i></a>
                                        </li>
                                        <li><a href="https://www.instagram.com/"><i class='bx bxl-instagram'></i></a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 d-flex justify-content-sm-end justify-content-center">
                            <div class="footer-items contact ">
                                <h4>Contacts</h4>
                                <div class="hotline mb-30">
                                    <div class="hotline-icon">
                                        <img src="${pageContext.request.contextPath}/guest/assets/images/icons/f-phone.svg" alt="">
                                    </div>
                                    <div class="hotline-info">
                                        <h6 class="mb-10"><a href="tel:+8801701111000">+880 170 1111 000</a></h6>
                                        <h6><a href="tel:+8801701111000">+880 170 1111 000</a></h6>
                                    </div>
                                </div>
                                <div class="email mb-30">
                                    <div class="email-icon">
                                        <img src="${pageContext.request.contextPath}/guest/assets/images/icons/f-envlop.svg" alt="">
                                    </div>
                                    <div class="email-info">
                                        <h6 class="mb-10"><a
                                                href="https://demo.egenslab.com/cdn-cgi/l/email-protection#70191e161f301508111d001c155e131f1d"><span
                                                    class="__cf_email__"
                                                    data-cfemail="620b0c040d22071a030f120e074c010d0f">[email&#160;protected]</span></a>
                                        </h6>
                                        <h6><a
                                                href="https://demo.egenslab.com/cdn-cgi/l/email-protection#31585f575e71424441415e43451f525e5c"><span
                                                    class="__cf_email__"
                                                    data-cfemail="0f666169604f7c7a7f7f607d7b216c6062">[email&#160;protected]</span></a>
                                        </h6>
                                    </div>
                                </div>
                                <div class="email">
                                    <div class="email-icon">
                                        <img src="${pageContext.request.contextPath}/guest/assets/images/icons/f-location.svg" alt="">
                                    </div>
                                    <div class="email-info">
                                        <h6 class="mb-10"><a>168/170, Avenue 01, Mirpur</a></h6>
                                        <h6><a>DOHS, Bangladesh</a></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-mdl">
                    <div class="quick-menu">
                        <ul>
                            <li><a href="about.html">About Us</a></li>
                            <li><a href="room-suits1-2.html">Room & Suits</a></li>
                            <li><a href="hotel-facilities.html">Hotel Facilites</a></li>
                            <li><a href="blog-standard.html">Blog Standard</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="contact.html">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                <div class="footer-btm">
                    <div class="container">
                        <div class="row g-4">
                            <div class="col-xl-6">
                                <div class="devlopar-area">
                                    <p>Copyright 2022 <a href="#">Hotelina</a> | Design By <a
                                            href="https://www.egenslab.com/">Egens Lab</a></p>
                                </div>
                            </div>
                            <div class="col-xl-6 d-flex justify-content-xl-end justify-content-center">
                                <div class="payment-mathort">
                                    <ul>
                                        <li>Pay with us:</li>
                                        <li><a href="#"><img src="${pageContext.request.contextPath}/guest/assets/images/bg/visa.png" alt=""></a></li>
                                        <li><a href="#"><img src="${pageContext.request.contextPath}/guest/assets/images/bg/mastercard.png" alt=""></a></li>
                                        <li><a href="#"><img src="${pageContext.request.contextPath}/guest/assets/images/bg/amagonpay.png" alt=""></a></li>
                                        <li><a href="#"><img src="${pageContext.request.contextPath}/guest/assets/images/bg/paypal.png" alt=""></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
