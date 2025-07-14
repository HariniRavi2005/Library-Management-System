<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Library System</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .left {
            flex: 1;
            background: url('https://images.unsplash.com/photo-1512820790803-83ca734da794') no-repeat center center/cover;
        }

        .right {
            flex: 1;
            max-width: 500px;
            margin: auto;
            padding: 40px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        h2 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .signup-link {
            margin-bottom: 20px;
        }

        .signup-link a {
            text-decoration: none;
            color: #0077cc;
            font-weight: bold;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 12px;
            font-weight: bold;
        }

        input, select {
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .error {
            color: red;
            font-size: 13px;
            margin-top: 10px;
        }

        button {
            margin-top: 24px;
            padding: 12px;
            background-color: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #1e40af;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left"></div>
    <div class="right">
        <h2>Login</h2>
        <div class="signup-link">
            Don't have an account? <a href="signup">Sign up</a>
        </div>

        <form action="login" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="role">Role</label>
            <select id="role" name="role" required>
                <option value="USER">User</option>
                <option value="ADMIN">Admin</option>
            </select>

            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>

            <button type="submit">Login</button>
        </form>
    </div>
</div>
</body>
</html>
