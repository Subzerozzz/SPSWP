package com.fall25.sp.swp.quanly.controller.president;


import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AreaDAO;
import com.fall25.sp.swp.quanly.dal.implement.EventDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import com.fall25.sp.swp.quanly.entity.Area;
import com.fall25.sp.swp.quanly.entity.Event;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/manageEvent")
public class ManageEvent extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session / accountClub null-safe
        HttpSession session = request.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;

        Integer clubId = (accountClub != null) ? accountClub.getClub_id() : null;
        EventDAO eventDAO = new EventDAO();
        AreaDAO areaDAO = new AreaDAO();
        Map<Integer, String> areaMap = new HashMap<>();
        List<Event> listEvent = new ArrayList<>();
        List<Area> listArea = areaDAO.findAll();
        if ("president".equals(accountClub.getRole()) || "head".equals(accountClub.getRole())) {
            listEvent = eventDAO.findByClubId(clubId);
            for (Area area : listArea) {
                areaMap.put(Integer.parseInt(area.getId()), area.getName());
            }

            for(Event event : listEvent) {
                System.out.println(event.getStart());
            }
        }

        request.setAttribute("listEvent", listEvent);
        request.setAttribute("listArea", listArea);
        request.setAttribute("areaMap", areaMap); // Thêm areaMap vào request
        request.getRequestDispatcher("view/admin/president/listEvent.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
