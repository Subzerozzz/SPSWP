package com.fall25.sp.swp.quanly.controller.president;

import com.fall25.sp.swp.quanly.entity.Task;
import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.*;
import com.fall25.sp.swp.quanly.entity.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/eventDetail")
public class EventDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "viewDetail":
                viewDetail(req, resp);
                break;
            case "deleteTask":
                deleteTask(req, resp);
                break;
            case "approveRequest":
                approveRequest(req, resp);
                break;
            default:
                req.getRequestDispatcher("view/admin/president/eventDetail.jsp").forward(req, resp);
                break;
        }

    }

    protected void approveRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer requestId = Integer.parseInt(req.getParameter("requestId"));
        boolean rl = new RequestJoinEventDAO().updateStatus(requestId,"active");
        if (rl){
            viewDetail(req, resp);
        }
    }
    
    protected void deleteTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer taskId = Integer.parseInt(req.getParameter("taskId"));
        boolean success = new TaskDAO().deleteTaskById(taskId);
        Account account = new AccountDAO().findById(Integer.parseInt(req.getParameter("accountId")));
        if (success){
            req.setAttribute("deleteTaskSuccess", "Xóa nhiệm vụ "+account.getFullname()+" thành công!");
            viewDetail(req, resp);
        }
    }

    protected void viewDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Session / accountClub null-safe
        HttpSession session = req.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;

        Integer clubId = (accountClub != null) ? accountClub.getClub_id() : null;
        System.out.println("clubId: " + clubId);
        Integer presidentId = (accountClub != null) ? accountClub.getAccount_id() : null;

        if (clubId == null || presidentId == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        Integer eventId = Integer.parseInt(req.getParameter("eventId"));
        EventDAO eventDAO = new EventDAO();
        AreaDAO areaDAO = new AreaDAO();

        // Lấy thông tin event và area
        Event event = eventDAO.findById(eventId);
        Area area = areaDAO.findById(event.getArea_id());

        Map<Integer, String> areaMap = new HashMap<>();
        areaMap.put(Integer.valueOf(area.getId()), area.getName());

        // Lấy danh sách thành viên CLB
        List<Account> listAccount = new ArrayList<>();
        Map<Integer, String> accountRoles = new HashMap<>(); // Map lưu role của từng account
        Map<Integer, String> accountNames = new HashMap<>(); // Map lưu tên của từng account
        AccountClubDAO accountClubDAO = new AccountClubDAO();
        AccountDAO accountDAO = new AccountDAO();

        List<AccountClub> accountClubs = accountClubDAO.findByClubId(clubId);

        if (accountClubs != null) {
            for (AccountClub ac : accountClubs) {
                Account acc = accountDAO.findById(ac.getAccount_id());
                if (acc != null) {
                    listAccount.add(acc);
                    accountRoles.put(acc.getId(), ac.getRole()); // Lưu role vào map
                    accountNames.put(acc.getId(), acc.getFullname()); // Lưu tên vào map
                }
            }
        }

        TaskDAO taskDAO = new TaskDAO();
        List<Map<String, Object>> tasks = taskDAO.findByEventId(eventId);

        for (Map<String, Object> task : tasks) {
            Integer accountId = (Integer) task.get("account_id");
            String accountName = accountNames.get(accountId);
            task.put("account_name", accountName != null ? accountName : "Unknown");
        }

        List<Area> listArea = areaDAO.findAll();
        req.setAttribute("listArea", listArea);

        List<Event> blockedEvents = eventDAO.getActiveOrPendingEvents();
        req.setAttribute("blockedEvents", blockedEvents);

        // Lấy danh sách request join event
        RequestJoinEventDAO requestJoinEventDAO = new RequestJoinEventDAO();
        List<RequestJoinEvent> listJoinEvent = requestJoinEventDAO.findByEventId(eventId);

        // Tạo map để liên kết request với account
        Map<Integer, Account> requestAccountMap = new HashMap<>();
        Map<Integer, RequestJoinEvent> requestMap = new HashMap<>();

        // Phân loại request theo status
        List<RequestJoinEvent> pendingRequests = new ArrayList<>();
        List<RequestJoinEvent> approvedRequests = new ArrayList<>();

        for (RequestJoinEvent request : listJoinEvent) {
            Account acc = accountDAO.findById(request.getAccountId());
            if (acc != null) {
                requestAccountMap.put(request.getId(), acc);
                requestMap.put(request.getId(), request);

                // Phân loại theo status
                if ("pending".equals(request.getStatus())) {
                    pendingRequests.add(request);
                } else if ("active".equals(request.getStatus())) {
                    approvedRequests.add(request);
                }
            }
        }

        req.setAttribute("event", event);
        req.setAttribute("areaMap", areaMap);
        req.setAttribute("listAccount", listAccount);
        req.setAttribute("accountRoles", accountRoles);
        req.setAttribute("tasks", tasks);
        req.setAttribute("pendingRequests", pendingRequests);
        req.setAttribute("approvedRequests", approvedRequests);
        req.setAttribute("requestAccountMap", requestAccountMap);
        req.setAttribute("requestMap", requestMap);

        req.getRequestDispatcher("view/admin/president/eventDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "addParticipant":
                addTask(req, resp);
                break;
            case "updateEvent":
                updateEvent(req, resp);
                break;
            case "updateTask":
                updateTask(req, resp);
                break;
            default:
                break;
        }
    }

    protected void addTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer eventId = Integer.parseInt(req.getParameter("eventId"));
        Integer accountId = Integer.parseInt(req.getParameter("accountId"));
        String taskName = req.getParameter("taskName");
        String taskDescription = req.getParameter("taskDescription");

        TaskDAO taskDAO = new TaskDAO();
        boolean success = taskDAO.insertTaskDirect(taskName, eventId, taskDescription, accountId);
        if (success) {
            System.out.println("Task added successfully");
            viewDetail(req, resp);
        }
    }

    protected void updateEvent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer eventId = Integer.parseInt(req.getParameter("eventId"));
        String startDateStr = req.getParameter("start");
        String endDateStr = req.getParameter("end");
        Integer area = Integer.parseInt(req.getParameter("area"));
        String title = req.getParameter("title");
        String description = req.getParameter("description");

        // Parse dates
        Date startDate = Date.valueOf(startDateStr.substring(0, 10));
        Date endDate = Date.valueOf(endDateStr.substring(0, 10));

        EventDAO eventDAO = new EventDAO();
        Event event = eventDAO.findById(eventId);
        Date startDateOld = event.getStart();
        Date endDateOld = event.getEnd();

        String error = null;

        // Lấy ngày hiện tại - sử dụng java.util.Date
        java.util.Date currentUtilDate = new java.util.Date();
        Date currentDate = new Date(currentUtilDate.getTime());

        // Validate 1: Ngày bắt đầu mới không được sớm hơn ngày cũ
        if (startDate.before(startDateOld)) {
            error = "Ngày bắt đầu mới phải muộn hơn hoặc bằng ngày bắt đầu hiện tại";
            req.setAttribute("error", error);
            viewDetail(req, resp);
            return;
        }

        // Validate 2: Ngày bắt đầu không được sớm hơn ngày hiện tại
        if (startDate.before(currentDate)) {
            error = "Ngày bắt đầu không được ở trong quá khứ";
            req.setAttribute("error", error);
            viewDetail(req, resp);
            return;
        }

        // Validate 3: Ngày bắt đầu phải sớm hơn ngày kết thúc
        if (startDate.after(endDate)) {
            error = "Ngày bắt đầu phải sớm hơn ngày kết thúc";
            req.setAttribute("error", error);
            viewDetail(req, resp);
            return;
        }

        // Validate 4: Ngày kết thúc không được sớm hơn ngày kết thúc cũ
        if (endDate.before(endDateOld)) {
            error = "Ngày kết thúc mới phải muộn hơn hoặc bằng ngày kết thúc hiện tại";
            req.setAttribute("error", error);
            viewDetail(req, resp);
            return;
        }

        // Validate 5: Kiểm tra khoảng cách tối thiểu giữa start và end (ít nhất 1 ngày)
        long diffInMillies = Math.abs(endDate.getTime() - startDate.getTime());
        long diffInDays = diffInMillies / (1000 * 60 * 60 * 24);
        if (diffInDays < 1) {
            error = "Sự kiện phải kéo dài ít nhất 1 ngày";
            req.setAttribute("error", error);
            viewDetail(req, resp);
            return;
        }

        // Validate 6: Kiểm tra trùng lịch với sự kiện khác trong cùng địa điểm
        if (eventDAO.hasOverlappingEvents(area, startDate, endDate, eventId)) {
            error = "Địa điểm này đã có sự kiện khác trong khoảng thời gian này";
            req.setAttribute("error", error);
            viewDetail(req, resp);
            return;
        }

        // Cập nhật thông tin
        event.setTitle(title);
        event.setArea_id(area);
        event.setStart(startDate);
        event.setEnd(endDate);
        event.setDescription(description);

        if (eventDAO.update(event)) {
            req.setAttribute("success", "Cập nhật thành công!");
            viewDetail(req, resp);
        } else {
            error = "Cập nhật thất bại!";
            req.setAttribute("error", error);
            viewDetail(req, resp);
        }
    }

    protected void updateTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer eventId = Integer.parseInt(req.getParameter("eventId"));
        Integer taskId = Integer.parseInt(req.getParameter("taskId"));
        String taskName = req.getParameter("taskName");
        String taskDescription = req.getParameter("taskDescription");
        TaskDAO taskDAO = new TaskDAO();
        taskDAO.updateTaskWithEventCheck(taskId, eventId, taskName, taskDescription);
        viewDetail(req, resp);
    }

}
