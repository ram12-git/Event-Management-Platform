<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Details</title>
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
            width: 80%;
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

        /* Event Card */
        .card {
            background: rgba(255, 255, 255, 0.15);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            text-align: left;
            margin-bottom: 20px;
        }

        .card h3 {
            color: #FFD700;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 16px;
            line-height: 1.6;
        }

        /* Alerts */
        .alert {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: bold;
            text-align: center;
        }

        .alert-success {
            background: rgba(0, 255, 0, 0.2);
            color: #00FF00;
        }

        .alert-danger {
            background: rgba(255, 0, 0, 0.2);
            color: #FF0000;
        }

        /* Form */
        form {
            background: rgba(255, 255, 255, 0.15);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
        }

        form label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            text-align: left;
            color: white;
        }

        form input, form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: none;
            border-radius: 5px;
            outline: none;
            font-size: 16px;
        }

        form button {
            background: #FFD700;
            color: black;
            padding: 10px 15px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease-in-out;
            width: 100%;
        }

        form button:hover {
            background: #FFA500;
        }

        /* Buttons */
        .btn {
            display: inline-block;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            background: #3498db;
            color: white;
            transition: background 0.3s ease-in-out, transform 0.2s;
        }

        .btn:hover {
            background: #2980b9;
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
        <h2>Event Details</h2>

        <% 
            String eventId = request.getParameter("event_id");
            String userEmail = (String) session.getAttribute("user_email");

            if (eventId == null || eventId.trim().isEmpty()) {
                out.println("<div class='alert alert-danger'>Event ID is missing in the request.</div>");
            } else {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_platform_db", "root", "");

                    String sql = "SELECT * FROM events WHERE id = ?";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, Integer.parseInt(eventId));
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
        %>
                        <div class="card">
                            <h3><%= rs.getString("name") %></h3>
                            <p><strong>Date:</strong> <%= rs.getDate("date") %></p>
                            <p><strong>Location:</strong> <%= rs.getString("location") %></p>
                            <p><strong>Type:</strong> <%= rs.getString("type") %></p>
                            <p><strong>Description:</strong> <%= rs.getString("description") %></p>
                        </div>

                        <h3>RSVP</h3>

                        <form action="RSVPServlet" method="post">
                            <input type="hidden" name="event_id" value="<%= eventId %>">

                            <label>Email:</label>
                            <input type="email" name="email" value="<%= userEmail != null ? userEmail : "" %>" required>

                            <label>RSVP Status:</label>
                            <select name="status" required>
                                <option value="Attending">Attending</option>
                                <option value="Not Attending">Not Attending</option>
                            </select>

                            <label>Number of Attendees:</label>
                            <input type="number" name="attendees" min="1" value="1" required>

                            <button type="submit">Submit RSVP</button>
                        </form>

                        <a href="events" class="btn">Back to Events</a>
        <%  
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                }
            }
        %>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Event Manager. All Rights Reserved.</p>
    </div>
</body>
</html>
