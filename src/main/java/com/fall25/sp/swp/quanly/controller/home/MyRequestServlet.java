package com.fall25.sp.swp.quanly.controller.home;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.EventDAO;
import com.fall25.sp.swp.quanly.dal.implement.RequestJoinClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.RequestJoinEventDAO;
import com.fall25.sp.swp.quanly.entity.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/myRequest")
public class MyRequestServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                view(request, response);
                break;
        }
    }
    protected void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;
        if (accountClub == null) {
            request.getRequestDispatcher("view/guest/authen/login.jsp").forward(request, response);
        }
        else {
            Integer accountID = accountClub.getAccount_id();

            // Lấy danh sách request
            List<RequestJoinEvent> eventList = new RequestJoinEventDAO().findByAccountId(accountID);
            List<RequestJoinClub> clubList = new RequestJoinClubDAO().findByAccountId(accountID);

            // Tạo map để lấy tên event, club và CLB tổ chức sự kiện
            EventDAO eventDAO = new EventDAO();
            ClubDAO clubDAO = new ClubDAO();

            Map<Integer, String> eventMap = new HashMap<>();
            Map<Integer, String> clubMap = new HashMap<>();
            Map<Integer, String> eventClubMap = new HashMap<>(); // Map mới cho CLB tổ chức

            for (RequestJoinEvent rq : eventList) {
                Event event = eventDAO.findById(rq.getEventId());
                if (event != null) {
                    eventMap.put(rq.getId(), event.getTitle());

                    // Lấy thông tin CLB tổ chức sự kiện
                    Club club = clubDAO.findById(event.getClub_id());
                    if (club != null) {
                        eventClubMap.put(rq.getId(), club.getName());
                    } else {
                        eventClubMap.put(rq.getId(), "Không xác định");
                    }
                }
            }

            for (RequestJoinClub rq : clubList) {
                Club club = clubDAO.findById(rq.getClubId());
                if (club != null) {
                    clubMap.put(rq.getId(), club.getName());
                }
            }

            request.setAttribute("eventList", eventList);
            request.setAttribute("clubList", clubList);
            request.setAttribute("eventMap", eventMap);
            request.setAttribute("clubMap", clubMap);
            request.setAttribute("eventClubMap", eventClubMap); // Thêm map mới

            request.getRequestDispatcher("view/guest/page/myRequest.jsp").forward(request, response);
        }
    }
}