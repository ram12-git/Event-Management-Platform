<%@ page import="models.Event" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Event</title>
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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            align-items: center;
            justify-content: center;
        }

        /* Navbar */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(0, 0, 0, 0.8);
            padding: 15px 0;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            z-index: 100;
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
            width: 50%;
            margin-top: 100px;
            padding: 25px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2 {
            color: #FFD700;
            margin-bottom: 20px;
        }

        /* Form Styles */
        .event-form {
            text-align: left;
            width: 100%;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: white;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            outline: none;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
        }

        .input-field:focus {
            background: rgba(255, 255, 255, 0.3);
        }

        /* Buttons */
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn-primary {
            background: #FFD700;
            color: black;
            padding: 10px 15px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s;
        }

        .btn-primary:hover {
            background: #FFA500;
            transform: scale(1.1);
        }

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

        /* Alert */
        .alert {
            padding: 15px;
            background: rgba(255, 0, 0, 0.2);
            color: #FF0000;
            font-weight: bold;
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
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
        <h2>Edit Event</h2>

        <%
            Event event = (Event) request.getAttribute("event");
            if (event != null) {
        %>

        <form action="UpdateEventServlet" method="post" class="event-form">
            <input type="hidden" name="id" value="<%= event.getId() %>">

            <div class="form-group">
                <label for="name">Event Name</label>
                <input type="text" id="name" name="name" class="input-field" value="<%= event.getName() %>" required>
            </div>

            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" id="date" name="date" class="input-field" value="<%= event.getDate() %>" required>
            </div>

            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" class="input-field" value="<%= event.getLocation() %>" required>
            </div>

            <div class="form-group">
                <label for="type">Type</label>
                <select id="type" name="type" class="input-field">
                    <option value="Conference" <%= "Conference".equals(event.getType()) ? "selected" : "" %>>Conference</option>
                    <option value="Wedding" <%= "Wedding".equals(event.getType()) ? "selected" : "" %>>Wedding</option>
                    <option value="Workshop" <%= "Workshop".equals(event.getType()) ? "selected" : "" %>>Workshop</option>
                    <option value="Party" <%= "Party".equals(event.getType()) ? "selected" : "" %>>Party</option>
                </select>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="input-field" required><%= event.getDescription() %></textarea>
            </div>

            <div class="button-group">
                <button type="submit" class="btn-primary">Update Event</button>
                <a href="events" class="btn">Cancel</a>
            </div>
        </form>

        <% } else { %>
            <div class="alert">Event not found!</div>
        <% } %>

    </div>
</body>
</html>
