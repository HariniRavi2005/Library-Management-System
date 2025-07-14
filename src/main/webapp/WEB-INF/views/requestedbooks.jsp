<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Requested Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        tr:nth-child(even) {
            background-color: #fafafa;
        }

        .btn-remove {
            background-color: #dc2626;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-remove:hover {
            background-color: #b91c1c;
        }

        form {
            margin: 0;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h2>Requested Books</h2>
    <a href="${pageContext.request.contextPath}/user/dashboard">Back</a>
</div>

<table>
    <thead>
    <tr>
        <th>S.No</th>
        <th>Title</th>
        <th>Author</th>
        <th>Category</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="req" items="${requests}" varStatus="loop">
        <tr>
            <td>${loop.index + 1}</td>
            <td>${req.title}</td>
            <td>${req.author}</td>
            <td>${req.category}</td>
            <td>
                <form action="${pageContext.request.contextPath}/user/remove-request" method="post">
                    <input type="hidden" name="id" value="${req.id}" />
                    <button type="submit" class="btn-remove">Remove</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
