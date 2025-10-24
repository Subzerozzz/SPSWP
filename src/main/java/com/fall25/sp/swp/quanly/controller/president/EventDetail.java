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
        if ("viewDetail".equals(action)) {
            viewDetail(req, resp);
            return;
        }
        req.getRequestDispatcher("view/admin/president/eventDetail.jsp").forward(req, resp);
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
        AccountClubDAO accountClubDAO = new AccountClubDAO();
        AccountDAO accountDAO = new AccountDAO();

        List<AccountClub> accountClubs = accountClubDAO.findByClubId(clubId);

        if (accountClubs != null) {
            for (AccountClub ac : accountClubs) {
                Account acc = accountDAO.findById(ac.getAccount_id());
                if (acc != null) {
                    listAccount.add(acc);
                    accountRoles.put(acc.getId(), ac.getRole()); // Lưu role vào map
                }
            }
        }

        System.out.println("Total members: " + listAccount.size());
        for(Account acc : listAccount) {
            System.out.println("Member: " + acc.getId() + " - " + acc.getFullname() + " - Role: " + accountRoles.get(acc.getId()));
        }

        TaskDAO taskDAO = new TaskDAO();
        List<Map<String, Object>> tasks = taskDAO.findByEventId(eventId);


        // Đặt attributes
        req.setAttribute("event", event);
        req.setAttribute("areaMap", areaMap);
        req.setAttribute("listAccount", listAccount);
        req.setAttribute("accountRoles", accountRoles);
        req.setAttribute("tasks", tasks);

        req.getRequestDispatcher("view/admin/president/eventDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "addParticipant":
                addTask(req, resp);
                break;
            case "delete":
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
        if(success) {
            System.out.println("Task added successfully");
            viewDetail(req, resp);

        }

    }

}
