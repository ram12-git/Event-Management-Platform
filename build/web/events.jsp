<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Event" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Listings</title>
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: url('images/background1.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
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

        /* Container */
        .container {
            flex: 1;
            width: 90%;
            margin: 100px auto 20px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }

        h2 {
            color: #FFD700;
            margin-bottom: 20px;
        }

        /* Filter Form */
        .filter-form {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .filter-form input,
        .filter-form select,
        .filter-form button {
            padding: 10px;
            border-radius: 5px;
            border: none;
            outline: none;
            font-size: 16px;
        }

        .filter-form input {
            width: 200px;
        }

        .filter-form button {
            background: #FFD700;
            cursor: pointer;
            font-weight: bold;
        }

        .filter-form button:hover {
            background: #FFA500;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }

        th {
            background: rgba(0, 0, 0, 0.7);
            color: #FFD700;
        }

        tr:hover {
            background: rgba(255, 255, 255, 0.2);
            transition: 0.3s ease-in-out;
        }

        /* Buttons */
        .btn {
            display: inline-block;
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s ease-in-out, transform 0.2s;
        }

        .btn-warning {
            background: #f0ad4e;
            color: white;
        }

        .btn-danger {
            background: #d9534f;
            color: white;
        }

        .btn:hover {
            transform: scale(1.1);
        }

        /* Footer */
        .footer {
            background: rgba(0, 0, 0, 0.7);
            padding: 15px;
            text-align: center;
            color: white;
            width: 100%;
            margin-top: auto;
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
        <a href="logout.jsp" style="float:right;">Logout</a>
    </div>

    <div class="container">
        <h2>Upcoming Events</h2>

        <!-- Filter Form -->
        <form action="events" method="GET" class="filter-form">
            <input type="text" name="keyword" placeholder="Search by name or location" 
                value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
            
            <select name="type">
                <option value="">All Types</option>
                <option value="Conference" <%= "Conference".equals(request.getParameter("type")) ? "selected" : "" %>>Conference</option>
                <option value="Wedding" <%= "Wedding".equals(request.getParameter("type")) ? "selected" : "" %>>Wedding</option>
                <option value="Workshop" <%= "Workshop".equals(request.getParameter("type")) ? "selected" : "" %>>Workshop</option>
                <option value="Party" <%= "Party".equals(request.getParameter("type")) ? "selected" : "" %>>Party</option>
            </select>
            
            <input type="date" name="date" value="<%= request.getParameter("date") != null ? request.getParameter("date") : "" %>">
            
            <button type="submit">Filter</button>
        </form>

        <!-- Events Table -->
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Location</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Event> events = (List<Event>) request.getAttribute("events");
                    if (events != null && !events.isEmpty()) {
                        for (Event event : events) {
                %>
                <tr>
                    <td><%= event.getName() %></td>
                    <td><%= event.getDate() %></td>
                    <td><%= event.getLocation() %></td>
                    <td><%= event.getType() %></td>
                    <td><%= event.getDescription() %></td>
                    <td>
                        <a href="EditEventServlet?id=<%= event.getId() %>" class="btn btn-warning">Edit</a>
                        <a href="DeleteEventServlet?id=<%= event.getId() %>" class="btn btn-danger" 
                            onclick="return confirm('Are you sure you want to delete this event?')">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr><td colspan="6">No events found.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Event Manager. All Rights Reserved.</p>
    </div>
</body>
</html>
