package com.fall25.sp.swp.quanly.controller.member;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AreaDAO;
import com.fall25.sp.swp.quanly.dal.implement.EventDAO;
import com.fall25.sp.swp.quanly.dal.implement.TaskDAO;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import com.fall25.sp.swp.quanly.entity.Area;
import com.fall25.sp.swp.quanly.entity.Event;
import com.fall25.sp.swp.quanly.entity.Task;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

@WebServlet("/memberTask")
public class memberTask extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session / accountClub null-safe
        HttpSession session = request.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;

        Integer clubId = (accountClub != null) ? accountClub.getClub_id() : null;
        Integer accountId = (accountClub != null) ? accountClub.getAccount_id() : null;

        EventDAO eventDAO = new EventDAO();
        AreaDAO areaDAO = new AreaDAO();
        TaskDAO taskDAO = new TaskDAO();

        Map<Integer, String> areaMap = new HashMap<>();
        List<Event> listEvent = new ArrayList<>();
        List<Area> listArea = areaDAO.findAll();

        // Lấy danh sách event theo clubId
        listEvent = eventDAO.findByClubId(clubId);

        // Tạo areaMap
        for (Area area : listArea) {
            areaMap.put(Integer.parseInt(area.getId()), area.getName());
        }

        // Tạo Map chứa danh sách task theo eventId
        Map<Integer, List<Map<String, Object>>> taskMap = new HashMap<>();

        for (Event event : listEvent) {
            // Lấy danh sách task theo eventId
            List<Map<String, Object>> listTask = taskDAO.findByEventId(event.getId());
            taskMap.put(event.getId(), listTask);
        }

        // Nếu bạn muốn lấy task theo cả accountId (nhiệm vụ của user cụ thể)
        Map<Integer, List<Map<String, Object>>> userTaskMap = new HashMap<>();
        if (accountId != null) {
            for (Event event : listEvent) {
                // Lấy danh sách task theo eventId VÀ accountId
                List<Map<String, Object>> userTasks = new ArrayList<>();
                List<Map<String, Object>> allTasks = taskDAO.findByEventId(event.getId());

                for (Map<String, Object> task : allTasks) {
                    Integer taskAccountId = (Integer) task.get("account_id");
                    if (taskAccountId != null && taskAccountId.equals(accountId)) {
                        userTasks.add(task);
                    }
                }
                userTaskMap.put(event.getId(), userTasks);
            }
        }

        request.setAttribute("listEvent", listEvent);
        request.setAttribute("listArea", listArea);
        request.setAttribute("areaMap", areaMap);
        request.setAttribute("taskMap", taskMap); // Tất cả task theo event
        request.setAttribute("userTaskMap", userTaskMap); // Task của user cụ thể theo event
        request.getRequestDispatcher("view/admin/member/viewTask.jsp").forward(request, response);
    }
}
