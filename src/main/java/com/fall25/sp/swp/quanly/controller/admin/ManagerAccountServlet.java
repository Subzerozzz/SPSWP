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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ManagerAccountServlet", urlPatterns = { "/manager-account" })
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
      Integer id = Integer.parseInt(request.getParameter("id"));
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String fullname = request.getParameter("fullname");
      String email = request.getParameter("email");
      String phone = request.getParameter("phone");
      String address = request.getParameter("address");
      String role = request.getParameter("role");
      String status = request.getParameter("status");
      String student_id = request.getParameter("student_id");
      Account account = new Account(id, username, password, fullname, email, phone, address, role, status, student_id);
      boolean result = accountDAO.update(account);
      if (result) {
        response.sendRedirect(request.getContextPath() + "/manager-account?action=list-account");
      } else {
        response.sendRedirect(request.getContextPath() + "/manager-account?action=account-update&id=" + id);
      }
    } catch (Exception e) {
    }
  }
}
