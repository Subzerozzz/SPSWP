package com.fall25.sp.swp.quanly.controller.president;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/managerMember")
public class ManagerMemberServlet extends HttpServlet {
    private static final String URL_MANAGER_MEMBER = "view/admin/president/listMember.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action){
            case "view":
                viewList(req,resp);
                break;
            default:
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action){
            case "delete":
                deleteMember(req,resp);
                break;
            default:
                break;
        }
    }
    
    protected void viewList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;

        Integer clubId = (accountClub != null) ? accountClub.getClub_id() : null;

        if (clubId == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

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
                    accountRoles.put(acc.getId(), ac.getRole());
                }
            }
        }

        req.setAttribute("listAccount", listAccount);
        req.setAttribute("accountRoles", accountRoles);
        req.getRequestDispatcher(URL_MANAGER_MEMBER).forward(req, resp);
    }

    protected void deleteMember(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer accountId = Integer.parseInt(req.getParameter("accountId"));
        AccountClubDAO accountClubDAO = new AccountClubDAO();
        HttpSession session = req.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;
        Integer clubId = (accountClub != null) ? accountClub.getClub_id() : null;
        String name = new AccountDAO().findById(accountId).getFullname();
        if(accountClubDAO.delete(accountClubDAO.findByAccountIdAndClubId(accountId, clubId))){
            req.setAttribute("deleteMemberSuccess", "Xóa "+name+" thành công!");
            viewList(req,resp);
        }
    }

}
