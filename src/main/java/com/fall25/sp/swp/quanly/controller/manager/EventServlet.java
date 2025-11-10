package com.fall25.sp.swp.quanly.controller.manager;


import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AreaDAO;
import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.EventDAO;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import com.fall25.sp.swp.quanly.entity.Area;
import com.fall25.sp.swp.quanly.entity.Club;
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

@WebServlet("/manageEventByManager")
public class EventServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                viewList(request, response);
                break;
            default:
                break;
        }
    }

    protected void viewList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EventDAO eventDAO = new EventDAO();
        AreaDAO areaDAO = new AreaDAO();
        ClubDAO clubDAO = new ClubDAO();
        Map<Integer, String> areaMap = new HashMap<>();
        Map<Integer, String> clubMap = new HashMap<>();
        List<Event> listEvent = eventDAO.findAll();
        List<Area> listArea = areaDAO.findAll();
        List<Club> listClub = clubDAO.findAll();
        for (Area area : listArea) {
            areaMap.put(Integer.parseInt(area.getId()), area.getName());
        }
        for (Club club : listClub) {
            clubMap.put(club.getId(), club.getName());
        }
        System.out.println(clubMap);
        request.setAttribute("listEvent", listEvent);
        request.setAttribute("listArea", listArea);
        request.setAttribute("areaMap", areaMap);
        request.setAttribute("clubMap", clubMap);
        request.getRequestDispatcher("view/admin/manager/listEvent.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "updateStatus":
                updateStatus(request, response);
                break;
            default:
                break;
        }
    }

    protected void updateStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer eventId = Integer.parseInt(request.getParameter("eventId"));
        EventDAO eventDAO = new EventDAO();
        Event event = eventDAO.findById(eventId);
        String status = request.getParameter("status");
        event.setStatus(status);
        if (eventDAO.update(event)) {
            viewList(request, response);
        }
    }

}
