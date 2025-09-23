package com.fall25.sp.swp.quanly.controller.authen;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class SendEmail {

    public static boolean sendNewPassWord(String email , String newPass){
        final String username = "khoapvhe181066@fpt.edu.vn";
        final String password = "xpewdawsihwpigoa";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setFrom(new InternetAddress(username, "Hệ thống Quản Lý CLB"));
            message.setSubject("Mật khẩu mới");
            message.setText("Mật khẩu mới của bạn là : " +newPass);

            Transport.send(message);
            System.out.println("Email đã được gửi thành công!");
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        return false;
    }


    public static void main(String[] args) {
        final String username = "khoapvhe181066@fpt.edu.vn";
        final String password = "xpewdawsihwpigoa";


        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Tạo session
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse("receiver_email@gmail.com") // người nhận
            );
            message.setSubject("Test gửi email Java");
            message.setText("Xin chào, đây là email gửi từ ứng dụng Java!");

            // Gửi email
            Transport.send(message);
            System.out.println("Email đã được gửi thành công!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

