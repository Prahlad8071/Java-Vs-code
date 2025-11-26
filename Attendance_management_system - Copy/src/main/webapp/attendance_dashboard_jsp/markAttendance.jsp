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
    <title>Mark Attendance - Attendance System</title>
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
                <h1 class="page-title">Mark Attendance</h1>
            </header>

            <section class="content-grid">
                <div class="card">
                    <form action="saveAttendance.jsp" method="post" class="form">
                        <div class="form-group">
                            <label>Select Student</label>
                            <select name="student" required>
                                <option value="" disabled selected>-- choose student --</option>
                                <%
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        con = DriverManager.getConnection(
                                            "jdbc:mysql://localhost:3306/attendance_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                                            "root",
                                            "Prahlad@78"
                                        );
                                        st = con.createStatement();
                                        rs = st.executeQuery("SELECT * FROM students ORDER BY name ASC");
                                        while (rs.next()) {
                                %>
                                            <option value="<%= rs.getInt("id") %>">
                                                <%= rs.getString("name") %>
                                            </option>
                                <%
                                        }
                                    } catch(Exception e) {
                                        e.printStackTrace();
                                %>
                                        <option disabled>Error loading students</option>
                                <%
                                    } finally {
                                        try { if (rs != null) rs.close(); } catch(Exception e){}
                                        try { if (st != null) st.close(); } catch(Exception e){}
                                        try { if (con != null) con.close(); } catch(Exception e){}
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Date</label>
                            <input type="date" name="date" required>
                        </div>

                        <div class="form-group">
                            <label>Status</label>
                            <div class="radio-group">
                                <label class="radio-inline">
                                    <input type="radio" name="status" value="Present" checked> Present
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" value="Absent"> Absent
                                </label>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Save Attendance</button>
                            <a href="index.jsp" class="btn btn-outline">Cancel</a>
                        </div>
                    </form>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
