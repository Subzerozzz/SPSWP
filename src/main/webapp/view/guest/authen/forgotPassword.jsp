<%--
  Created by IntelliJ IDEA.
  User: vankh
  Date: 9/23/2025
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng Nhập</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: linear-gradient(135deg, #e0f7fa 0%, #bbdefb 100%);
      overflow: hidden;
      position: relative;
    }

    .home-button {
      position: absolute;
      top: 20px;
      left: 20px;
      background: #5c6bc0;
      color: white;
      padding: 12px 20px;
      border-radius: 30px;
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 8px;
      box-shadow: 0 4px 10px rgba(92, 107, 192, 0.3);
      transition: all 0.3s ease;
      z-index: 100;
    }

    .home-button:hover {
      background: #3f51b5;
      transform: translateY(-2px);
      box-shadow: 0 6px 15px rgba(63, 81, 181, 0.4);
    }

    .home-button:active {
      transform: translateY(0);
    }

    .container {
      position: relative;
      width: 500px;
      height: 500px;
      background: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .form-container {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      display: flex;
      transition: transform 0.6s ease-in-out;
    }

    .login-container, .register-container {
      width: 100%;
      padding: 40px;
      flex-shrink: 0;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    .register-container {
      transform: translateX(100%);
    }

    .container.active .login-container {
      transform: translateX(-100%);
    }

    .container.active .register-container {
      transform: translateX(0);
    }

    h2 {
      color: #5c6bc0;
      font-size: 2em;
      margin-bottom: 30px;
      text-align: center;
      text-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    }

    .input-group {
      position: relative;
      width: 100%;
      margin-bottom: 20px;
    }

    .input-group input {
      width: 100%;
      padding: 15px 20px;
      border: none;
      outline: none;
      background: rgba(255, 255, 255, 0.9);
      border-radius: 10px;
      color: #333;
      font-size: 16px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
      border: 1px solid #ddd;
    }

    .input-group input:focus {
      border-color: #5c6bc0;
      box-shadow: 0 0 10px rgba(92, 107, 192, 0.2);
    }

    .input-group input::placeholder {
      color: #aaa;
    }

    .input-group i {
      position: absolute;
      right: 20px;
      top: 15px;
      color: #aaa;
      transition: all 0.3s ease;
    }

    .input-group input:focus + i {
      color: #5c6bc0;
    }

    .remember-forgot {
      display: flex;
      justify-content: space-between;
      width: 100%;
      margin-bottom: 20px;
      font-size: 14px;
      color: #666;
    }

    .remember-forgot label {
      display: flex;
      align-items: center;
      cursor: pointer;
    }

    .remember-forgot input {
      margin-right: 5px;
      accent-color: #5c6bc0;
    }

    .remember-forgot a {
      color: #5c6bc0;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .remember-forgot a:hover {
      color: #3f51b5;
      text-decoration: underline;
    }

    .btn {
      width: 100%;
      padding: 15px;
      border: none;
      border-radius: 10px;
      background: #5c6bc0;
      color: white;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(92, 107, 192, 0.3);
    }

    .btn:hover {
      background: #3f51b5;
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(63, 81, 181, 0.4);
    }

    .btn:active {
      transform: translateY(0);
      box-shadow: 0 3px 10px rgba(63, 81, 181, 0.3);
    }

    .switch-form {
      margin-top: 20px;
      color: #666;
      font-size: 14px;
      text-align: center;
    }

    .switch-form a {
      color: #5c6bc0;
      text-decoration: none;
      font-weight: 600;
      margin-left: 5px;
      transition: all 0.3s ease;
      position: relative;
    }

    .switch-form a::after {
      content: '';
      position: absolute;
      bottom: -2px;
      left: 0;
      width: 0;
      height: 1px;
      background: #5c6bc0;
      transition: width 0.3s ease;
    }

    .switch-form a:hover::after {
      width: 100%;
    }

    .social-login {
      margin-top: 25px;
      width: 100%;
    }

    .social-login p {
      text-align: center;
      color: #666;
      margin-bottom: 15px;
      position: relative;
    }

    .social-login p::before,
    .social-login p::after {
      content: '';
      position: absolute;
      top: 50%;
      width: 30%;
      height: 1px;
      background: #ddd;
    }

    .social-login p::before {
      left: 0;
    }

    .social-login p::after {
      right: 0;
    }

    .social-icons {
      display: flex;
      justify-content: center;
      gap: 15px;
    }

    .social-icons a {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 45px;
      height: 45px;
      border-radius: 50%;
      background: #f5f5f5;
      color: #555;
      text-decoration: none;
      transition: all 0.3s ease;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
    }

    .social-icons a:hover {
      transform: translateY(-3px);
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    }

    .social-icons a:nth-child(1):hover {
      background: #3b5998;
      color: white;
    }

    .social-icons a:nth-child(2):hover {
      background: #1da1f2;
      color: white;
    }

    .social-icons a:nth-child(3):hover {
      background: #db4437;
      color: white;
    }

    @media (max-width: 480px) {
      .container {
        width: 90%;
        height: auto;
        padding: 20px 0;
      }

      .login-container, .register-container {
        padding: 30px 20px;
      }

      .home-button {
        top: 10px;
        left: 10px;
        padding: 10px 15px;
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
<a href="${pageContext.request.contextPath}/view/guest/homePage.jsp" class="home-button">
  <i class="fas fa-home"></i> Trang Chủ
</a>
<div class="container" id="container">
  <div class="form-container">
    <!-- Form Quên Mật Khẩu -->
    <div class="forgot-password-container" style="display:none; width:100%; padding:40px; flex-shrink:0; display:flex; flex-direction:column; justify-content:center; align-items:center;">
      <h2>Quên Mật Khẩu</h2>
      <form id="forgotPasswordForm" method="post" action="${pageContext.request.contextPath}/forgotPass">
        <div class="input-group">
          <input type="email" placeholder="Nhập email của bạn" name="email" required>
        </div>
        <button type="submit" class="btn">Gửi yêu cầu</button>
      </form>
      <div class="switch-form">
        <a href="${pageContext.request.contextPath}/view/guest/authen/login.jsp" id="backToLogin">Quay lại đăng nhập</a>
      </div>
      <div class="social-login" style="margin-top: 15px">
        ${notifi}
      </div>
    </div>
  </div>
</div>

<script>

  // Hiệu ứng cho input
  const inputs = document.querySelectorAll('input');
  inputs.forEach(input => {
    input.addEventListener('focus', () => {
      input.parentElement.classList.add('focus');
    });

    input.addEventListener('blur', () => {
      if (input.value === '') {
        input.parentElement.classList.remove('focus');
      }
    });
  });
</script>
</body>


