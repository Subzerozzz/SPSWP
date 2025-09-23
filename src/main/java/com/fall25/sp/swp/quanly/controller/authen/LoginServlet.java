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
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.List;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("username:" + username);
        System.out.println("password:" + password);
        AccountDAO accountDAO = new AccountDAO();
        List<Account> listAc = accountDAO.findAll();
        for (Account ac : listAc) {
            if (verifyPassword(password,ac.getPassword()) && ac.getEmail().equals(username)) {
                System.out.println("genPass : "+ hashPassword(password));
                System.out.println("Dang nhap thanh cong");
                HttpSession session = request.getSession();
                session.setAttribute("userName", ac.getEmail());
                session.setAttribute("userId", ac.getId());
                session.setAttribute("fullName", ac.getFullname());
                request.getRequestDispatcher("view/guest/homePage.jsp").forward(request, response);
                return;
            }

        }
        request.setAttribute("error", "Sai email hoặc mật khẩu");
        request.getRequestDispatcher("view/authen/login.jsp").forward(request, response);
    }

    private static final int ITERATIONS = 65536;
    private static final int KEY_LENGTH = 256;
    private static final int SALT_LENGTH = 16;

    public static String hashPassword(String password) {
        try {
            byte[] salt = new byte[SALT_LENGTH];
            new SecureRandom().nextBytes(salt);

            PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH);
            SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            byte[] hash = skf.generateSecret(spec).getEncoded();

            // Lưu salt và hash
            return Base64.getEncoder().encodeToString(salt) + "$" +
                    Base64.getEncoder().encodeToString(hash);
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
