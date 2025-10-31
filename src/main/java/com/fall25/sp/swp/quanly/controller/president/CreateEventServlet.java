package com.fall25.sp.swp.quanly.controller.president;


import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AccountEventDAO;
import com.fall25.sp.swp.quanly.dal.implement.AreaDAO;
import com.fall25.sp.swp.quanly.dal.implement.EventDAO;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import com.fall25.sp.swp.quanly.entity.AccountEvent;
import com.fall25.sp.swp.quanly.entity.Area;
import com.fall25.sp.swp.quanly.entity.Event;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.sql.Date;
import java.util.*;

@WebServlet("/createEvent")
public class CreateEventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AreaDAO areaDAO = new AreaDAO();
        List<Area> listArea = areaDAO.findAll();
        request.setAttribute("listArea", listArea);

        EventDAO eventDAO = new EventDAO();
        List<Event> blockedEvents = eventDAO.getActiveOrPendingEvents();
        request.setAttribute("blockedEvents", blockedEvents);

        request.getRequestDispatcher("/view/admin/president/createEvent.jsp").forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy action từ param (nếu form có ?action=create)
        String action = req.getParameter("action");
        if ("create".equals(action)) {
            handleCreate(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action");
        }
    }

    private void handleCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> errors = new LinkedHashMap<>();

        // Utility trim (nếu bạn có method trim(...) khác, dùng method đó)
        String title = trim(req.getParameter("title"));
        String area = trim(req.getParameter("area"));
        String description = trim(req.getParameter("description"));
        String startAtRaw = trim(req.getParameter("start_at"));
        String endAtRaw = trim(req.getParameter("end_at"));

        // Session / accountClub null-safe
        HttpSession session = req.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;

        Integer clubId = (accountClub != null) ? accountClub.getClub_id() : null;
        Integer presidentId = (accountClub != null) ? accountClub.getAccount_id() : null;

        if (clubId == null) {
            errors.put("club_id", "Club ID bắt buộc (không tìm thấy thông tin club của người tạo).");
        }
        if (presidentId == null) {
            errors.put("president_id", "Account ID của người tạo không hợp lệ.");
        }

        // validate title
        if (title == null || title.isEmpty()) {
            errors.put("title", "Vui lòng nhập tiêu đề.");
        } else if (title.length() > 200) {
            errors.put("title", "Tiêu đề quá dài (tối đa 200 ký tự).");
        }

        // validate area
        if (area == null || area.isEmpty()) {
            errors.put("area", "Vui lòng nhập area (khu vực).");
        } else if (area.length() > 255) {
            errors.put("area", "Area quá dài (tối đa 255 ký tự).");
        }

        // validate description (tuỳ chọn, chỉ kiểm tra độ dài)
        if (description != null && description.length() > 2000) {
            errors.put("description", "Mô tả quá dài (tối đa 2000 ký tự).");
        }

        // Parse ngày (hỗ trợ một số định dạng hay gặp)
        LocalDateTime startAt = null;
        LocalDateTime endAt = null;

        if (startAtRaw == null || startAtRaw.isEmpty()) {
            errors.put("start_at", "Vui lòng chọn ngày bắt đầu.");
        } else {
            startAt = tryParseDateTime(startAtRaw);
            if (startAt == null) {
                errors.put("start_at", "Định dạng ngày bắt đầu không hợp lệ. Dùng định dạng yyyy-MM-dd'T'HH:mm (datetime-local) hoặc ISO.");
            }
        }

        if (endAtRaw != null && !endAtRaw.isEmpty()) {
            endAt = tryParseDateTime(endAtRaw);
            if (endAt == null) {
                errors.put("end_at", "Định dạng ngày kết thúc không hợp lệ. Dùng định dạng yyyy-MM-dd'T'HH:mm (datetime-local) hoặc ISO.");
            }
        }

        // Kiểm tra logic thời gian: end phải strictly after start (nếu cả hai tồn tại)
        if (startAt != null && endAt != null) {
            if (!endAt.isAfter(startAt)) { // end phải > start
                errors.put("end_at", "Ngày kết thúc phải sau ngày bắt đầu.");
            }
        }

        // (Tùy chọn) kiểm tra start không phải quá khứ — nếu bạn cho phép tạo event trong quá khứ, bỏ phần này
        LocalDateTime now = LocalDateTime.now();
        if (startAt != null && startAt.isBefore(now)) {
            errors.put("start_at", "Ngày bắt đầu phải là hiện tại hoặc trong tương lai.");
        }

        System.out.println(errors);

        // Nếu có lỗi -> forward lại form với errors và giá trị cũ
        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.setAttribute("title", title);
            req.setAttribute("area", area);
            req.setAttribute("description", description);
            req.setAttribute("start_at", startAtRaw);
            req.setAttribute("end_at", endAtRaw);
            req.getRequestDispatcher("/view/admin/president/createEvent.jsp").forward(req, resp);
            return;
        }

        // --- Chuyển sang java.sql.Date để lưu DB (chỉ lấy phần ngày) ---
        Date startDate = (startAt != null) ? Date.valueOf(startAt.toLocalDate()) : null;
        Date endDate = (endAt != null) ? Date.valueOf(endAt.toLocalDate()) : null;
        Date nowDate = new Date(System.currentTimeMillis());
        int area_id = Integer.parseInt(area);
        // Tạo event và lưu
        Event event = new Event();
        event.setClub_id(clubId);
        event.setDescription(description);
        event.setArea_id(area_id);
        event.setStart(startDate);
        event.setEnd(endDate);
        event.setCreated_at(nowDate);
        event.setUpdated_at(nowDate);
        event.setTitle(title);
        event.setStatus("pending");

        EventDAO eventDAO = new EventDAO();
        int idEvent =  eventDAO.insert(event);
        AccountEventDAO accountEventDAO = new AccountEventDAO();
        AccountEvent accountEvent = new AccountEvent();
        accountEvent.setEvent_id(idEvent);
        accountEvent.setAccount_id(presidentId);
        boolean success = accountEventDAO.insert(accountEvent)>=1?true:false;
        System.out.println(success);
        if (success) {
            req.setAttribute("success","Tạo sự kiện thành công ! Cần chờ quản lý duyệt");
        }
        req.getRequestDispatcher("/view/admin/president/createEvent.jsp").forward(req, resp);
    }


    private static LocalDateTime tryParseDateTime(String raw) {
        if (raw == null) return null;
        String s = raw.trim();
        if (s.isEmpty()) return null;

        DateTimeFormatter[] fmts = new DateTimeFormatter[] {
                DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"),
                DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss"),
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"),
                DateTimeFormatter.ISO_LOCAL_DATE_TIME
        };

        for (DateTimeFormatter f : fmts) {
            try {
                return LocalDateTime.parse(s, f);
            } catch (DateTimeParseException ignored) {}
        }

        // Thử parse mặc định cuối cùng (nếu có timezone info thì sẽ fail — bạn có thể mở rộng)
        try {
            return LocalDateTime.parse(s);
        } catch (DateTimeParseException ignored) {}

        return null;
    }


    private static String trim(String s) {
        return s == null ? null : s.trim();
    }
}
