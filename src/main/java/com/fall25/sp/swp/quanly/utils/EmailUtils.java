package com.fall25.sp.swp.quanly.utils;

import com.fall25.sp.swp.quanly.config.GlobalConfig;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Dell
 */
public class EmailUtils {

  public static boolean sendMail(String to, String subject, String content)
      throws AddressException, MessagingException {
    Properties props = new Properties(); // Properties là một lớp có sẵn trong Java dùng để lưu trữ các cặp khóa – giá
    // trị, trong đó cả key và value đều là kiểu String.
    // Thiết lập các thuộc tính cho phiên gửi mail
    props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP server của Gmail
    props.put("mail.smtp.port", "587"); // Cổng TLS của Gmail TLS (Transport Layer Security) là một giao thức bảo mật
    // được thiết kế để mã hóa dữ liệu khi truyền qua Internet
    props.put("mail.smtp.auth", "true"); // Xác thực email để gửi
    props.put("mail.smtp.starttls.enable", "true"); // Bật STARTTLS để bảo mật

    Session session = Session.getInstance(props, new jakarta.mail.Authenticator() { // Session.getInstance đại diện cho
      // 1 phiên gửi email và chứa các
      // thông tin từ props và new
      // jakarta.mail.Authenticator() là
      // để ghi đè cho phương thức
      // getPasswordAuthentication()
      @Override
      protected PasswordAuthentication getPasswordAuthentication() { // Phương thức được gọi tự động khi cần xác thực
        // với Gmail.
        return new PasswordAuthentication(GlobalConfig.USERNAME_EMAIL, GlobalConfig.PASSWORD_APP_EMAIL);
      }
    });

    MimeMessage message = new MimeMessage(session); // Tạo ra một email mới (đối tượng MimeMessage) dựa trên Session đã
    // cấu hình trước đó.
    message.setFrom(new InternetAddress(GlobalConfig.USERNAME_EMAIL)); // Thiết lập địa chỉ người gửi (From).
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to)); // Thiết lập người nhận (To).
    message.setSubject(subject, "UTF-8"); // Thiết lập tiêu đề (subject) của email
    message.setHeader("Content-Type", "text/html; charset=UTF-8"); // Thiết lập header cho email
    message.setContent(content, "text/html; charset=UTF-8"); // Đặt nội dung chính cho email

    Transport.send(message); // Gửi email đi qua SMTP server. Dùng Session đã cấu hình và Authenticator để
    // đăng nhập và gửi
    return true;
  }

  public static String sendOTPMail(String to) {
    int otp = GlobalUtils.generateOTP(6); // Sử dụng phương thức generateOTP để tạo OTP
    String subject = "Mã OTP";
    String content = "Mã OTP của bạn là: " + otp + "<br><br>Mã OTP sẽ hết hạn sau 5 phút.";

    try {
      sendMail(to, subject, content);
    } catch (MessagingException ex) {
      Logger.getLogger(EmailUtils.class.getName()).log(Level.SEVERE, null, ex);
    }

    return otp + "";
  }

  public static String sendAccountMail(String to, String email, String password) throws MessagingException {
    String subject = "Tài Khoản Truy Cập Hệ Thống CLubs FPT University:";
    String content = "<h3>Xin chào,</h3>"
        + "<p>Bạn đã được cấp một tài khoản để truy cập hệ thống:</p>"
        + "<p><strong>Tên đăng nhập:</strong> " + email + "</p>"
        + "<p><strong>Mật khẩu:</strong> " + password + "</p>"
        + "<p>Hãy đăng nhập và thay đổi mật khẩu ngay sau lần đăng nhập đầu tiên.</p>"
        + "<br><p>Trân trọng!</p>";

    boolean sent = sendMail(to, subject, content);
    if (sent) {
      return "Gửi tài khoản qua email thành công!";
    } else {
      return "Gửi email thất bại!";
    }
  }

  public static String sendStatusForClub(String email, String status, String reason) throws MessagingException {
    String subject = "Thông báo cập nhật trạng thái câu lạc bộ của bạn:";
    String content = "<h3>Xin chào,</h3>";
    if (status.equals("active")) {
      content += "<p>Câu lạc bộ của bạn đã hoạt động trở lại!</p>";
    } else {
      content += "<p>Câu lạc bộ của bạn không được phép hoạt động trong thời gian tới !</p>";
      content += "Lí do: " + reason;
    }

    boolean sent = sendMail(email, subject, content);
    if (sent) {
      return "Gửi thông báo trạng thái câu lạc bộ qua email thành công!";
    } else {
      return "Gửi email thất bại!";
    }
  }
}
