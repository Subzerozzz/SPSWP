package com.fall25.sp.swp.quanly.controller.president;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import com.fall25.sp.swp.quanly.entity.Club;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/changePresident")
public class ChangePresidentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session / accountClub null-safe
        HttpSession session = request.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;
        Account account = (Account) session.getAttribute(GlobalConfig.SESSION_ACCOUNT);

        Integer clubId = (accountClub != null) ? accountClub.getClub_id() : null;
        Integer presidentId = (accountClub != null) ? accountClub.getAccount_id() : null;

        Club club = new ClubDAO().findById(clubId);
        request.setAttribute("club", club);
        request.setAttribute("account", account);

        request.getRequestDispatcher("view/admin/president/changePresident.jsp").forward(request, response);
    }
}
