<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Câu lạc bộ - FPT University</title>
    <link rel="icon" href="${pageContext.request.contextPath}/guest/assets/images/logoFPT3.png" type="image/gif" sizes="20x20">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/bootstrap.min.css">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/bootstrap-icons.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/style.css">

    <style>
        .clubs-section {
            padding: 80px 0;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
        }

        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-title span {
            color: #D90A2C;
            font-size: 18px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .section-title h2 {
            color: #2c3e50;
            font-size: 36px;
            font-weight: 700;
            margin-top: 10px;
        }

        .club-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            margin-bottom: 30px;
            height: 100%;
            border: none;
        }

        .club-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .club-logo {
            height: 200px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            position: relative;
        }

        .club-logo img {
            max-width: 80%;
            max-height: 80%;
            object-fit: contain;
            transition: transform 0.3s ease;
        }

        .club-card:hover .club-logo img {
            transform: scale(1.05);
        }

        .club-content {
            padding: 25px;
        }

        .club-name {
            font-size: 22px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 10px;
            line-height: 1.3;
        }

        .club-description {
            color: #6c757d;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .club-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px solid #e9ecef;
        }

        .club-date {
            color: #6c757d;
            font-size: 12px;
        }

        .club-status {
            background: #28a745;
            color: white;
            padding: 4px 12px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 600;
        }

        .view-details-btn {
            background: linear-gradient(45deg, #D90A2C, #ff6b6b);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 25px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            text-align: center;
            width: 100%;
        }

        .view-details-btn:hover {
            background: linear-gradient(45deg, #b30824, #e74c3c);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(217, 10, 44, 0.3);
        }

        .no-clubs {
            text-align: center;
            padding: 60px 20px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .no-clubs i {
            font-size: 64px;
            color: #e9ecef;
            margin-bottom: 20px;
        }

        .no-clubs h3 {
            color: #6c757d;
            margin-bottom: 10px;
        }

        @media (max-width: 768px) {
            .clubs-section {
                padding: 40px 0;
            }

            .section-title h2 {
                font-size: 28px;
            }

            .club-card {
                margin-bottom: 20px;
            }
        }
    </style>
</head>

<body>
    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Header -->
    <jsp:include page="../common/header.jsp"></jsp:include>

    <!-- Clubs Section -->
    <div class="clubs-section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <span>Câu lạc bộ FPT</span>
                        <h2>Khám phá các Câu lạc bộ</h2>
                        <p class="mt-3">Tham gia và trải nghiệm cùng các câu lạc bộ đang hoạt động tại FPT University</p>
                    </div>
                </div>
            </div>

            <!-- Clubs Grid -->
            <div class="row">
                <c:choose>
                    <c:when test="${not empty clubList}">
                        <c:forEach var="club" items="${clubList}">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="club-card">
                                    <div class="club-logo">
                                        <c:choose>
                                            <c:when test="${not empty club.logo_img}">
                                                <img src="${pageContext.request.contextPath}${club.logo_img}"
                                                     alt="${club.name}"
                                                     onerror="this.src='${pageContext.request.contextPath}/guest/assets/images/club-default.png'">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/guest/assets/images/club-default.png"
                                                     alt="${club.name}">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="club-content">
                                        <h3 class="club-name">${club.name}</h3>
                                        <p class="club-description">
                                            <c:choose>
                                                <c:when test="${not empty club.description}">
                                                    ${club.description}
                                                </c:when>
                                                <c:otherwise>
                                                    Câu lạc bộ mang đến nhiều hoạt động thú vị và bổ ích cho sinh viên.
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                        <div class="club-meta">
                                            <div class="club-date">
                                                <i class="bi bi-calendar3 me-1"></i>
                                                <fmt:formatDate value="${club.created_at}" pattern="dd/MM/yyyy" />
                                            </div>
                                            <span class="club-status">Đang hoạt động</span>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/club/details?id=${club.id}" class="view-details-btn mt-3">
                                            <i class="bi bi-eye me-2"></i>Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-12">
                            <div class="no-clubs">
                                <i class="bi bi-people"></i>
                                <h3>Chưa có câu lạc bộ nào</h3>
                                <p>Hiện tại chưa có câu lạc bộ nào đang hoạt động.</p>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <!-- JavaScript -->
    <script src="${pageContext.request.contextPath}/guest/assets/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/bootstrap.bundle.min.js"></script>
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
        <script src="${pageContext.request.contextPath}/guest/assets/js/main.js"></script>s

</body>
</html>