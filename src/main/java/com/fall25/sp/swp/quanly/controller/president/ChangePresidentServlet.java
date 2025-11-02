package com.fall25.sp.swp.quanly.controller.president;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AccountClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.RequestFormDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import com.fall25.sp.swp.quanly.entity.Club;
import com.fall25.sp.swp.quanly.entity.RequestForm;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

@WebServlet("/changePresident")
public class ChangePresidentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                viewForm(request, response);
                break;
            case "viewByManager":
                viewList(request, response);
                break;
            default:
                break;
        }
    }

    protected void viewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session / accountClub null-safe
        HttpSession session = request.getSession(false);
        AccountClub accountClub = (session != null) ? (AccountClub) session.getAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB) : null;
        Account account = (Account) session.getAttribute(GlobalConfig.SESSION_ACCOUNT);

        Integer clubId = (accountClub != null) ? accountClub.getClub_id() : null;
        Integer presidentId = (accountClub != null) ? accountClub.getAccount_id() : null;

        if (clubId == null || presidentId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        AccountClubDAO accountClubDAO = new AccountClubDAO();
        List<AccountClub> listAccountClub = accountClubDAO.findByClubId(clubId);

        // Lấy danh sách thành viên CLB với role
        List<Account> listAccount = new ArrayList<>();
        Map<Integer, String> accountRoles = new HashMap<>();
        AccountDAO accountDAO = new AccountDAO();

        if (listAccountClub != null) {
            for (AccountClub ac : listAccountClub) {
                Account acc = accountDAO.findById(ac.getAccount_id());
                if (acc != null && !acc.getId().equals(presidentId)) { // Lọc bỏ president
                    listAccount.add(acc);
                    accountRoles.put(acc.getId(), ac.getRole());
                }
            }
        }

        Club club = new ClubDAO().findById(clubId);

        // Set các attribute
        request.setAttribute("club", club);
        request.setAttribute("account", account);
        request.setAttribute("listAccount", listAccount);
        request.setAttribute("accountRoles", accountRoles);
        request.setAttribute("currentPresidentId", presidentId); // Thêm current president id

        request.getRequestDispatcher("view/admin/president/changePresident.jsp").forward(request, response);
    }

    protected void viewList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<RequestForm> requestForms = new RequestFormDAO().findAll();
//        List<Account> accounts = new AccountDAO().findAll();
        Map<Integer, Account>  mapAccounts1 = new HashMap<>();
        Map<Integer, Account>  mapAccounts2 = new HashMap<>();
        Map<Integer, Club> mapClubs = new  HashMap<>();
         for (RequestForm r : requestForms) {
             Account a = new AccountDAO().findById(r.getAccountIdReq());
             if (a != null) {
                 mapAccounts1.put(a.getId(), a);
             }
         }
        for (RequestForm r : requestForms) {
            Account a = new AccountDAO().findById(r.getPresidentIdNew());
            if (a != null) {
                mapAccounts2.put(a.getId(), a);
            }
        }
        for (RequestForm r : requestForms) {
            Club club = new ClubDAO().findById(r.getClubID());
            if (club != null) {
                mapClubs.put(club.getId(), club);
            }
        }

        System.out.println("done here");
        System.out.println(requestForms);
        System.out.println(mapAccounts1);
        System.out.println(mapAccounts2);
        System.out.println(mapClubs);

        request.setAttribute("requestForms", requestForms);
        request.setAttribute("mapAccounts1", mapAccounts1);
        request.setAttribute("mapAccounts2", mapAccounts2);
        request.setAttribute("mapClubs", mapClubs);
        request.getRequestDispatcher("view/admin/manager/listRequest.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "changePresident":
                changePresident(request, response);
                break;
            case "updateStatusForm":
                updateStatusForm(request, response);
                break;
            default:
                break;

        }
    }

    protected void updateStatusForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer requestId = Integer.parseInt(request.getParameter("requestId"));
        String status =  request.getParameter("status");

        RequestForm requestForm = new RequestFormDAO().findById(requestId);
        requestForm.setStatus(status);
        RequestFormDAO requestFormDAO = new RequestFormDAO();
        if(requestFormDAO.update(requestForm)) {
            viewList(request, response);
        }
    }

    protected void changePresident(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer clubId = Integer.parseInt(request.getParameter("clubId"));
        Integer preIdReq = Integer.parseInt(request.getParameter("accountId"));
        Integer preIdNew = Integer.parseInt(request.getParameter("preNew"));
        String reasonType = request.getParameter("reason_type");
        String description =  request.getParameter("reason_description");

        RequestFormDAO requestFormDAO = new RequestFormDAO();
        RequestForm requestForm = new RequestForm();
        requestForm.setAccountIdReq(preIdReq);
        requestForm.setPresidentIdNew(preIdNew);
        requestForm.setClubID(clubId);

        switch (reasonType.toUpperCase()) {
            case "GRADUATION":
                requestForm.setTypeReason(RequestForm.ReasonType.GRADUATION);
                break;
            case "TRANSFER":
                requestForm.setTypeReason(RequestForm.ReasonType.TRANSFER);
                break;
            case "PERSONAL":
                requestForm.setTypeReason(RequestForm.ReasonType.PERSONAL);
                break;
            case "PERFORMANCE":
                requestForm.setTypeReason(RequestForm.ReasonType.PERFORMANCE);
                break;
            case "ELECTION":
                requestForm.setTypeReason(RequestForm.ReasonType.ELECTION);
                break;
            case "OTHER":
                requestForm.setTypeReason(RequestForm.ReasonType.OTHER);
                break;
            default:
                break;
        }
        requestForm.setDescription(description);
        requestForm.setStatus("pending");

        if(requestFormDAO.insert(requestForm)>0){
            request.setAttribute("successReq", "Tạo yêu cầu đổi trưởng CLB thành công, chờ quản lý xác nhận!");
            viewForm(request, response);
        }

    }
}
