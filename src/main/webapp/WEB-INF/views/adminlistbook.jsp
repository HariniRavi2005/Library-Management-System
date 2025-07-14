<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Books - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f9fafb;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #0d6efd;
            padding: 15px 30px;
            color: white;
        }
        .navbar h2 {
            margin: 0;
            font-size: 24px;
        }
        .container {
            margin-top: 30px;
        }
        table {
            background-color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar d-flex justify-content-between align-items-center">
    <h2>All Books</h2>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-light">Back to Dashboard</a>
</div>

<!-- Book Table -->
<div class="container">
    <table class="table table-bordered table-hover mt-4">
        <thead class="table-primary">
        <tr>
            <th>S.no</th>
            <th>Title</th>
            <th>Author</th>
            <th>Category</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${books}" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${book.title}</td>
                <td>${book.author}</td>
                <td>${book.category}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
