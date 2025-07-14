<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"USER".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - Library System</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8fafc;
        }

        header {
            background-color: #2563eb;
            color: white;
            padding: 16px 32px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        .logout-btn {
            background-color: white;
            color: #2563eb;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
        }

        .container {
            padding: 30px;
        }

        h2 {
            color: #1e3a8a;
            margin-bottom: 20px;
        }

        .card {
            background-color: white;
            border-radius: 6px;
            box-shadow: 0 0 8px rgba(0,0,0,0.08);
            padding: 20px;
            margin-bottom: 20px;
        }

        .card h3 {
            margin-top: 0;
        }

        .card ul {
            list-style-type: disc;
            padding-left: 20px;
        }

        .card li {
            margin-bottom: 6px;
        }

        .card a {
            color: #1e40af;
            font-weight: bold;
            text-decoration: none;
        }

        .card a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome, <%= user.getUsername() %></h1>
    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
</header>

<div class="container">
    <h2>User Dashboard</h2>

    <div class="card">
        <h3>View All Books</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/user/books">Browse Available Books</a></li>
        </ul>
    </div>

    <div class="card">
        <h3>My Book Requests</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/user/requested-books">List of Requested Books</a></li>
        </ul>
    </div>
</div>

</body>
</html>
