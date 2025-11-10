<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký tham gia CLB - ${club.name}</title>
        <link rel="icon" href="${pageContext.request.contextPath}/guest/assets/images/logoFPT3.png" type="image/gif" sizes="20x20">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/bootstrap.min.css">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/bootstrap-icons.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css">
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>

        <style>
            .join-club-section {
                padding: 80px 0;
                background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                min-height: 100vh;
            }

            .join-form-container {
                background: white;
                border-radius: 20px;
                padding: 40px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                margin-bottom: 40px;
            }

            .section-title {
                font-size: 28px;
                font-weight: 700;
                color: #2c3e50;
                margin-bottom: 30px;
                text-align: center;
                padding-bottom: 15px;
                border-bottom: 2px solid #e9ecef;
            }

            .info-section {
                background: #f8f9fa;
                border-radius: 15px;
                padding: 25px;
                margin-bottom: 30px;
            }

            .info-title {
                font-size: 18px;
                font-weight: 600;
                color: #2c3e50;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .info-item {
                display: flex;
                margin-bottom: 12px;
                align-items: flex-start;
            }

            .info-label {
                font-weight: 600;
                color: #2c3e50;
                min-width: 120px;
            }

            .info-value {
                color: #6c757d;
                flex: 1;
            }

            .club-logo {
                width: 80px;
                height: 80px;
                border-radius: 15px;
                overflow: hidden;
                display: flex;
                align-items: center;
                justify-content: center;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                margin-right: 20px;
            }

            .club-logo img {
                max-width: 70%;
                max-height: 70%;
                object-fit: contain;
            }

            .club-header {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .club-info h4 {
                margin: 0;
                color: #2c3e50;
                font-weight: 700;
            }

            .club-info p {
                margin: 5px 0 0 0;
                color: #6c757d;
            }

            .form-group {
                margin-bottom: 25px;
            }

            .form-label {
                font-weight: 600;
                color: #2c3e50;
                margin-bottom: 8px;
            }

            .form-control {
                border: 2px solid #e9ecef;
                border-radius: 10px;
                padding: 12px 15px;
                font-size: 14px;
                transition: all 0.3s ease;
            }

            .form-control:focus {
                border-color: #D90A2C;
                box-shadow: 0 0 0 0.2rem rgba(217, 10, 44, 0.25);
            }

            .form-textarea {
                min-height: 120px;
                resize: vertical;
            }

            .btn-submit {
                background: linear-gradient(45deg, #D90A2C, #ff6b6b);
                color: white;
                border: none;
                padding: 12px 40px;
                border-radius: 25px;
                font-weight: 600;
                font-size: 16px;
                transition: all 0.3s ease;
                width: 100%;
                margin-top: 10px;
            }

            .btn-submit:hover {
                background: linear-gradient(45deg, #b30824, #e74c3c);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(217, 10, 44, 0.3);
            }

            .btn-cancel {
                background: linear-gradient(45deg, #6c757d, #adb5bd);
                color: white;
                border: none;
                padding: 12px 40px;
                border-radius: 25px;
                font-weight: 600;
                font-size: 16px;
                transition: all 0.3s ease;
                width: 100%;
                text-decoration: none;
                display: block;
                text-align: center;
                margin-top: 15px;
            }

            .btn-cancel:hover {
                background: linear-gradient(45deg, #5a6268, #868e96);
                color: white;
                transform: translateY(-2px);
            }

            .required-field::after {
                content: " *";
                color: #D90A2C;
            }

            @media (max-width: 768px) {
                .join-form-container {
                    padding: 20px;
                }

                .club-header {
                    flex-direction: column;
                    text-align: center;
                }

                .club-logo {
                    margin-right: 0;
                    margin-bottom: 15px;
                }

                .info-item {
                    flex-direction: column;
                    gap: 5px;
                }

                .info-label {
                    min-width: auto;
                }
            }
        </style>
    </head>
    <body>
        <!-- Preloader -->
        <div id="preloader"></div>

        <!-- Header -->
        <jsp:include page="../common/header.jsp"></jsp:include>

            <!-- Join Club Section -->
            <div class="join-club-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="join-form-container">
                                <h2 class="section-title">Đăng ký tham gia Câu lạc bộ</h2>

                                <!-- Thông tin cá nhân -->
                                <div class="info-section">
                                    <h4 class="info-title">
                                        <i class="bi bi-person-circle"></i>Thông tin cá nhân
                                    </h4>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <span class="info-label">Họ và tên:</span>
                                                <span class="info-value">${account.fullname}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Email:</span>
                                            <span class="info-value">${account.email}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Mã sinh viên:</span>
                                            <span class="info-value">${account.student_id}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="info-item">
                                            <span class="info-label">Số điện thoại:</span>
                                            <span class="info-value">${account.phone}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Giới tính:</span>
                                            <span class="info-value">
                                                <c:choose>
                                                    <c:when test="${account.gender eq 'male'}">Nam</c:when>
                                                    <c:when test="${account.gender eq 'female'}">Nữ</c:when>
                                                    <c:otherwise>Khác</c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Ngày sinh:</span>
                                            <span class="info-value"><fmt:formatDate value="${account.bod}" pattern="dd/MM/yyyy" /></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Thông tin CLB -->
                            <div class="info-section">
                                <div class="club-header">
                                    <div class="club-logo">
                                        <c:choose>
                                            <c:when test="${not empty club.logo_img}">
                                                <img src="${club.logo_img}"
                                                     alt="${club.name}"
                                                     onerror="this.src='${pageContext.request.contextPath}/guest/assets/images/club-default.png'">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/guest/assets/images/club-default.png"
                                                     alt="${club.name}">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="club-info">
                                        <h4>${club.name}</h4>
                                        <p>
                                            <c:choose>
                                                <c:when test="${not empty club.description}">
                                                    ${club.description}
                                                </c:when>
                                                <c:otherwise>
                                                    Câu lạc bộ sinh viên FPT University
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Form đăng ký -->
                            <form action="${pageContext.request.contextPath}/clubsForHome" method="POST" id="joinClubForm">
                                <input type="hidden" name="action" value="submitJoin">
                                <input type="hidden" name="clubId" value="${club.id}">
                                <input type="hidden" name="accountId" value="${account.id}">

                                <div class="form-group">
                                    <label class="form-label required-field">Giới thiệu bản thân</label>
                                    <textarea class="form-control form-textarea"
                                              name="self"
                                              placeholder="Hãy giới thiệu về bản thân, kỹ năng, sở thích và kinh nghiệm của bạn..."
                                              required></textarea>
                                    <small class="form-text text-muted">Giúp CLB hiểu rõ hơn về bạn</small>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required-field">Lý do muốn tham gia</label>
                                    <textarea class="form-control form-textarea"
                                              name="reason"
                                              placeholder="Tại sao bạn muốn tham gia câu lạc bộ này? Bạn mong muốn đóng góp gì cho CLB?..."
                                              required></textarea>
                                    <small class="form-text text-muted">Chia sẻ động lực và mong muốn của bạn</small>
                                </div>

                                <button type="submit" class="btn-submit">
                                    <i class="bi bi-send-check"></i> Gửi đơn đăng ký
                                </button>

                                <a href="${pageContext.request.contextPath}/clubsForHome?action=viewClubs" class="btn-cancel">
                                    <i class="bi bi-arrow-left"></i> Quay lại
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="../common/footer.jsp"></jsp:include>

            <!-- JavaScript -->
            <script src="${pageContext.request.contextPath}/guest/assets/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/guest/assets/js/bootstrap.bundle.min.js"></script>

        <script>
            $(document).ready(function () {
                // Xử lý form submit
                $('#joinClubForm').on('submit', function (e) {
                    const self = $('textarea[name="self"]').val().trim();
                    const reason = $('textarea[name="reason"]').val().trim();

                    if (self === '' || reason === '') {
                        e.preventDefault();
                        alert('Vui lòng điền đầy đủ thông tin giới thiệu bản thân và lý do tham gia.');
                        return false;
                    }

                    if (self.length < 10) {
                        e.preventDefault();
                        alert('Vui lòng giới thiệu bản thân chi tiết hơn (ít nhất 10 ký tự).');
                        return false;
                    }

                    if (reason.length < 10) {
                        e.preventDefault();
                        alert('Vui lòng nêu rõ lý do tham gia (ít nhất 10 ký tự).');
                        return false;
                    }

                    // Confirm trước khi gửi
                    if (!confirm('Bạn có chắc chắn muốn gửi đơn đăng ký tham gia CLB ${club.name} không?')) {
                        e.preventDefault();
                        return false;
                    }
                });
            });
        </script>
    </body>
</html>