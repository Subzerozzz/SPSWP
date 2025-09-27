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
                                <h4>Đại học FPT</h4>
                                <p>Đại học FPT là một trong những trường đại học hàng đầu tại Việt Nam,
                                    được thành lập bởi Tập đoàn FPT. Trường nổi bật với môi trường học tập
                                    hiện đại, chương trình đào tạo gắn liền với thực tiễn, định hướng quốc tế
                                    và cơ hội việc làm rộng mở cho sinh viên sau khi tốt nghiệp.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="footer-items social-area">
                                <span class="dot1"></span>
                                <span class="dot2"></span>
                                <div class="footer-logo text-center">
                                    <img src="${pageContext.request.contextPath}/guest/assets/images/download_transparent.svg" alt="">
                                    <p>Đại học FPT</p>
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
                                <h4>Liện hệ</h4>
                                <div class="hotline mb-30">
                                    <div class="hotline-icon">
                                        <img src="${pageContext.request.contextPath}/guest/assets/images/icons/f-phone.svg" alt="">
                                    </div>
                                    <div class="hotline-info">
                                        <h6 class="mb-10"><a href="#">Số điện thoại</a></h6>
                                        <h6><a href="tel:+8801701111000">0xxxxxxxxx</a></h6>
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
                                                    data-cfemail="620b0c040d22071a030f120e074c010d0f">Email</span></a>
                                        </h6>
                                        <h6><a
                                                href="https://demo.egenslab.com/cdn-cgi/l/email-protection#31585f575e71424441415e43451f525e5c"><span
                                                    class="__cf_email__"
                                                    data-cfemail="0f666169604f7c7a7f7f607d7b216c6062">fptuniversity@fpt.edu.vn</span></a>
                                        </h6>
                                    </div>
                                </div>
                                <div class="email">
                                    <div class="email-icon">
                                        <img src="${pageContext.request.contextPath}/guest/assets/images/icons/f-location.svg" alt="">
                                    </div>
                                    <div class="email-info">
                                        <h6 class="mb-10"><a>Địa chỉ</a></h6>
                                        <h6><a>Trường đại học FPT Hà Nội</a></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
