package com.fall25.sp.swp.quanly.controller.authen;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import java.io.IOException;
import java.security.SecureRandom;
import com.fall25.sp.swp.quanly.controller.authen.SendEmail;

import com.fall25.sp.swp.quanly.controller.authen.LoginServlet;

@WebServlet("/forgotPass")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        AccountDAO accountDAO = new AccountDAO();
        if (email != null) {
            if(accountDAO.findByEmail(email)!=null){
                LoginServlet loginServlet = new LoginServlet();
                String newPass = generateRandomPassword(8);
                String genPass = loginServlet.hashPassword(newPass);
                int id = accountDAO.findByEmail(email).getId();
                SendEmail sendEmail = new SendEmail();
                if(sendEmail.SendNewPass(newPass,email)){
                    accountDAO.updatePassword(id,genPass);
                    req.setAttribute("notifi","Đã gửi mật khẩu về mail của bạn");
                    req.getRequestDispatcher("/view/authen/forgotPassword.jsp").forward(req,resp);
                }
            }
            else{
                req.getRequestDispatcher("/view/guest/homePage.jsp").forward(req,resp);

            }
        }
        else{
            req.getRequestDispatcher("/view/guest/homePage.jsp").forward(req,resp);
        }
    }

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
}
