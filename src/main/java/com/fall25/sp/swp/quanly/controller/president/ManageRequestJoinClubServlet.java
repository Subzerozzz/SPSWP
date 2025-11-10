package com.fall25.sp.swp.quanly.controller.president;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AccountClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import com.fall25.sp.swp.quanly.dal.implement.RequestJoinClubDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import com.fall25.sp.swp.quanly.entity.RequestJoinClub;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/joinClub")
public class ManageRequestJoinClubServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "view":
                view(req, resp);
                break;
            default:
                break;
        }
    }

    protected void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestJoinClubDAO requestJoinClubDAO = new RequestJoinClubDAO();
        AccountDAO accountDAO = new AccountDAO();

        HttpSession session = req.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;

        Integer clubId = (accountClub != null) ? accountClub.getClub_id() : null;
        List<RequestJoinClub> listReq = requestJoinClubDAO.findByClubId(clubId).stream()
                .filter(reqJoin -> reqJoin.getStatus().equals("pending"))
                .collect(Collectors.toList());

        List<Account> listAccount = accountDAO.findAll();

        // Tạo Map để liên kết account với request
        Map<Integer, Account> accountMap = listAccount.stream()
                .collect(Collectors.toMap(Account::getId, account -> account));

        System.out.println(accountMap);
        req.setAttribute("listReq", listReq);
        req.setAttribute("accountMap", accountMap);

        req.getRequestDispatcher("/view/admin/president/reqJoinClub.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "approve":
                addClub(req, resp);
                break;
            default:
                break;
        }
    }

    protected void addClub(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer requestId = Integer.parseInt(req.getParameter("requestId"));
        RequestJoinClub requestJoinClub = new RequestJoinClubDAO().findById(requestId);
        if (requestJoinClub == null) {
            req.setAttribute("joinSuccess",false);
            view(req, resp);
        }
        else {
            AccountClub accountClub = new AccountClub();
            accountClub.setClub_id(requestJoinClub.getClubId());
            accountClub.setAccount_id(requestJoinClub.getAccountId());
            accountClub.setRole("member");
            boolean check1 = new AccountClubDAO().insert(accountClub) > 0 ? true:false;
            boolean check2 = new RequestJoinClubDAO().updateStatus(requestId,"active");
            if (check1 && check2) {
                req.setAttribute("joinSuccess",true);
                view(req, resp);
            }
        }
    }
}
