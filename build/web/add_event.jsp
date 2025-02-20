<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Event</title>
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

        /* Alert Messages */
        .alert {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            font-weight: bold;
        }

        .alert-success {
            background: rgba(0, 255, 0, 0.2);
            color: #00FF00;
        }

        .alert-danger {
            background: rgba(255, 0, 0, 0.2);
            color: #FF0000;
        }

        /* Form Styles */
        form {
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

        .form-group input, 
        .form-group select, 
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            outline: none;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
        }

        .form-group input:focus, 
        .form-group select:focus, 
        .form-group textarea:focus {
            background: rgba(255, 255, 255, 0.3);
        }

        /* Buttons */
        button {
            background: #FFD700;
            color: black;
            padding: 10px 15px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s;
        }

        button:hover {
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
            margin-top: 10px;
        }

        .btn:hover {
            background: #2980b9;
            transform: scale(1.1);
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
        <h2>Create a New Event</h2>

        <!-- Display Success or Error Messages -->
        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("message") %></div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="addEvent" method="POST">
            <div class="form-group">
                <label>Event Name</label>
                <input type="text" name="name" required>
            </div>
            
            <div class="form-group">
                <label>Date</label>
                <input type="date" name="date" required>
            </div>

            <div class="form-group">
                <label>Location</label>
                <input type="text" name="location" required>
            </div>

            <div class="form-group">
                <label>Event Type</label>
                <select name="type" required>
                    <option value="">Select Type</option>
                    <option value="Conference">Conference</option>
                    <option value="Wedding">Wedding</option>
                    <option value="Workshop">Workshop</option>
                    <option value="Party">Party</option>
                </select>
            </div>

            <div class="form-group">
                <label>Description (Optional)</label>
                <textarea name="description" rows="3"></textarea>
            </div>

            <button type="submit">Create Event</button>
        </form>
        
        <a href="events" class="btn">View Events</a>
    </div>
</body>
</html>
