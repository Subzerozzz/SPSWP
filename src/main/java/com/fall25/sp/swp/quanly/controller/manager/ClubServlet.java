/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fall25.sp.swp.quanly.controller.manager;

import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import com.fall25.sp.swp.quanly.entity.Club;
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
@WebServlet(name = "ClubServlet", urlPatterns = { "/club" })
public class ClubServlet extends HttpServlet {

  private static final String URL_LIST_CLUB = "view/admin/manager/list-club.jsp";

  ClubDAO clubDAO = new ClubDAO();
  AccountDAO accountDAO = new AccountDAO();

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getParameter("action");
    switch (action) {
      case "list-club":
        viewListClub(request, response);
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
      case "add-club":
        addClubDoPost(request, response);
        break;
      default:
        throw new AssertionError();
    }
  }

  private void viewListClub(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    //Lấy ra list club
    List<Club> listClub = clubDAO.findAll();
    //Lấy ra danh sách account
    List<Account> listAccount = accountDAO.findAll();
    //lấy ra danh mục các club
    request.setAttribute("listClub", listClub);
    request.setAttribute("listAccount", listAccount);
    request.getRequestDispatcher(URL_LIST_CLUB).forward(request, response);
  }

  private void addClubDoPost(HttpServletRequest request, HttpServletResponse response) {
    String name = request.getParameter("name");
    Integer presidentId = Integer.parseInt(request.getParameter("presidentId"));
    String description = request.getParameter("description");
    Integer categoryId = Integer.parseInt(request.getParameter("presidentId"));
  }

}
