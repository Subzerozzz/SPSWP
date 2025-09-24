package com.fall25.sp.swp.quanly.controller.authen;

import com.fall25.sp.swp.quanly.dal.implement.AccountDAO;
import com.fall25.sp.swp.quanly.entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.sql.Date;

@WebServlet("/registerAccount")
public class RegisterAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String gender =  req.getParameter("gender");
        String address = req.getParameter("address");
        String studentID = req.getParameter("studentId");
        String dobStr = req.getParameter("dob");
        String phone = req.getParameter("phone");

        Date dob = null;
        try {
            LocalDate localDate = LocalDate.parse(dobStr); // format mặc định yyyy-MM-dd
            dob = Date.valueOf(localDate);
        } catch (DateTimeParseException e) {
            req.setAttribute("error", "Ngày sinh không hợp lệ!");
            req.getRequestDispatcher("view/guest/authen/registerAccount.jsp").forward(req, resp);
            return;
        }

        String validationMessage = validateRegisterInput(email, fullname, password, confirmPassword, gender, address, studentID, dob, phone);

        if (validationMessage != null) {
            req.setAttribute("error", validationMessage);
            req.getRequestDispatcher("view/guest/authen/registerAccount.jsp").forward(req, resp);
            return;
        }
        else{
            Account account = new Account();
            AccountDAO  accountDAO = new AccountDAO();
            account.setEmail(email);
            account.setFullname(fullname);
            account.setPassword(LoginServlet.hashPassword(password));
            account.setAddress(address);
            account.setGender(gender);
            account.setBod(dob);
            account.setPhone(phone);
            account.setStudent_id(studentID);
            account.setStatus("active");
            if(accountDAO.insert(account)!=-1){
                req.setAttribute("success", "Register Success");
                req.getRequestDispatcher("view/guest/authen/login.jsp").forward(req, resp);
            }
        }
    }

    private String validateRegisterInput(String email, String fullname, String password, String confirmPassword,
                                         String gender, String address, String studentID, Date dob, String phone) {

        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            return "Email không hợp lệ!";
        }
        if (fullname == null || fullname.trim().isEmpty()) {
            return "Họ và tên không được để trống!";
        }
        if (password == null || password.length() < 6) {
            return "Mật khẩu phải có ít nhất 6 ký tự!";
        }
        if (!password.equals(confirmPassword)) {
            return "Mật khẩu nhập lại không khớp!";
        }
        if (gender == null || !(gender.equalsIgnoreCase("male") || gender.equalsIgnoreCase("female"))) {
            return "Giới tính không hợp lệ!";
        }
        if (address == null || address.trim().isEmpty()) {
            return "Địa chỉ không được để trống!";
        }
        if (studentID == null || studentID.trim().isEmpty()) {
            return "Mã sinh viên không được để trống!";
        }
        if (dob == null) {
            return "Ngày sinh không hợp lệ!";
        }
        if (phone == null || !phone.matches("^[0-9]{9,11}$")) {
            return "Số điện thoại phải từ 9-11 chữ số!";
        }
        return null;
    }

}
