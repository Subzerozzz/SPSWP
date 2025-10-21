package com.fall25.sp.swp.quanly.controller.authen;

import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.SecureRandom;

@WebServlet("/forgotPass")
public class ForgotPasswordServlet extends HttpServlet {
    private static final String CHARACTERS =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";

    public static String generateRandomPassword(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(CHARACTERS.length());
            password.append(CHARACTERS.charAt(index));
        }

        return password.toString();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        if (email == null) {
            req.setAttribute("notifi", "Điền email");
            req.getRequestDispatcher("view/guest/authen/forgotPassword.jsp").forward(req, resp);
        }
        else{
            AccountDAO dao = new AccountDAO();
            if(dao.findByEmail(email)==null){
                req.setAttribute("notifi","Email không tồn tại");
                req.getRequestDispatcher("view/guest/authen/forgotPassword.jsp").forward(req, resp);
            }
            else{
                String newPass =  generateRandomPassword(10);
                String hashPass = LoginServlet.hashPassword(newPass);
                int id = dao.findByEmail(email).getId();
                if(dao.updatePassword(id,hashPass)&&SendEmail.sendNewPassWord(email,newPass)){
                    req.setAttribute("notifi","Đã gửi mật khẩu mới tới email "+email);
                    req.getRequestDispatcher("view/guest/authen/forgotPassword.jsp").forward(req, resp);
                }

            }
        }
    }
}
