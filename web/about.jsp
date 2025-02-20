<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - Emma’s Event Management</title>
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
            width: 60%;
            margin-top: 100px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2 {
            color: #FFD700;
            margin-bottom: 20px;
            font-size: 28px;
        }

        h3 {
            color: #FFA500;
            margin-top: 20px;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            background: rgba(255, 255, 255, 0.2);
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            transition: background 0.3s ease-in-out;
        }

        ul li:hover {
            background: rgba(255, 255, 255, 0.3);
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
        <h2>About Us</h2>
        <p>Welcome to <strong>Emma’s Event Management</strong>, your trusted partner in planning and managing events effortlessly.</p>
        
        <h3>Our Mission</h3>
        <p>Our mission is to simplify event planning by providing a user-friendly platform where individuals and businesses can create, manage, and attend events seamlessly.</p>
        
        <h3>What We Offer</h3>
        <ul>
            <li><strong>Event Creation:</strong> Users can create and list events with detailed information.</li>
            <li><strong>RSVP Management:</strong> Guests can register and confirm attendance.</li>
            <li><strong>Event Discovery:</strong> Users can explore and join upcoming events.</li>
            <li><strong>Seamless Coordination:</strong> Built-in tools for organizing event details efficiently.</li>
        </ul>

        <h3>Why Choose Us?</h3>
        <p>At Emma’s Event Management, we prioritize simplicity, efficiency, and customer satisfaction. Whether you’re hosting a corporate conference, wedding, or social gathering, our platform ensures a smooth event management experience.</p>
        
        <h3>Get Started</h3>
        <p>Join us today and take your event planning to the next level!</p>
    </div>
</body>
</html>
