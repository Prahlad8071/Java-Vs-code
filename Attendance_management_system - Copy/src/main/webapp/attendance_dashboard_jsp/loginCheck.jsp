<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean isValid = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/attendance_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
            "root",
            "Prahlad@78"  // TODO: change to your MySQL password
        );

        ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();

        if (rs.next()) {
            isValid = true;
            session.setAttribute("admin", username);
            response.sendRedirect("index.jsp");
            return;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch(Exception e){}
        try { if (ps != null) ps.close(); } catch(Exception e){}
        try { if (con != null) con.close(); } catch(Exception e){}
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Failed - Attendance System</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body class="auth-body">
    <div class="auth-wrapper">
        <div class="auth-card">
            <h2 class="auth-title error-title">Invalid Credentials</h2>
            <p class="auth-subtitle">The username or password you entered is incorrect.</p>
            <a href="login.jsp" class="btn btn-primary btn-full">Try Again</a>
        </div>
    </div>
</body>
</html>
