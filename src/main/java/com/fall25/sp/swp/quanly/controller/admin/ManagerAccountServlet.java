/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fall25.sp.swp.quanly.controller.admin;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ManagerAccountServlet", urlPatterns = {"/manager-account"})
public class ManagerAccountServlet extends HttpServlet {

    AccountDAO accountDAO = new AccountDAO();

    public static final String URL_LIST_ACCOUNT = "view/admin/admin/list-account.jsp";
    public static final String URL_ACCOUNT = "view/admin/admin/account.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "list-account":
                viewListAccount(request, response);
                break;
            case "account-detail":
                viewAccoutDetail(request, response);
                break;
            case "account-update":
                updateAccount(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "account-update":
                updateAccountDoPost(request, response);
                break;
            case "account-delete":
                deleteAccountDoPost(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void viewListAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // gọi tới hàm findAll() của AccountDAO
        List<Account> listAccount = accountDAO.findAll();
        // set list vào request
        request.setAttribute("listAccount", listAccount);
        request.getRequestDispatcher(URL_LIST_ACCOUNT).forward(request, response);
    }

    private void viewAccoutDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        // find account by ID
        Account account = accountDAO.findById(id);
        // navigate
        request.setAttribute(GlobalConfig.SESSION_ACCOUNT, account);
        request.setAttribute("typeOfAction", "view");
        request.getRequestDispatcher(URL_ACCOUNT).forward(request, response);
    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        // find account by ID
        Account account = accountDAO.findById(id);
        // navigate
        request.setAttribute(GlobalConfig.SESSION_ACCOUNT, account);
        request.setAttribute("typeOfAction", "update");
        request.getRequestDispatcher(URL_ACCOUNT).forward(request, response);
    }

    private void updateAccountDoPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Lấy các trường dữ liệu từ form
            Integer id = Integer.parseInt(request.getParameter("id"));

            // Lấy thông tin tài khoản hiện tại từ database để giữ nguyên các trường
            // readonly
            Account currentAccount = accountDAO.findById(id);

            if (currentAccount != null) {
                // Lấy các trường có thể chỉnh sửa từ form
                String role = request.getParameter("role");
                String status = request.getParameter("status");
                String address = request.getParameter("address");

                // Cập nhật thông tin mới cho tài khoản
                currentAccount.setRole(role);
                currentAccount.setStatus(status);
                currentAccount.setAddress(address);
                currentAccount.setUpdated_at(new java.sql.Date(System.currentTimeMillis()));

                // Thực hiện cập nhật vào database
                boolean result = accountDAO.update(currentAccount);
                // Set kết quả lên session

                if (result) {
                    // Chuyển hướng về trang danh sách tài khoản nếu cập nhật thành công
                    request.setAttribute("isSuccess", true);
                    request.setAttribute(GlobalConfig.SESSION_ACCOUNT, currentAccount);
                    request.getRequestDispatcher(URL_ACCOUNT).forward(request, response);
                } else {
                    request.setAttribute("isSuccess", false);
                    request.setAttribute(GlobalConfig.SESSION_ACCOUNT, currentAccount);
                    request.getRequestDispatcher(URL_ACCOUNT).forward(request, response);
                }
            } else {
                // Xử lý trường hợp không tìm thấy tài khoản
                response.sendRedirect(request.getContextPath() + "/manager-account?action=list-account");
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
            try {
                response.sendRedirect(request.getContextPath() + "/manager-account?action=list-account&error=update-failed");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    private void deleteAccountDoPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy ID của tài khoản cần xóa từ request
            Integer id = Integer.parseInt(request.getParameter("id"));

            // Thực hiện xóa tài khoản từ database
            Account deleteAccount = accountDAO.findById(id);
            boolean result = accountDAO.delete(deleteAccount);

            //Goi lai list account
            List<Account> listAccount = accountDAO.findAll();

            // Set kết quả lên session
            request.setAttribute("isSucess", result);
            request.setAttribute("listAccount", listAccount);
            // Chuyển hướng về trang danh sách tài khoản  
            request.getRequestDispatcher(URL_LIST_ACCOUNT).forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
