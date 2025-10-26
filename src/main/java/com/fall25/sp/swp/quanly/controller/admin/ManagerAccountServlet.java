/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fall25.sp.swp.quanly.controller.admin;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import com.fall25.sp.swp.quanly.dal.implement.AccountClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import com.fall25.sp.swp.quanly.entity.AccountClub;
import com.fall25.sp.swp.quanly.entity.Club;
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
@WebServlet(name = "ManagerAccountServlet", urlPatterns = { "/manager-account" })
public class ManagerAccountServlet extends HttpServlet {

  private static final int ITERATIONS = 65536;
  private static final int KEY_LENGTH = 256;
  private static final int SALT_LENGTH = 16;

  AccountDAO accountDAO = new AccountDAO();
  AccountClubDAO accountClubDao = new AccountClubDAO();
  ClubDAO clubDao = new ClubDAO();
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
      case "account-detail":
        viewAccoutDetail(request, response);
        break;
      case "account-update":
        updateAccount(request, response);
        break;
      case "account-add":
        addAccount(request, response);
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
      case "account-add":
        addAccountDoPost(request, response);
        break;
      case "filter":
        filterChanning(request, response);
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
    // Tim cac cau lac bo ma tk nay dang tham gia
    List<AccountClub> listAccountClubById = accountClubDao.findByAccountId(id);
    // lấy ra các CLB
    List<Club> listClub = clubDao.findAll();
    // navigate
    request.setAttribute(GlobalConfig.SESSION_ACCOUNT, account);
    request.setAttribute("listAccountClubById", listAccountClubById);
    request.setAttribute("listClub", listClub);
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

  private void addAccount(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Lấy ra các club đang tồn tại trong hệ thống
    List<Club> listClub = clubDao.findAll();
    request.setAttribute("listClub", listClub);
    request.getRequestDispatcher("view/admin/admin/add-account.jsp").forward(request, response);
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
        // currentAccount.setRole(role);
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

  private void addAccountDoPost(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    try {
      // Lấy các trường dữ liệu từ form
      String fullname = request.getParameter("fullname");
      String password = request.getParameter("password");
      String email = request.getParameter("email");
      String gender = request.getParameter("gender");
      String dobString = request.getParameter("dob");
      String role = request.getParameter("role");
      Integer clubId = request.getParameter("club") != null ? Integer.parseInt(request.getParameter("club")) : 0;
      String student_id = request.getParameter("student_id");
      String address = request.getParameter("address");
      String phone = request.getParameter("phone");

      // Tạo danh sách lỗi
      HashMap<String, String> errors = new HashMap<>();

      // Kiểm tra các trường dữ liệu
      if (fullname == null || fullname.isEmpty()) {
        errors.put("fullname", "Họ và tên không được để trống");
      }
      if (password == null || password.isEmpty()) {
        errors.put("password", "Mật khẩu không được để trống");
      } else if (password.length() < 6) {
        errors.put("password", "Mật khẩu phải có ít nhất 6 ký tự");
      }

      if (email == null || email.isEmpty()) {
        errors.put("email", "Email không được để trống");
      }
      if (gender == null || gender.isEmpty()) {
        errors.put("gender", "Giới tính không được để trống");
      }
      // check dob không null và phải nằm trong số tuổi 18 - 25
      if (dobString == null || dobString.isEmpty()) {
        errors.put("dob", "Ngày sinh không được để trống");
      }
      if (role == null || role.isEmpty()) {
        errors.put("role", "Vai trò không được để trống");
      }
      if (clubId == null || clubId == 0) {
        errors.put("club", "CLB không được để trống");
      }

      // Kiểm tra xem errors.size > 0 thì chuyển lại trang add-account với lỗi
      if (errors.size() > 0) {
        request.setAttribute("errors", errors);
        request.setAttribute("listClub", clubDao.findAll());
        request.getRequestDispatcher("view/admin/admin/add-account.jsp").forward(request, response);
        return;
      }

      // Chuyển đổi chuỗi ngày tháng thành đối tượng Date
      java.sql.Date dob = null;
      if (dobString != null && !dobString.isEmpty()) {
        try {
          // Giả sử định dạng ngày là dd/mm/yyyy
          String[] dateParts = dobString.split("/");
          if (dateParts.length == 3) {
            String formattedDate = dateParts[2] + "-" + dateParts[1] + "-" + dateParts[0];
            dob = java.sql.Date.valueOf(formattedDate);
          }
        } catch (Exception e) {
          // Xử lý lỗi chuyển đổi ngày tháng
          e.printStackTrace();
        }
      }

      // Tạo đối tượng Account mới
      Account newAccount = new Account();
      newAccount.setFullname(fullname);
      newAccount.setPassword(hashPassword(password));
      newAccount.setEmail(email);
      newAccount.setGender(gender);
      newAccount.setBod(dob);
      newAccount.setStudent_id(student_id);
      newAccount.setAddress(address);
      newAccount.setPhone(phone);
      newAccount.setStatus("active"); // Mặc định trạng thái là active

      // Thiết lập thời gian tạo và cập nhật
      java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
      newAccount.setCreated_at(currentDate);
      newAccount.setUpdated_at(currentDate);

      // Thực hiện thêm tài khoản vào database
      boolean result = accountDAO.insert(newAccount) != -1 ? true : false;

      if (result) {
        // Thêm vào bảng account_club
        AccountClub accountClub = new AccountClub();
        accountClub.setAccount_id(accountDAO.findLastId().getId());
        accountClub.setClub_id(clubId);
        accountClub.setRole(role);

        accountClubDao.insert(accountClub);
        // Goi toi ham thong báo tk được gửi qua email
        emailUtils.sendAccountMail(email, email, password);

        // Chuyển hướng về trang danh sách tài khoản nếu thêm thành công
        List<Account> listAccount = accountDAO.findAll();
        session.setAttribute("listAccount", listAccount);
        session.setAttribute("addSuccess", true);
        session.setAttribute("message", "Thêm tài khoản thành công !");
        response.sendRedirect(URL_LIST_ACCOUNT);
        // request.getRequestDispatcher(URL_LIST_ACCOUNT).forward(request, response);
      } else {
        // Chuyển hướng về trang thêm tài khoản nếu thêm thất bại
        session.setAttribute("addSuccess", false);
        session.setAttribute("message", "Thêm tài khoản thất bại");
        request.getRequestDispatcher("view/admin/admin/add-account.jsp").forward(request, response);
      }
    } catch (Exception e) {
      // Xử lý ngoại lệ
      e.printStackTrace();
      try {
        request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
        request.getRequestDispatcher("view/admin/admin/add-account.jsp").forward(request, response);
      } catch (ServletException | IOException ex) {
        ex.printStackTrace();
      }
    }
  }

  public static String hashPassword(String password) {
    try {
      byte[] salt = new byte[SALT_LENGTH];
      new SecureRandom().nextBytes(salt);

      PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH);
      SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
      byte[] hash = skf.generateSecret(spec).getEncoded();

      // Lưu salt và hash
      return Base64.getEncoder().encodeToString(salt) + "$"
          + Base64.getEncoder().encodeToString(hash);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi mã hoá mật khẩu", e);
    }
  }

  private void filterChanning(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String status = request.getParameter("status");
    //Gọi tới accountDAO để filter 
    List<Account> listAccount = accountDAO.filter(name , email, status);
    //Gui du lieu cu ve
    request.setAttribute("name", name);
    request.setAttribute("email", email);
    request.setAttribute("status", status);
    // set list vào request
    request.setAttribute("listAccount", listAccount);
    request.getRequestDispatcher(URL_LIST_ACCOUNT).forward(request, response);
  }

}
