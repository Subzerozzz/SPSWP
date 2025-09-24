package com.fall25.sp.swp.quanly.controller.authen;

import com.fall25.sp.swp.quanly.entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import jakarta.servlet.http.HttpSession;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    AccountDAO dao = new AccountDAO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username == null || password == null) {
            req.setAttribute("error", "Nhập đủ mật khẩu hoặc email");
            req.getRequestDispatcher("view/guest/authen/login.jsp").forward(req, resp);
        }
        else{
            
            Account ac = dao.findByEmail(username);
            if(ac == null){
                req.setAttribute("error","Tài khoản không tồn tại");
                req.getRequestDispatcher("view/guest/authen/login.jsp").forward(req, resp);
            }
            else if(LoginServlet.verifyPassword(password,ac.getPassword())){
                HttpSession session = req.getSession();
                session.setAttribute("userName", ac.getEmail());
                session.setAttribute("userId", ac.getId());
                session.setAttribute("fullName", ac.getFullname());
                session.setAttribute("account",ac);
                req.getRequestDispatcher("view/guest/homePage.jsp").forward(req, resp);
                
            }
            else {
                req.setAttribute("error","Mật khẩu sai");
                req.getRequestDispatcher("view/guest/authen/login.jsp").forward(req, resp);
            }
        }

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
