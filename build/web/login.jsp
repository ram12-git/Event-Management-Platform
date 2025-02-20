<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes floatEffect {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        body {
            margin: 0;
            padding: 0;
            background: url('images/background.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
            animation: fadeIn 1.5s ease-in-out;
        }

        /* Blur Effect */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: inherit;
            filter: blur(10px);
            z-index: -1;
        }

        .auth-form {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            width: 450px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: floatEffect 3s infinite ease-in-out;
            transition: transform 0.3s ease-in-out;
        }

        .auth-form:hover {
            transform: scale(1.05);
        }

        h2 {
            color: white;
            animation: fadeIn 2s ease-in-out;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
            animation: fadeIn 2s ease-in-out;
        }

        label {
            display: block;
            font-weight: bold;
            color: white;
        }

        input {
            width: 97%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        input:focus {
            border-color: #007BFF;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.8);
            transform: scale(1.02);
        }

        button {
            width: 50%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 123, 255, 0.5);
        }

        .alert {
            background-color: rgba(255, 0, 0, 0.7);
            color: white;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            animation: fadeIn 2s ease-in-out;
        }

        .text-center {
            color: white;
            animation: fadeIn 2s ease-in-out;
        }

        a {
            color: #FFD700;
            text-decoration: none;
            transition: color 0.3s ease-in-out;
        }

        a:hover {
            color: #FFA500;
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="auth-form">
        <h2>Login</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="LoginServlet" method="POST">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>

            <button type="submit">Login</button>
        </form>

        <p class="text-center">Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>

</body>
</html>
