<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="vi">
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
    <body>
        <div id="wrapper" class="wrapper bg-ash">
            <!-- Giữ nguyên header và sider như trang gốc -->
            <jsp:include page="../common/header.jsp" />
            <div class="dashboard-page-one">
                <jsp:include page="../common/sider.jsp" />

                <div class="dashboard-content-one">
                    <br />

                    <!-- Card chứa form tạo sự kiện -->
                    <div class="card height-auto">
                        <div class="card-body">
                            <div class="heading-layout1">
                                <div class="item-title">
                                    <h3>Tạo Sự Kiện Mới</h3>
                                </div>
                            </div>

                            <!-- Form tạo sự kiện -->
                            <form action="${pageContext.request.contextPath}/createEvent?action=create" method="post">
                                <div class="row">
                                    <div class="col-md-6 form-group" style="display: block; width: 100%;">
                                        <label>Tiêu đề sự kiện <span style="color: red">*</span></label>
                                        <input type="text" name="title" class="form-control" placeholder="Nhập tiêu đề" required>
                                    </div>

                                    <div class="col-md-6 form-group">
                                        <label>Ngày bắt đầu <span style="color: red">*</span></label>
                                        <input type="datetime-local" name="start_at" class="form-control" required>
                                    </div>

                                    <div class="col-md-6 form-group">
                                        <label>Ngày kết thúc</label>
                                        <input type="datetime-local" name="end_at" class="form-control" required>
                                    </div>

                                    <div class="col-md-6 form-group">
                                        <label>Địa điểm <span style="color: red">*</span></label>
                                        <select name="area" class="form-control" required>
                                            <option value="">-- Chọn địa điểm --</option>
                                            <c:forEach var="a" items="${listArea}">
                                                <option value="${a.id}">${a.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-12 form-group">
                                        <label>Mô tả chi tiết</label>
                                        <textarea name="description" rows="6" class="form-control" placeholder="Mô tả nội dung sự kiện, lịch trình, người liên hệ..."
                                                  style="height:150px"
                                                  required></textarea>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>Người tạo</label>
                                        <input type="text" name="created_by" class="form-control" value="${sessionScope.account != null ? sessionScope.account.fullname : ''}" readonly>
                                    </div>

                                    <div class="col-12 form-group text-right">
                                        <button type="submit" class="btn btn-primary"
                                                style="width:140px; height:40px;text-align: center; align-content: center; font-size: 15px; margin: 10px 50px 0px 0px"
                                                >Tạo sự kiện</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JS cuối trang -->
        <script src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>


        <%-- Lấy JSON blockedRanges từ request attribute --%>
        <script>
            const blockedEvents = [
                <c:forEach var="e" items="${blockedEvents}">
                    {
                        areaId: ${e.area_id},
                        start: "${e.start}",
                        end: "${e.end}"
                    }<c:if test="${!fn:contains(e, blockedEvents[blockedEvents.size()-1])}">,</c:if>
                </c:forEach>
            ];

            const areaSelect = document.querySelector('select[name="area"]');
            const startInput = document.querySelector('input[name="start_at"]');
            const endInput = document.querySelector('input[name="end_at"]');

            areaSelect.addEventListener('change', () => {
                const selectedArea = parseInt(areaSelect.value);
                const nowBlocked = blockedEvents.filter(e => e.areaId === selectedArea);

                if (nowBlocked.length > 0) {
                    // lấy min và max của các khoảng bị chặn
                    const minDate = new Date(Math.min(...nowBlocked.map(e => new Date(e.start).getTime())));
                    const maxDate = new Date(Math.max(...nowBlocked.map(e => new Date(e.end).getTime())));

                    // disable khoảng thời gian bị trùng
                    startInput.min = new Date().toISOString().slice(0,16);
                    startInput.addEventListener('input', () => {
                        const val = new Date(startInput.value);
                        if (val >= minDate && val <= maxDate) {
                            alert("Khoảng thời gian này đã có sự kiện tại địa điểm này!");
                            startInput.value = "";
                        }
                    });

                    endInput.addEventListener('input', () => {
                        const val = new Date(endInput.value);
                        if (val >= minDate && val <= maxDate) {
                            alert("Khoảng thời gian này đã có sự kiện tại địa điểm này!");
                            endInput.value = "";
                        }
                    });
                } else {
                    startInput.min = "";
                }
            });
        </script>


    </body>
</html>
