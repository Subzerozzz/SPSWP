/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fall25.sp.swp.quanly.controller.admin;

import com.fall25.sp.swp.quanly.config.GlobalConfig;

import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;

import com.fall25.sp.swp.quanly.entity.Account;

import com.fall25.sp.swp.quanly.utils.EmailUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Date;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ManagerAccountServlet", urlPatterns = {"/manager-account"})
public class ManagerAccountServlet extends HttpServlet {

    private static final int ITERATIONS = 65536;
    private static final int KEY_LENGTH = 256;
    private static final int SALT_LENGTH = 16;

    AccountDAO accountDAO = new AccountDAO();
    EmailUtils emailUtils = new EmailUtils();

    public static final String URL_LIST_ACCOUNT = "view/admin/admin/list-account.jsp";
    public static final String URL_ACCOUNT = "view/admin/admin/account.jsp";
    public static final String URL_ADD_ACCOUNT = "view/admin/admin/add-account.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "list-account":
                viewListAccount(request, response);
                break;
            case "account-add":
                addAccount(request, response);
                break;
            case "account-detail":
                viewAccoutDetail(request, response);
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
            case "account-delete":
                deleteAccountDoPost(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void viewListAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // gọi tới hàm findAll() của AccountDAO
        List<Account> listAccount = accountDAO.findAll();
        // set list vào request
        request.setAttribute("listAccount", listAccount);
        request.getRequestDispatcher(URL_LIST_ACCOUNT).forward(request, response);
    }

    private void addAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy ra các club đang tồn tại trong hệ thống
        request.getRequestDispatcher("view/admin/admin/add-account.jsp").forward(request, response);
    }

    private void viewAccoutDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        // find account by ID
        Account account = accountDAO.findById(id);

        request.setAttribute("typeOfAction", "view");
        request.setAttribute(GlobalConfig.SESSION_ACCOUNT, account);
        request.getRequestDispatcher(URL_ACCOUNT).forward(request, response);
    }

    private void deleteAccountDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            // Lấy ID của tài khoản cần xóa từ request
            Integer id = Integer.parseInt(request.getParameter("id"));

            // Thực hiện xóa tài khoản từ database
            Account deleteAccount = accountDAO.findById(id);
            boolean result = accountDAO.delete(deleteAccount);

            // Goi lai list account
            List<Account> listAccount = accountDAO.findAll();

            // Set kết quả lên session
            session.setAttribute("deleteSuccess", result);
            session.setAttribute("message", "Đã xóa tài khoản thành công!");
            session.setAttribute("listAccount", listAccount);
            // Chuyển hướng về trang danh sách tài khoản
            response.sendRedirect(URL_LIST_ACCOUNT);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
