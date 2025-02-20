<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    // Check if the user is logged in
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Event Management System</title>
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 5px;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        html, body {
            height: 100%;
            display: flex;
            flex-direction: column;
            background: url('images/background1.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            text-align: center;
        }

        /* Navbar */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(0, 0, 0, 0.8);
            padding: 15px 0;
            text-align: center;
            z-index: 100;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
            transition: color 0.3s ease-in-out;
        }

        .navbar a:hover {
            color: #FFD700;
        }

        .navbar a:last-child {
            float: right;
            margin-right: 30px;
        }

        /* Header */
        .header {
            padding: 50px 20px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            display: inline-block;
            margin-top: 80px;
            animation: fadeIn 1.5s ease-in-out;
        }

        /* Main Content */
        .container {
            flex: 1; /* Pushes footer to the bottom */
            width: 80%;
            margin: 20px auto;
            padding: 20px;
        }

        /* Event Cards */
        .event-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            animation: fadeInUp 1s ease-in-out;
        }

        .event-card:hover {
            transform: scale(1.05);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.5);
        }

        h3 {
            color: #FFD700;
        }

        p {
            font-size: 16px;
        }

        /* Button */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #FFD700;
            color: black;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
            font-weight: bold;
            transition: background 0.3s ease-in-out, transform 0.2s;
        }

        .btn:hover {
            background: #FFA500;
            transform: scale(1.1);
        }

        /* Footer - Fixed at the bottom */
        .footer {
            background: rgba(0, 0, 0, 0.7);
            padding: 15px;
            text-align: center;
            color: white;
            width: 100%;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="add_event.jsp">Add Event</a>
        <a href="events">Manage Events</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <!-- Header -->
    <div class="header">
        <h1>Welcome, <%= user %>!</h1>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Upcoming Events</h2>

        <% 
            String jdbcUrl = "jdbc:mysql://localhost:3306/event_platform_db";
            String jdbcUser = "root";
            String jdbcPassword = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM events ORDER BY date ASC LIMIT 5");
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {
        %>
            <div class="event-card">
                <h3><%= rs.getString("name") %></h3>
                <p><strong>Date:</strong> <%= rs.getString("date") %></p>
                <p><strong>Location:</strong> <%= rs.getString("location") %></p>
                <p><strong>Type:</strong> <%= rs.getString("type") %></p>
                <p><%= rs.getString("description") %></p>
                <a href="event_details.jsp?event_id=<%= rs.getInt("id") %>" class="btn">View Details</a>
            </div>
        <% 
                }
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Event Manager. All Rights Reserved.</p>
    </div>
</body>
</html>
