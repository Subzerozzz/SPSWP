package com.fall25.sp.swp.quanly.controller.home;

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
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/clubsForHome")
public class ClubsForHome extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "viewClubs":
                viewClubs(request, response);
                break;
            case "viewDetail":
                viewDetail(request, response);
                break;
            case "joinClub":
                joinclub(request, response);
                break;
            case "joinEvent":
                joinEvent(request, response);
                break;
            default:
                break;
        }
    }

    protected void joinEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;
        if (accountClub == null) {
            request.getRequestDispatcher("view/guest/authen/login.jsp").forward(request, response);
        } else {
            RequestJoinEventDAO  requestJoinEventDAO = new RequestJoinEventDAO();
            Integer eventId = Integer.parseInt(request.getParameter("eventId"));
            System.out.println(eventId);
            System.out.println(accountClub.getAccount_id());
            Integer accountId = accountClub.getAccount_id();
            RequestJoinEvent requestJoinEvent = new RequestJoinEvent();
            requestJoinEvent.setAccountId(accountId);
            requestJoinEvent.setEventId(eventId);
            requestJoinEvent.setStatus("pending");
            requestJoinEventDAO.insert(requestJoinEvent);
            request.setAttribute("joinEvent", true);
            viewDetail(request, response);
        }
    }

    protected void viewClubs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Club> clubList = new ClubDAO().findAll().stream().filter(club -> club.getStatus().equals("active")).collect(Collectors.toList());
        System.out.println("clubList: " + clubList);
        request.setAttribute("clubList", clubList);
        request.getRequestDispatcher("view/guest/page/listClub.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse reqs) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "viewDetail":
                viewDetail(req, reqs);
                break;
            case "submitJoin":
                submitJoinClub(req, reqs);
                break;
            default:
                throw new AssertionError();
        }
    }

    protected void submitJoinClub(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String self = req.getParameter("self");
        String reason = req.getParameter("reason");
        Integer clubId = Integer.parseInt(req.getParameter("clubId"));
        Integer accountId = Integer.parseInt(req.getParameter("accountId"));
        RequestJoinClub requestJoinClub = new  RequestJoinClub();
        requestJoinClub.setClubId(clubId);
        requestJoinClub.setReason(reason);
        requestJoinClub.setAccountId(accountId);
        requestJoinClub.setSelf(self);
        requestJoinClub.setStatus("pending");
        RequestJoinClubDAO requestJoinClubDAO = new RequestJoinClubDAO();
        if(requestJoinClubDAO.insert(requestJoinClub)>0){
            req.setAttribute("joinSuccess", true);
            viewDetail(req, resp);
        }

    }

    protected void joinclub(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;
        if (accountClub == null) {
            req.getRequestDispatcher("view/guest/authen/login.jsp").forward(req, resp);
        } else {
            Account account = new AccountDAO().findById(accountClub.getAccount_id());
            Integer accountId = account.getId();
            Integer clubId = Integer.parseInt(req.getParameter("clubId"));
            Club club = new ClubDAO().findById(clubId);
            RequestJoinClubDAO requestJoinClubDAO = new RequestJoinClubDAO();
            List<RequestJoinClub> listCheck = requestJoinClubDAO.findByAccountId(accountId).stream().filter(requestJoinClub -> requestJoinClub.getClubId() == clubId).collect(Collectors.toList());
            if (listCheck.isEmpty()) {
                req.setAttribute("club", club);
                req.setAttribute("account", account);
                req.getRequestDispatcher("view/guest/page/registerJoinClub.jsp").forward(req, resp);
            }
            else{
                req.setAttribute("joinSuccess", false);
                viewDetail(req, resp);
            }
        }
    }

    protected void viewDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer clubId = Integer.parseInt(request.getParameter("clubId"));
        Club club = new ClubDAO().findById(clubId);

        Date today = new Date(); // Ngày và giờ hiện tại

        List<Event> eventList = new EventDAO().findByClubId(clubId).stream()
                .filter(event -> event.getStatus().equals("active"))
                .filter(event -> {
                    Date endDate = event.getEnd();
                    // So sánh trực tiếp, sẽ bao gồm cả thời gian
                    return endDate != null && !endDate.before(today);
                })
                .collect(Collectors.toList());

        System.out.println("eventList: " + eventList);
        request.setAttribute("eventList", eventList);
        request.setAttribute("club", club);
        request.getRequestDispatcher("view/guest/page/detailClub.jsp").forward(request, response);
    }
}
