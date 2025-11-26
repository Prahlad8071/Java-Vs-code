<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String adminUser = (String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Attendance System</title>
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
                <a href="index.jsp" class="nav-item nav-item-active">Dashboard</a>
                <a href="markAttendance.jsp" class="nav-item">Mark Attendance</a>
                <a href="viewAttendance.jsp" class="nav-item">View Attendance</a>
            </nav>
            <div class="sidebar-footer">
                <span class="sidebar-user"><%= adminUser %></span>
                <a href="logout.jsp" class="nav-item nav-logout">Logout</a>
            </div>
        </aside>
        <main class="main">
            <header class="topbar">
                <h1 class="page-title">Dashboard</h1>
                <div class="topbar-right">
                    <span class="badge">Admin</span>
                </div>
            </header>

            <section class="content-grid">
                <div class="card">
                    <h3>Total Features</h3>
                    <p>Use this panel to manage student attendance.</p>
                    <ul class="feature-list">
                        <li>Secure admin login</li>
                        <li>Mark daily attendance</li>
                        <li>View attendance records</li>
                    </ul>
                </div>

                <div class="card quick-actions">
                    <h3>Quick Actions</h3>
                    <div class="btn-group-vertical">
                        <a href="markAttendance.jsp" class="btn btn-primary">Mark Attendance</a>
                        <a href="viewAttendance.jsp" class="btn btn-outline">View Attendance</a>
                    </div>
                </div>

                <div class="card info-card">
                    <h3>Project Info</h3>
                    <p>This is a simple JSP + JDBC + MySQL based Attendance Management System with a modern dashboard UI.</p>
                    <p class="muted">You can extend this system with more modules like student registration, reports, and role-based access.</p>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
