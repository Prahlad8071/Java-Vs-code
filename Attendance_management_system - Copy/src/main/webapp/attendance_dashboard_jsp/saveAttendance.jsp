<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String student = request.getParameter("student");
    String date = request.getParameter("date");
    String status = request.getParameter("status");

    boolean success = false;

    if (student != null && date != null && status != null) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/attendance_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                "root",
                "Prahlad@78"
            );
            ps = con.prepareStatement(
                "INSERT INTO attendance (student_id, date, status) VALUES (?, ?, ?)"
            );
            ps.setInt(1, Integer.parseInt(student));
            ps.setString(2, date);
            ps.setString(3, status);
            ps.executeUpdate();
            success = true;
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e){}
            try { if (con != null) con.close(); } catch(Exception e){}
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Save Attendance - Attendance System</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
    <div class="layout">
        <aside class="sidebar">
            <div class="sidebar-logo">
                <span class="logo-dot"></span>
                <span class="logo-text">Attendance</span>
            </div>
            <nav class="sidebar-nav">
                <a href="index.jsp" class="nav-item">Dashboard</a>
                <a href="markAttendance.jsp" class="nav-item nav-item-active">Mark Attendance</a>
                <a href="viewAttendance.jsp" class="nav-item">View Attendance</a>
            </nav>
            <div class="sidebar-footer">
                <span class="sidebar-user"><%= session.getAttribute("admin") %></span>
                <a href="logout.jsp" class="nav-item nav-logout">Logout</a>
            </div>
        </aside>
        <main class="main">
            <header class="topbar">
                <h1 class="page-title">Save Attendance</h1>
            </header>

            <section class="content-grid">
                <div class="card centered-card">
                    <% if (success) { %>
                        <h2 class="status-title success">Attendance Saved Successfully!</h2>
                        <p class="status-text">The student's attendance has been recorded.</p>
                    <% } else { %>
                        <h2 class="status-title error-title">Failed to Save Attendance</h2>
                        <p class="status-text">Please check the data and try again.</p>
                    <% } %>

                    <div class="btn-group">
                        <a href="markAttendance.jsp" class="btn btn-primary">Mark Another</a>
                        <a href="index.jsp" class="btn btn-outline">Back to Dashboard</a>
                    </div>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
