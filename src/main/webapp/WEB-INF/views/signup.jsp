<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up - Library System</title>
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
            width: 100%;
        }

        .left {
            flex: 1;
            background: url('https://images.unsplash.com/photo-1521587760476-6c12a4b040da?ixlib=rb-4.0.3&auto=format&fit=crop&w=1170&q=80') no-repeat center center/cover;
        }

        .right {
            flex: 1;
            background-color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .form-box {
            width: 100%;
            max-width: 400px;
        }

        h2 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .login-link {
            margin-bottom: 20px;
        }

        .login-link a {
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

        .hint {
            font-size: 12px;
            color: teal;
        }

        button {
            margin-top: 24px;
            padding: 12px;
            background-color: #22c55e;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #16a34a;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .left, .right {
                flex: none;
                height: 50vh;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left"></div>
    <div class="right">
        <div class="form-box">
            <h2>Sign up</h2>
            <div class="login-link">
                Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a>
            </div>

           <form action="${pageContext.request.contextPath}/signup" method="post">
           
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
                <div class="hint">*This will be used for login</div>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
                <div class="hint">At least 6 characters, 1 number, and 1 uppercase letter</div>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>

                <label for="role">Role</label>
                <select id="role" name="role" required>
                    <option value="USER">User</option>
                    <option value="ADMIN">Admin</option>
                </select>

                <button type="submit">Sign Up</button>
            </form>

            <!-- Show popup if username exists -->
            <c:if test="${usernameExists}">
                <script>
                    alert("Username already exists! Please choose a different one.");
                </script>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
