/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fall25.sp.swp.quanly.controller.authen;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AccountClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ChooseClubServelet", urlPatterns = { "/choose-club" })
public class ChooseClubServelet extends HttpServlet {

  AccountClubDAO accountClubDao = new AccountClubDAO();
  ClubDAO clubDao = new ClubDAO();

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    // lấy account trên session
    Account accountSession = (Account) session.getAttribute(GlobalConfig.SESSION_ACCOUNT);
    Integer accountID = accountSession.getId();
    // lấy clubID
    Integer clubID = request.getParameter("choose_club") != null ? 
            Integer.parseInt(request.getParameter("choose_club")) : 0;
    AccountClub accountClub = null;
    //Neu clubID != 0 => da tham gia CLB
    //Neu = 0 thi dang la user
    if(clubID != 0){
        accountClub = accountClubDao.findByAccountIdAndClubId(accountID, clubID);
    }
    else{
        accountClub = accountClubDao.findByAccountId(accountID).get(0);
    }
    // Lấy ra accountClub set lên session
    session.setAttribute(GlobalConfig.SESSION_ACCOUNT_CLUB, accountClub);
    request.setAttribute("listClub", clubDao.findAll());
    request.getRequestDispatcher("view/guest/homePage.jsp").forward(request, response);
            
  }

}
