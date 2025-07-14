<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="com.example.model.User" %>
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
    <title>User Feedback - Library System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
    <a class="navbar-brand" href="#">Library System</a>
    <div class="ms-auto">
        <a class="btn btn-light btn-sm" href="${pageContext.request.contextPath}/user/dashboard">Back to Dashboard</a>
    </div>
</nav>

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Feedback Form</h4>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/user/submit-feedback" method="post">
                <div class="mb-3">
                    <label class="form-label">Your Name</label>
                    <input type="text" class="form-control" value="<%= user.getUsername() %>" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label">Rating</label>
                    <select name="rating" class="form-select" required>
                        <option value="">Select</option>
                        <option>Excellent</option>
                        <option>Good</option>
                        <option>Average</option>
                        <option>Poor</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Comments</label>
                    <textarea name="comment" class="form-control" rows="4" placeholder="Write your feedback..." required></textarea>
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-success">Submit Feedback</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
