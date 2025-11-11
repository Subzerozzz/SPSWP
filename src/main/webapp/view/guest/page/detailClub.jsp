<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${club.name} - FPT University</title>
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
            .club-detail-section {
                padding: 80px 0;
                background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                min-height: 100vh;
            }

            .club-header {
                background: white;
                border-radius: 20px;
                padding: 40px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                margin-bottom: 40px;
            }

            .club-logo-large {
                width: 200px;
                height: 200px;
                border-radius: 20px;
                overflow: hidden;
                display: flex;
                align-items: center;
                justify-content: center;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                margin: 0 auto;
            }

            .club-logo-large img {
                max-width: 80%;
                max-height: 80%;
                object-fit: contain;
            }

            .club-info {
                padding-left: 40px;
            }

            .club-name {
                font-size: 36px;
                font-weight: 700;
                color: #2c3e50;
                margin-bottom: 15px;
            }

            .club-description {
                font-size: 18px;
                color: #6c757d;
                line-height: 1.6;
                margin-bottom: 20px;
            }

            .club-meta {
                display: flex;
                gap: 20px;
                margin-bottom: 25px;
                flex-wrap: wrap;
            }

            .meta-item {
                display: flex;
                align-items: center;
                gap: 8px;
                color: #6c757d;
                font-size: 14px;
            }

            .meta-item i {
                color: #D90A2C;
            }

            .club-status {
                background: #28a745;
                color: white;
                padding: 8px 20px;
                border-radius: 20px;
                font-size: 14px;
                font-weight: 600;
                display: inline-block;
            }

            .club-content {
                background: white;
                border-radius: 20px;
                padding: 40px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                margin-bottom: 40px;
            }

            .section-title {
                font-size: 24px;
                font-weight: 700;
                color: #2c3e50;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #e9ecef;
            }

            .detail-item {
                margin-bottom: 15px;
                display: flex;
            }

            .detail-label {
                font-weight: 600;
                color: #2c3e50;
                min-width: 150px;
            }

            .detail-value {
                color: #6c757d;
            }

            .back-button {
                background: linear-gradient(45deg, #6c757d, #adb5bd);
                color: white;
                border: none;
                padding: 12px 30px;
                border-radius: 25px;
                font-weight: 600;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: all 0.3s ease;
            }

            .back-button:hover {
                background: linear-gradient(45deg, #5a6268, #868e96);
                color: white;
                transform: translateY(-2px);
            }

            .join-button {
                background: linear-gradient(45deg, #D90A2C, #ff6b6b);
                color: white;
                border: none;
                padding: 12px 30px;
                border-radius: 25px;
                font-weight: 600;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: all 0.3s ease;
            }

            .join-button:hover {
                background: linear-gradient(45deg, #b30824, #e74c3c);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(217, 10, 44, 0.3);
            }

            .action-buttons {
                display: flex;
                gap: 15px;
                margin-top: 30px;
                flex-wrap: wrap;
            }

            .no-club {
                text-align: center;
                padding: 100px 20px;
                background: white;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            }

            .no-club i {
                font-size: 80px;
                color: #e9ecef;
                margin-bottom: 20px;
            }

            .no-club h3 {
                color: #6c757d;
                margin-bottom: 10px;
            }

            .event-card {
                border: 1px solid #e9ecef;
                border-radius: 15px;
                padding: 20px;
                background: white;
                transition: all 0.3s ease;
                height: 100%;
            }

            .event-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            }

            .event-status-badge {
                font-size: 12px;
                padding: 4px 12px;
                border-radius: 12px;
            }

            .modal-event-image {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 10px;
                margin-bottom: 15px;
            }

            .event-detail-item {
                margin-bottom: 10px;
                display: flex;
                align-items: flex-start;
            }

            .event-detail-label {
                font-weight: 600;
                color: #2c3e50;
                min-width: 120px;
            }

            .event-detail-value {
                color: #6c757d;
                flex: 1;
            }

            .event-image-placeholder {
                width: 100%;
                height: 200px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 18px;
                margin-bottom: 15px;
            }

            @media (max-width: 768px) {
                .club-detail-section {
                    padding: 40px 0;
                }

                .club-header {
                    padding: 20px;
                }

                .club-info {
                    padding-left: 0;
                    padding-top: 30px;
                    text-align: center;
                }

                .club-name {
                    font-size: 28px;
                }

                .club-content {
                    padding: 20px;
                }

                .club-meta {
                    justify-content: center;
                }

                .action-buttons {
                    justify-content: center;
                }

                .detail-item {
                    flex-direction: column;
                    gap: 5px;
                }

                .detail-label {
                    min-width: auto;
                }

                .event-detail-item {
                    flex-direction: column;
                    gap: 5px;
                }

                .event-detail-label {
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

            <!-- Club Detail Section -->
            <div class="club-detail-section">
                <div class="container">
                <c:choose>
                    <c:when test="${not empty club}">
                        <!-- Club Header -->
                        <div class="club-header">
                            <div class="row align-items-center">
                                <div class="col-lg-4 text-center">
                                    <div class="club-logo-large">
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
                                </div>
                                <div class="col-lg-8">
                                    <div class="club-info">
                                        <h1 class="club-name">${club.name}</h1>
                                        <p class="club-description">
                                            <c:choose>
                                                <c:when test="${not empty club.description}">
                                                    ${club.description}
                                                </c:when>
                                                <c:otherwise>
                                                    Câu lạc bộ mang đến nhiều hoạt động thú vị và bổ ích cho sinh viên FPT University.
                                                </c:otherwise>
                                            </c:choose>
                                        </p>

                                        <div class="club-meta">
                                            <div class="meta-item">
                                                <i class="bi bi-calendar3"></i>
                                                <span>Ngày thành lập: <strong><fmt:formatDate value="${club.created_at}" pattern="dd/MM/yyyy" /></strong></span>
                                            </div>
                                            <div class="meta-item">
                                                <i class="bi bi-arrow-clockwise"></i>
                                                <span>Cập nhật: <strong><fmt:formatDate value="${club.updated_at}" pattern="dd/MM/yyyy" /></strong></span>
                                            </div>
                                            <div class="meta-item">
                                                <i class="bi bi-people"></i>
                                                <span>Trạng thái: </span>
                                                <span class="club-status">Đang hoạt động</span>
                                            </div>
                                        </div>

                                        <div class="action-buttons">
                                            <a href="${pageContext.request.contextPath}/clubsForHome?action=viewClubs" class="back-button">
                                                <i class="bi bi-arrow-left"></i>Quay lại
                                            </a>
                                            <a href="${pageContext.request.contextPath}/clubsForHome?action=joinClub&clubId=${club.id}" class="join-button">
                                                <i class="bi bi-person-plus"></i>Tham gia ngay
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Club Details -->
                        <div class="club-content">
                            <h3 class="section-title">Thông tin chi tiết</h3>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="detail-item">
                                        <span class="detail-label">Tên câu lạc bộ:</span>
                                        <span class="detail-value">${club.name}</span>
                                    </div>

                                    <div class="detail-item">
                                        <span class="detail-label">Ngày thành lập:</span>
                                        <span class="detail-value"><fmt:formatDate value="${club.created_at}" pattern="dd/MM/yyyy" /></span>
                                    </div>

                                    <div class="detail-item">
                                        <span class="detail-label">Cập nhật lần cuối:</span>
                                        <span class="detail-value"><fmt:formatDate value="${club.updated_at}" pattern="dd/MM/yyyy" /></span>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="detail-item">
                                        <span class="detail-label">Trạng thái:</span>
                                        <span class="detail-value">
                                            <span class="club-status">Đang hoạt động</span>
                                        </span>
                                    </div>

                                    <c:if test="${not empty president}">
                                        <div class="detail-item">
                                            <span class="detail-label">Chủ nhiệm CLB:</span>
                                            <span class="detail-value">${president.fullname}</span>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <c:if test="${not empty club.description}">
                                <div class="mt-4">
                                    <div class="detail-item">
                                        <span class="detail-label">Mô tả chi tiết:</span>
                                    </div>
                                    <div class="detail-value" style="line-height: 1.8; margin-top: 10px;">
                                        ${club.description}
                                    </div>
                                </div>
                            </c:if>
                        </div>

                        <!-- Events Section -->
                        <div class="club-content">
                            <h3 class="section-title">Hoạt động & Sự kiện</h3>

                            <c:choose>
                                <c:when test="${not empty eventList}">
                                    <div class="row">
                                        <c:forEach var="event" items="${eventList}">
                                            <c:set var="today" value="<%= new java.util.Date() %>" />
                                            <c:set var="eventStatus">
                                                <c:choose>
                                                    <c:when test="${today < event.start}">pending</c:when>
                                                    <c:when test="${today >= event.start && today <= event.end}">active</c:when>
                                                    <c:when test="${today > event.end}">completed</c:when>
                                                    <c:otherwise>${event.status}</c:otherwise>
                                                </c:choose>
                                            </c:set>

                                            <div class="col-lg-6 col-md-12 mb-4">
                                                <div class="event-card">
                                                    <div class="event-header" style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 15px;">
                                                        <h5 class="event-title" style="font-weight: 600; color: #2c3e50; margin: 0; flex: 1;">
                                                            ${event.title}
                                                        </h5>
                                                        <span class="event-status-badge badge ${eventStatus eq 'active' ? 'bg-success' : eventStatus eq 'pending' ? 'bg-warning' : 'bg-secondary'}">
                                                            <c:choose>
                                                                <c:when test="${eventStatus eq 'active'}">Đang diễn ra</c:when>
                                                                <c:when test="${eventStatus eq 'pending'}">Sắp diễn ra</c:when>
                                                                <c:when test="${eventStatus eq 'completed'}">Đã kết thúc</c:when>
                                                                <c:otherwise>${eventStatus}</c:otherwise>
                                                            </c:choose>
                                                        </span>
                                                    </div>

                                                    <div class="event-description" style="color: #6c757d; font-size: 14px; margin-bottom: 15px; line-height: 1.5;">
                                                        <c:choose>
                                                            <c:when test="${not empty event.description}">
                                                                ${fn:substring(event.description, 0, 100)}...
                                                            </c:when>
                                                            <c:otherwise>
                                                                Sự kiện đặc biệt của câu lạc bộ.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>

                                                    <div class="event-meta" style="display: flex; justify-content: space-between; align-items: center; font-size: 12px; color: #6c757d;">
                                                        <div class="event-date">
                                                            <i class="bi bi-calendar3 me-1"></i>
                                                            <fmt:formatDate value="${event.start}" pattern="dd/MM/yyyy" />
                                                            <c:if test="${not empty event.end}">
                                                                - <fmt:formatDate value="${event.end}" pattern="dd/MM/yyyy" />
                                                            </c:if>
                                                        </div>
                                                    </div>

                                                    <div class="event-actions" style="margin-top: 15px; text-align: right;">
                                                        <c:if test="${eventStatus eq 'pending'}">
                                                            <a href="${pageContext.request.contextPath}/clubsForHome?action=joinEvent&eventId=${event.id}&clubId=${club.id}"
                                                               class="btn btn-sm btn-primary join-event-btn"
                                                               style="padding: 5px 15px; border-radius: 15px; font-size: 12px;">
                                                                <i class="bi bi-person-plus me-1"></i>Đăng ký tham gia
                                                            </a>
                                                        </c:if>
                                                        <button type="button" class="btn btn-sm btn-outline-primary view-event-detail"
                                                                data-event-id="${event.id}"
                                                                data-event-title="${event.title}"
                                                                data-event-description="${event.description}"
                                                                data-event-start="<fmt:formatDate value="${event.start}" pattern="dd/MM/yyyy" />"
                                                                data-event-end="<fmt:formatDate value="${event.end}" pattern="dd/MM/yyyy" />"
                                                                data-event-status="${eventStatus}"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#eventDetailModal"
                                                                style="padding: 5px 15px; border-radius: 15px; font-size: 12px;">
                                                            <i class="bi bi-eye me-1"></i>Chi tiết
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="text-center py-4">
                                        <i class="bi bi-calendar-x" style="font-size: 48px; color: #e9ecef;"></i>
                                        <p class="text-muted mt-3">Hiện tại chưa có sự kiện nào được tổ chức.</p>
                                        <a href="${pageContext.request.contextPath}/events" class="join-button">
                                            <i class="bi bi-calendar-check"></i>Khám phá sự kiện
                                        </a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </c:when>
                    <c:otherwise>
                        <!-- No Club Found -->
                        <div class="no-club">
                            <i class="bi bi-exclamation-circle"></i>
                            <h3>Không tìm thấy câu lạc bộ</h3>
                            <p class="mb-4">Câu lạc bộ bạn đang tìm kiếm không tồn tại hoặc đã bị xóa.</p>
                            <a href="${pageContext.request.contextPath}/clubs" class="back-button">
                                <i class="bi bi-arrow-left"></i>Quay lại danh sách
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Event Detail Modal -->
        <div class="modal fade" id="eventDetailModal" tabindex="-1" aria-labelledby="eventDetailModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="eventDetailModalLabel">Chi tiết sự kiện</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="event-image-placeholder">
                            <i class="bi bi-calendar-event" style="font-size: 48px;"></i>
                        </div>

                        <div class="mb-3">
                            <span class="badge event-status-badge" id="modalEventStatus">Trạng thái</span>
                        </div>

                        <h4 id="modalEventTitle" class="mb-3" style="color: #2c3e50;"></h4>

                        <div class="event-detail-item">
                            <span class="event-detail-label"><i class="bi bi-calendar-event"></i> Ngày bắt đầu:</span>
                            <span class="event-detail-value" id="modalEventStart"></span>
                        </div>

                        <div class="event-detail-item">
                            <span class="event-detail-label"><i class="bi bi-calendar-check"></i> Ngày kết thúc:</span>
                            <span class="event-detail-value" id="modalEventEnd"></span>
                        </div>

                        <div class="event-detail-item">
                            <span class="event-detail-label"><i class="bi bi-card-text"></i> Mô tả:</span>
                            <span class="event-detail-value" id="modalEventDescription"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
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
                // Xử lý khi click vào nút xem chi tiết sự kiện
                $('.view-event-detail').on('click', function () {
                    const eventId = $(this).data('event-id');
                    const eventTitle = $(this).data('event-title');
                    const eventDescription = $(this).data('event-description');
                    const eventStart = $(this).data('event-start');
                    const eventEnd = $(this).data('event-end');
                    const eventStatus = $(this).data('event-status');

                    // Đổ dữ liệu vào modal
                    $('#modalEventTitle').text(eventTitle);
                    $('#modalEventDescription').text(eventDescription);
                    $('#modalEventStart').text(eventStart);
                    $('#modalEventEnd').text(eventEnd);

                    // Xử lý trạng thái sự kiện
                    let statusText = '';
                    let statusClass = '';

                    switch (eventStatus) {
                        case 'pending':
                            statusText = 'Sắp diễn ra';
                            statusClass = 'bg-warning';
                            break;
                        case 'active':
                            statusText = 'Đang diễn ra';
                            statusClass = 'bg-success';
                            break;
                        case 'completed':
                            statusText = 'Đã kết thúc';
                            statusClass = 'bg-secondary';
                            break;
                        default:
                            statusText = 'Không xác định';
                            statusClass = 'bg-secondary';
                    }

                    $('#modalEventStatus').text(statusText).removeClass().addClass('badge ' + statusClass + ' event-status-badge');
                });

                // Reset modal khi đóng
                $('#eventDetailModal').on('hidden.bs.modal', function () {
                    $('#modalEventTitle').text('');
                    $('#modalEventDescription').text('');
                    $('#modalEventStart').text('');
                    $('#modalEventEnd').text('');
                    $('#modalEventStatus').text('').removeClass();
                });
            });
        </script>
        <c:if test="${not empty message}">
            <script>
                document.addEventListener("DOMContentLoaded", () => {
                <c:choose>
                    <c:when test="${success == true}">
                    iziToast.success({
                        title: "Thành công",
                        message: "${message}",
                        position: 'topRight',
                        timeout: 5000
                    });
                    </c:when>
                    <c:when test="${success == false}">
                    iziToast.error({
                        title: "Lỗi",
                        message: "${message}",
                        position: 'topRight',
                        timeout: 5000
                    });
                    </c:when>
                    <c:otherwise>
                    iziToast.info({
                        title: "Thông báo",
                        message: "${message}",
                        position: 'topRight',
                        timeout: 5000
                    });
                    </c:otherwise>
                </c:choose>
                });
            </script>
            <%
                session.removeAttribute("success");
                session.removeAttribute("message");
            %>
        </c:if>

        <!-- Thông báo đăng ký thành công -->
        <c:if test="${joinSuccess == true}">
            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    iziToast.success({
                        title: "Đăng ký tham gia CLB thành công",
                        message: "${message}",
                        position: 'topRight',
                        timeout: 5000
                    });
                });
            </script>
            <%
                session.removeAttribute("joinSuccess");
                session.removeAttribute("message");
            %>
        </c:if>

        <c:if test="${joinEvent == true}">
                    <script>
                        document.addEventListener("DOMContentLoaded", () => {
                            iziToast.success({
                                title: "Đăng ký tham gia sự kiện thành công",
                                message: "${message}",
                                position: 'topRight',
                                timeout: 5000
                            });
                        });
                    </script>
                    <%
                        session.removeAttribute("joinEvent");
                        session.removeAttribute("message");
                    %>
                </c:if>
            
            <c:if test="${joinSuccess == false}">
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                iziToast.error({
                    title: "Bạn đã đăng ký tham gia CLB này rồi , đang chờ duyệt !",
                    message: "${message}",
                    position: 'topRight',
                    timeout: 5000
                });
            });
        </script>
        <% 
            session.removeAttribute("joinSuccess"); 
            session.removeAttribute("message"); 
        %>
    </c:if>
    </body>
</html>