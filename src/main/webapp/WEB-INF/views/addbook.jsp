<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f8fafc, #e0f2fe);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }

        .card {
            margin-top: 80px;
            border: none;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #1e40af;
            color: white;
            text-align: center;
            font-size: 1.5rem;
            padding: 20px;
            border-bottom: none;
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-success {
            width: 120px;
        }

        .btn-secondary {
            width: 120px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card mx-auto" style="max-width: 600px;">
        <div class="card-header">
            Add New Book
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/add-book" method="post">
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="Enter book title" required />
                </div>

                <div class="mb-3">
                    <label for="author" class="form-label">Author</label>
                    <input type="text" class="form-control" id="author" name="author" placeholder="Enter author name" required />
                </div>

                <div class="mb-3">
                    <label for="category" class="form-label">Category</label>
                    <input type="text" class="form-control" id="category" name="category" placeholder="Enter book category" required />
                </div>

                <div class="mb-3">
                    <label for="available" class="form-label">Available</label>
                    <select class="form-select" id="available" name="available" required>
                        <option value="">-- Select --</option>
                        <option value="true">Yes</option>
                        <option value="false">No</option>
                    </select>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">Back</a>
                    <button type="submit" class="btn btn-success">Add Book</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
