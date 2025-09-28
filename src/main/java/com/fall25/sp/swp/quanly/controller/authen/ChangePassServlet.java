/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fall25.sp.swp.quanly.controller.authen;

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
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ChangePassServlet", urlPatterns = {"/change-password"})
public class ChangePassServlet extends HttpServlet {

    private static final int ITERATIONS = 65536;
    private static final int KEY_LENGTH = 256;
    private static final int SALT_LENGTH = 16;

    AccountDAO accountDao = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("view/admin/account/change-password.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // lấy ra tk trên session
        Account acc = (Account) session.getAttribute("account");
        // Lấy ra các biến oldPass và newPass
        String oldPass = request.getParameter("old-password");
        String newPass = request.getParameter("new-password");
        // lấy ra old password so sánh với password trên session
        if (!verifyPassword(oldPass, acc.getPassword())) {
            session.setAttribute("changePass", false);
            session.setAttribute("message", "Mật khẩu cũ không đúng !");
            request.getRequestDispatcher("view/admin/account/change-password.jsp").forward(request, response);
            return;
        }
        // nếu đúng thì gọi hàm updatePassword
        accountDao.updatePassword(acc.getId(), hashPassword(newPass));
        session.setAttribute("changePass", true);
        session.setAttribute("message", "Thay đổi mật khẩu thành công");
        request.getRequestDispatcher("view/admin/account/change-password.jsp").forward(request, response);
    }

    public static String hashPassword(String password) {
        try {
            byte[] salt = new byte[SALT_LENGTH];
            new SecureRandom().nextBytes(salt);

            PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH);
            SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            byte[] hash = skf.generateSecret(spec).getEncoded();

            return Base64.getEncoder().encodeToString(salt) + "$"
                    + Base64.getEncoder().encodeToString(hash);
        } catch (Exception e) {
            throw new RuntimeException("Lỗi mã hoá mật khẩu", e);
        }
    }

    public static boolean verifyPassword(String password, String stored) {
        try {
            String[] parts = stored.split("\\$");
            byte[] salt = Base64.getDecoder().decode(parts[0]);
            byte[] hashStored = Base64.getDecoder().decode(parts[1]);

            PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH);
            SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            byte[] hashInput = skf.generateSecret(spec).getEncoded();

            return MessageDigest.isEqual(hashStored, hashInput);
        } catch (Exception e) {
            throw new RuntimeException("Lỗi kiểm tra mật khẩu", e);
        }
    }

}
