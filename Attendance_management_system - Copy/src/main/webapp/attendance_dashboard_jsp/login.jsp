<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // If already logged in, go to dashboard
    if (session.getAttribute("admin") != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Attendance System</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body class="auth-body">
    <div class="auth-wrapper">
        <div class="auth-card">
            <h2 class="auth-title">Attendance Admin Login</h2>
            <p class="auth-subtitle">Sign in to manage attendance records</p>
            <form action="loginCheck.jsp" method="post" class="auth-form">
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" name="username" required>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" required>
                </div>

                <button type="submit" class="btn btn-primary btn-full">Login</button>
            </form>
            <p class="auth-footer-text">Default: <strong>admin / 1234</strong></p>
        </div>
    </div>
</body>
</html>
