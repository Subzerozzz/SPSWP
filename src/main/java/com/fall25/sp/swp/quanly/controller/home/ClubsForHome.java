package com.fall25.sp.swp.quanly.controller.home;

import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.entity.Club;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
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
            default:
                break;
        }
    }

    protected void viewClubs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Club> clubList = new ClubDAO().findAll().stream().filter(club -> club.getStatus().equals("active")).collect(Collectors.toList());
        System.out.println("clubList: " + clubList);
        request.setAttribute("clubList", clubList);
        request.getRequestDispatcher("view/guest/page/listClub.jsp").forward(request, response);
    }
}
