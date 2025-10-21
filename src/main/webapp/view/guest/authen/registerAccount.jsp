<%--
  Created by IntelliJ IDEA.
  User: vankh
  Date: 9/24/2025
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- CSS -->
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            display: flex; justify-content: center; align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #e0f7fa 0%, #bbdefb 100%);
            overflow: hidden; position: relative;
        }

        /* Nút Trang chủ */
        .home-button {
            position: absolute; top: 20px; left: 20px;
            background: #5c6bc0; color: white;
            padding: 12px 20px; border-radius: 30px;
            text-decoration: none; display: flex; align-items: center; gap: 8px;
            box-shadow: 0 4px 10px rgba(92, 107, 192, 0.3);
            transition: all 0.3s ease; z-index: 100;
        }
        .home-button:hover {
            background: #3f51b5; transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(63, 81, 181, 0.4);
        }

        /* Khung container */
        .container {
            position: relative; width: 500px; height: 690px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .form-container {
            position: absolute; top: 0; left: 0;
            width: 100%; height: 100%; display: flex;
            transition: transform 0.6s ease-in-out;
        }

        .login-container, .register-container {
            width: 100%; padding: 40px;
            display: flex; flex-direction: column;
            justify-content: center; align-items: center;
            flex-shrink: 0;
        }

        .register-container { transform: translateX(100%); }
        .container.active .login-container { transform: translateX(-100%); }
        .container.active .register-container { transform: translateX(0); }

        h2 {
            color: #5c6bc0; font-size: 2em; margin-bottom: 30px;
            text-align: center; text-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        /* Ô input */
        .input-group {
            position: relative; width: 100%; margin-bottom: 20px;
        }
        .input-group input {
            width: 100%; padding: 5px 10px; border-radius: 10px;
            border: 1px solid #ddd; outline: none;
            font-size: 16px; background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        .input-group input:focus {
            border-color: #5c6bc0;
            box-shadow: 0 0 10px rgba(92, 107, 192, 0.2);
        }

        /* Quên mật khẩu */
        .remember-forgot {
            display: flex; justify-content: center;
            width: 100%; margin-bottom: 20px;
            font-size: 14px; color: #666;
        }
        .remember-forgot a {
            color: #5c6bc0; text-decoration: none; transition: 0.3s;
        }
        .remember-forgot a:hover {
            color: #3f51b5; text-decoration: underline;
        }

        /* Button */
        .btn {
            width: 100%; padding: 15px;
            border: none; border-radius: 10px;
            background: #5c6bc0; color: white;
            font-size: 16px; font-weight: 600;
            cursor: pointer; transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(92, 107, 192, 0.3);
        }
        .btn:hover {
            background: #3f51b5; transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(63, 81, 181, 0.4);
        }

        @media (max-width: 480px) {
            .container { width: 90%; height: auto; padding: 20px 0; }
            .login-container, .register-container { padding: 30px 20px; }
            .home-button { top: 10px; left: 10px; padding: 10px 15px; font-size: 14px; }
        }
    </style>
</head>
<body>

<!-- Nút Trang chủ -->
<a href="${pageContext.request.contextPath}/view/guest/homePage.jsp" class="home-button">
    <i class="fas fa-home"></i> Trang Chủ
</a>

<!-- Container -->
<div class="container" id="container">
    <div class="form-container">


        <div class="login-container">
            <h2>Đăng Ký</h2>
            <form id="loginForm" method="post" action="${pageContext.request.contextPath}/registerAccount">
                <div class="input-group">
                    <input type="text" placeholder="Email" name="email" required>
                </div>
                <div class="input-group">
                    <input type="text" placeholder="Họ và tên " name="fullname" required>
                </div>
                <div class="input-group">
                    <input type="text" placeholder="Tỉnh " name="address" required>
                </div>
                <div class="input-group">
                    <input type="text" placeholder="Số điện thoại " name="phone" required>
                </div>
                <div class="input-group">
                    <input type="text" placeholder="Mã sinh viên " name="studentId" required>
                </div>
                <div class="input-group">
                    <select name="gender" style="width: 100%; height: 30px;border: none;outline: solid 0.2px #d6d1d1; border-radius: 10px; text-align: center;">
                        <option>Giới tính</option>
                        <option value="male">Nam</option>
                        <option value="female">Nữ</option>
                        <option value="other">Khác</option>
                    </select>
                </div>
                <div class="input-group">
                    <input type="date" name="dob" required>
                </div>
                <div class="input-group">
                    <input type="password" placeholder="Mật khẩu" name="password" required>
                </div>
                <div class="input-group">
                    <input type="password" placeholder="Xác nhận mật khẩu" name="confirmPassword" required>
                </div>

                <div class="remember-forgot">
                    <a href="${pageContext.request.contextPath}/view/guest/authen/login.jsp" style="margin-right: 15px">Đã có tài khoản?</a>
                    <a href="${pageContext.request.contextPath}/view/guest/authen/forgotPassword.jsp">Quên mật khẩu?</a>
                </div>
                <button type="submit" class="btn">Đăng Ký</button>
            </form>

            <!-- Hiển thị lỗi -->
            <div class="social-login" style="margin-top: 20px;color: red">
                ${error}
            </div>
        </div>

        <%-- Form Đăng Ký (commented) --%>
        <%--
        <div class="register-container">
            <h2>Đăng Ký</h2>
            <form id="registerForm">
                <div class="input-group">
                    <input type="text" placeholder="Họ và tên" required>
                </div>
                <div class="input-group">
                    <input type="email" placeholder="Email" required>
                </div>
                <div class="input-group">
                    <input type="text" placeholder="Tên đăng nhập" required>
                </div>
                <div class="input-group">
                    <input type="password" placeholder="Mật khẩu" required>
                </div>
                <div class="input-group">
                    <input type="password" placeholder="Xác nhận mật khẩu" required>
                </div>
                <button type="submit" class="btn">Đăng Ký</button>
            </form>
        </div>
        --%>
    </div>
</div>
</body>
</html>

