/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fall25.sp.swp.quanly.controller.manager;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AccountClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import com.fall25.sp.swp.quanly.dal.implement.CategoryClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.EventDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import com.fall25.sp.swp.quanly.entity.CategoryClub;
import com.fall25.sp.swp.quanly.entity.Club;
import com.fall25.sp.swp.quanly.utils.EmailUtils;
import jakarta.mail.MessagingException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ClubServlet", urlPatterns = { "/club" })
public class ClubServlet extends HttpServlet {

  private static final String URL_LIST_CLUB = "view/admin/manager/list-club.jsp";
  private static final String URL_DETAIL_CLUB = "view/admin/manager/detail-club.jsp";

  ClubDAO clubDAO = new ClubDAO();
  AccountDAO accountDAO = new AccountDAO();
  CategoryClubDAO categoryClubDAO = new CategoryClubDAO();
  AccountClubDAO accountClubDAO = new AccountClubDAO();
  EventDAO eventDAO = new EventDAO();
  EmailUtils emailUtils = new EmailUtils();

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getParameter("action");
    switch (action) {
      case "list-club":
        viewListClub(request, response);
        break;
      case "detail-club":
        viewDetailClub(request, response);
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
      case "update-club": {
        try {
          updateStatusDoPost(request, response);
        } catch (MessagingException ex) {
          Logger.getLogger(ClubServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
      }
        break;

      case "filterChanning":
        filterChanning(request, response);
        break;
      case "delete-club":
        deleteClubDoPost(request, response);
        break;
      default:
        throw new AssertionError();
    }
  }

  private void viewListClub(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Lấy ra list club
    List<Club> listClubAll = clubDAO.findAll();
    // tong so ban ghi
    Integer totalRecord = listClubAll.size();
    // so ban ghi tren 1 trang
    Integer recordPerPage = GlobalConfig.RECORD_PER_PAGE;
    // so trang
    Integer totalPage = totalRecord % recordPerPage == 0 ? totalRecord % recordPerPage
        : totalRecord / recordPerPage + 1;
    // lấy ra số bản ghi của trang đẩu tiên
    List<Club> listClub = clubDAO.findRecordPerPage(1, recordPerPage);
    // Lấy ra danh sách account
    List<Account> listAccount = accountDAO.findAll();
    // lấy ra danh mục các club
    List<CategoryClub> listCategoryClub = categoryClubDAO.findAll();
    // Gui du lieu ve pagination
    request.setAttribute("totalPage", totalPage);
    request.setAttribute("totalRecord", totalRecord);
    request.setAttribute("currentPage", 1);
    // Gửi dữ liệu lên trang
    request.setAttribute("listCategoryClub", listCategoryClub);
    request.setAttribute("listClub", listClub);
    request.setAttribute("listAccount", listAccount);
    request.getRequestDispatcher(URL_LIST_CLUB).forward(request, response);
  }

  private void addClubDoPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    try {
      String name = request.getParameter("name");
      Integer presidentId = request.getParameter("presidentId").equals("") ? 0
          : Integer.parseInt(request.getParameter("presidentId"));
      String description = request.getParameter("description");
      Integer categoryId = request.getParameter("categoryId").equals("") ? 0
          : Integer.parseInt(request.getParameter("categoryId"));

      // Validate
      Map<String, String> errors = new HashMap<>();
      // Check tên câu lạc bộ khác rỗng và không quá 30 ký tự
      if (name == null || name.trim().isEmpty()) {
        errors.put("name", "Tên câu lạc bộ không được để trống");
      } else if (name.length() > 30) {
        errors.put("name", "Tên câu lạc bộ không được quá 30 ký tự");
      }
      // Check presidentID khac rong va có ton tai không
      if (presidentId == null || presidentId == 0) {
        errors.put("presidentId", "Chọn trưởng câu lạc bộ");
      } else if (accountDAO.findById(presidentId) == null) {
        errors.put("presidentId", "ID chưa chính xác");
      }
      // Check description khác rỗng
      if (description == null || description.trim().isEmpty()) {
        errors.put("description", "Mô tả câu lạc bộ không được để trống");
      }
      // Check category khác rỗng
      if (categoryId == null || categoryId == 0) {
        errors.put("categoryId", "Chọn danh mục câu lạc bộ");
      }

      // Nếu errors tồn tại lỗi thì chuyển về trang danh sách câu lạc bộ
      if (!errors.isEmpty()) {
        request.setAttribute("errors", errors);
        viewListClub(request, response);
        return;
      }

      // Khởi tạo ngay hiện tại cho create_at và update_at
      java.sql.Date currentTimestamp = new java.sql.Date(System.currentTimeMillis());

      // Nếu errors không tồn tại lỗi thì thêm câu lạc bộ
      Club newClub = new Club();
      newClub.setName(name);
      newClub.setPresident_id(presidentId);
      newClub.setDescription(description);
      newClub.setCategory_id(categoryId);
      newClub.setCreated_at(currentTimestamp);
      newClub.setUpdated_at(currentTimestamp);
      newClub.setStatus("active");
      clubDAO.insert(newClub);
      session.setAttribute("addClubSuccess", true);
      session.setAttribute("message", "Thêm câu lạc bộ thành công");

      // thêm bản ghi vào accountClub
      AccountClub newAccountClub = new AccountClub();
      newAccountClub.setAccount_id(presidentId);
      newAccountClub.setClub_id(clubDAO.findLastId().getId());
      newAccountClub.setRole("president");
      accountClubDAO.insert(newAccountClub);
      viewListClub(request, response);
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }

  }

  private void filterChanning(HttpServletRequest request, HttpServletResponse response) {
    // lấy ra name,status,categoryId,page
    String name = request.getParameter("name");
    String status = request.getParameter("status");
    Integer categoryId = request.getParameter("categoryId").equals("") ? 0
        : Integer.parseInt(request.getParameter("categoryId"));
    Integer currentPage = request.getParameter("currentPage") == null ? 1
        : Integer.parseInt(request.getParameter("currentPage"));

    // Phân trang
    // lay ra tong so ban ghi
    List<Club> listClubAll = clubDAO.filterAll(name, status, categoryId);
    Integer totalRecord = listClubAll.size();
    // so trang
    Integer totalPage = totalRecord % GlobalConfig.RECORD_PER_PAGE == 0 ? totalRecord % GlobalConfig.RECORD_PER_PAGE
        : totalRecord / GlobalConfig.RECORD_PER_PAGE + 1;
    // Gui du lieu pagination
    request.setAttribute("totalPage", totalPage);
    request.setAttribute("currentPage", currentPage);

    // Du lieu Club
    // Gọi toi ham filter trong clubDAO
    List<Club> listClub = clubDAO.filter(name, status, categoryId, currentPage, GlobalConfig.RECORD_PER_PAGE);
    // lay du lieu account và categoryClub
    List<Account> listAccount = accountDAO.findAll();
    List<CategoryClub> listCategoryClub = categoryClubDAO.findAll();
    // Gửi dữ liệu lên trang
    request.setAttribute("listAccount", listAccount);
    request.setAttribute("listCategoryClub", listCategoryClub);
    request.setAttribute("listClub", listClub);

    // Gui du lieu cu về
    request.setAttribute("name", name);
    request.setAttribute("status", status);
    request.setAttribute("categoryId", categoryId);

    try {
      request.getRequestDispatcher(URL_LIST_CLUB).forward(request, response);
    } catch (ServletException | IOException e) {
      e.printStackTrace();
    }
  }

  private void deleteClubDoPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    // lấy ra delete-id
    Integer deleteId = Integer.parseInt(request.getParameter("delete-id"));

    // xoa cac bang ghi account_club có delete-id của clb
    List<AccountClub> listAccountClubDeleted = accountClubDAO.findByClubId(deleteId);
    for (AccountClub accountClub : listAccountClubDeleted) {
      accountClubDAO.delete(accountClub);
    }
    // xoa clb
    boolean result = clubDAO.delete(clubDAO.findById(deleteId));

    if (result) {
      session.setAttribute("deleteClubSuccess", true);
      session.setAttribute("message", "Xóa câu lạc bộ thành công");
      viewListClub(request, response);
    } else {
      session.setAttribute("deleteClubSuccess", false);
      session.setAttribute("message", "Xóa câu lạc bộ không thành công");
      viewListClub(request, response);
    }

  }

  private void viewDetailClub(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    Integer clubId = Integer.parseInt(request.getParameter("id"));
    Club club = clubDAO.findById(clubId);
    Integer presidentid = club.getPresident_id();
    Account accountPre = accountDAO.findById(presidentid);
    CategoryClub categoryClub = categoryClubDAO.findById(club.getCategory_id());
    // Lấy số lượng thành viên trong câu lạc bộ
    Integer numberOfClub = accountClubDAO.findByClubId(clubId).size();
    // Lấy số lượng sự kiện trong câu lạc bộ
    Integer numberOfEvent = eventDAO.findByClubId(clubId).size();
    request.setAttribute("numberOfEvent", numberOfEvent);
    request.setAttribute("club", club);
    request.setAttribute("president", accountPre);
    request.setAttribute("categoryClub", categoryClub);
    request.setAttribute("numberOfClub", numberOfClub);
    request.setAttribute("numberOfEvent", numberOfEvent);
    request.getRequestDispatcher(URL_DETAIL_CLUB).forward(request, response);
  }

  private void updateStatusDoPost(HttpServletRequest request, HttpServletResponse response) throws MessagingException {
    // Lấy ra id , status và reason
    Integer id = Integer.parseInt(request.getParameter("id_club"));
    String email = request.getParameter("email_club");
    String status = request.getParameter("status");
    String reason = request.getParameter("reason");
    // Cập nhật trạng thái
    Club clubUpdate = clubDAO.findById(id);
    clubUpdate.setStatus(status);
    // Gửi thông báo qua mail của trưởng câu lạc bộ
    emailUtils.sendStatusForClub(email, status, reason);

  }

}
