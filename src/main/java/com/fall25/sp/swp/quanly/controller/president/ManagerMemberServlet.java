package com.fall25.sp.swp.quanly.controller.president;

import com.fall25.sp.swp.quanly.dal.implement.AccountClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/managerMember")
public class ManagerMemberServlet extends HttpServlet {
    private static final String URL_MANAGER_MEMBER = "view/admin/president/listMember.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int id = (int) session.getAttribute("userId");
        System.out.println("id = " + id);

        ClubDAO clubDAO = new ClubDAO();
        AccountClubDAO accountClubDAO = new AccountClubDAO();
        AccountDAO accountDAO = new AccountDAO();

        // Tìm club do president quản lý
        Club club = clubDAO.findByPresidentId(id);
        System.out.println("club = " + club);

        if (club != null) {
            List<Integer> listIdMember = new ArrayList<>();
            List<AccountClub> accountClubs = accountClubDAO.findByClubId(club.getId());
            System.out.println("accountClubs = " + accountClubs);

            if (accountClubs != null) {
                for (AccountClub a : accountClubs) {
                    listIdMember.add(a.getAccount_id());
                }
            }

            System.out.println("listIdMember = " + listIdMember);

            if (!listIdMember.isEmpty()) {
                List<Account> listAccount = new ArrayList<>();
                for (Integer memberId : listIdMember) {
                    System.out.println("memberId = " + memberId);
                    Account acc = accountDAO.findById(memberId);
                    System.out.println("acc = " + acc);
                    if (acc != null) {
                        listAccount.add(acc);
                    }
                }
                System.out.println("listAccount = " + listAccount);
                req.setAttribute("listAccount", listAccount);
            }
        }

        req.getRequestDispatcher(URL_MANAGER_MEMBER).forward(req, resp);
    }

}
