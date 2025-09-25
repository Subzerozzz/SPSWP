/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fall25.sp.swp.quanly.controller.manager;

import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import com.fall25.sp.swp.quanly.dal.implement.CategoryClubDAO;
import com.fall25.sp.swp.quanly.dal.implement.ClubDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import com.fall25.sp.swp.quanly.entity.CategoryClub;
import com.fall25.sp.swp.quanly.entity.Club;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ClubServlet", urlPatterns = {"/club"})
public class ClubServlet extends HttpServlet {

    private static final String URL_LIST_CLUB = "view/admin/manager/list-club.jsp";

    ClubDAO clubDAO = new ClubDAO();
    AccountDAO accountDAO = new AccountDAO();
    CategoryClubDAO categoryClubDAO = new CategoryClubDAO();

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
        // Lấy ra list club
        List<Club> listClub = clubDAO.findAll();
        // Lấy ra danh sách account
        List<Account> listAccount = accountDAO.findAll();
        // lấy ra danh mục các club
        List<CategoryClub> listCategoryClub = categoryClubDAO.findAll();
        // Gửi dữ liệu lên trang
        request.setAttribute("listCategoryClub", listCategoryClub);
        request.setAttribute("listClub", listClub);
        request.setAttribute("listAccount", listAccount);
        request.getRequestDispatcher(URL_LIST_CLUB).forward(request, response);
    }

    private void addClubDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
                errors.put("error", "Tên câu lạc bộ không được để trống");
            } else if (name.length() > 30) {
                errors.put("error", "Tên câu lạc bộ không được quá 30 ký tự");
            }
            // Check presidentID khac rong va có ton tai không
            if (presidentId == null || presidentId == 0) {
                errors.put("error", "Chọn trưởng câu lạc bộ");
            } else if (accountDAO.findById(presidentId) == null) {
                errors.put("error", "ID chưa chính xác");
            }
            // Check description khác rỗng
            if (description == null || description.trim().isEmpty()) {
                errors.put("error", "Mô tả câu lạc bộ không được để trống");
            }
            // Check category khác rỗng
            if (categoryId == null || categoryId == 0) {
                errors.put("error", "Chọn danh mục câu lạc bộ");
            }

            // Nếu errors tồn tại lỗi thì chuyển về trang danh sách câu lạc bộ
            if (!errors.isEmpty()) {
                for (Map.Entry<String, String> entry : errors.entrySet()) {
                    System.out.println("Error: " + entry.getKey() + " - " + entry.getValue());
                }
                request.setAttribute("errors", errors);
                request.getRequestDispatcher(URL_LIST_CLUB).forward(request, response);
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
            viewListClub(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

}
