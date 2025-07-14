<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Library System</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8fafc;
        }

        header {
            background-color: #1e40af;
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
            color: #1e40af;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
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
    <h1>Welcome Admin, <%= user.getUsername() %></h1>
    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
</header>

<div class="container">
    <h2>Admin Dashboard</h2>

    <div class="card">
        <h3>View All Books</h3>
        <a href="${pageContext.request.contextPath}/admin/books">Go to Book List</a>
    </div>

    <div class="card">
        <h3>Add New Book</h3>
        <a href="${pageContext.request.contextPath}/admin/add-book">Add a Book</a>
    </div>

    <div class="card">
        <h3>Manage Members</h3>
        <a href="${pageContext.request.contextPath}/admin/users">View All Users</a>
    </div>
</div>

</body>
</html>
