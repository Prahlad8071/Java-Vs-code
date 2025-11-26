<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Attendance - Attendance System</title>
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
                <a href="markAttendance.jsp" class="nav-item">Mark Attendance</a>
                <a href="viewAttendance.jsp" class="nav-item nav-item-active">View Attendance</a>
            </nav>
            <div class="sidebar-footer">
                <span class="sidebar-user"><%= session.getAttribute("admin") %></span>
                <a href="logout.jsp" class="nav-item nav-logout">Logout</a>
            </div>
        </aside>
        <main class="main">
            <header class="topbar">
                <h1 class="page-title">Attendance Records</h1>
            </header>

            <section class="content-grid">
                <div class="card">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Student Name</th>
                                <th>Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                int counter = 1;
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = DriverManager.getConnection(
                                        "jdbc:mysql://localhost:3306/attendance_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                                        "root",
                                        "Prahlad@78"
                                    );
                                    st = con.createStatement();
                                    rs = st.executeQuery(
                                        "SELECT s.name, a.date, a.status " +
                                        "FROM students s JOIN attendance a ON s.id = a.student_id " +
                                        "ORDER BY a.date DESC"
                                    );
                                    while (rs.next()) {
                            %>
                                        <tr>
                                            <td><%= counter++ %></td>
                                            <td><%= rs.getString("name") %></td>
                                            <td><%= rs.getString("date") %></td>
                                            <td>
                                                <span class="badge <%= "Present".equals(rs.getString("status")) ? "badge-success" : "badge-danger" %>">
                                                    <%= rs.getString("status") %>
                                                </span>
                                            </td>
                                        </tr>
                            <%
                                    }
                                } catch(Exception e) {
                                    e.printStackTrace();
                            %>
                                    <tr>
                                        <td colspan="4">Error loading records.</td>
                                    </tr>
                            <%
                                } finally {
                                    try { if (rs != null) rs.close(); } catch(Exception e){}
                                    try { if (st != null) st.close(); } catch(Exception e){}
                                    try { if (con != null) con.close(); } catch(Exception e){}
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
