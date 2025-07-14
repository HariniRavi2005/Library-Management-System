<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f5f9;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 40px;
        }

        .navbar {
            background-color: #1e40af;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h2 {
            margin: 0;
            font-size: 24px;
        }

        .navbar a {
            background-color: white;
            color: #1e40af;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .navbar a:hover {
            background-color: #e0e7ff;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h2>Member Management</h2>
    <a href="${pageContext.request.contextPath}/admin/dashboard">Back</a>
</div>

<div class="container">
    <table class="table table-bordered table-striped table-hover">
        <thead class="table-primary">
            <tr>
                <th>S.No</th>
                <th>Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${user.username}</td>
                    
                    <td>${user.email}</td>
                    <td>
                        <form method="post" action="${pageContext.request.contextPath}/admin/remove-user">
                            <input type="hidden" name="id" value="${user.id}" />
                            <button type="submit" class="btn btn-danger btn-sm"
                                    onclick="return confirm('Are you sure you want to remove this user?');">
                                Remove
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
