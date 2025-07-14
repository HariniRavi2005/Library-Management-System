<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book List</title>

    <!-- ✅ Bootstrap only for button styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div style="background-color: #1e40af; color: white; padding: 16px 32px; display: flex; justify-content: space-between;">
    <h2 style="margin: 0;">Book List</h2>
    <a href="${pageContext.request.contextPath}/user/dashboard" class="btn btn-light">Back</a>
</div>

<table style="width: 90%; margin: 30px auto; border-collapse: collapse;">
    <thead style="background-color: #f4f4f4;">
    <tr>
        <th style="border: 1px solid #ccc; padding: 12px;">S.No</th>
        <th style="border: 1px solid #ccc; padding: 12px;">Title</th>
        <th style="border: 1px solid #ccc; padding: 12px;">Author</th>
        <th style="border: 1px solid #ccc; padding: 12px;">Category</th>
        <th style="border: 1px solid #ccc; padding: 12px;">Available</th>
        <th style="border: 1px solid #ccc; padding: 12px;">Status</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="book" items="${books}" varStatus="status">
        <tr>
            <td style="border: 1px solid #ccc; padding: 12px;">${status.index + 1}</td>
            <td style="border: 1px solid #ccc; padding: 12px;">${book.title}</td>
            <td style="border: 1px solid #ccc; padding: 12px;">${book.author}</td>
            <td style="border: 1px solid #ccc; padding: 12px;">${book.category}</td>
            <td style="border: 1px solid #ccc; padding: 12px;">${book.available ? 'Yes' : 'No'}</td>
            <td style="border: 1px solid #ccc; padding: 12px;">
                <button
                    class="btn btn-outline-primary"
                    onclick="handleBorrow(this, ${book.id}, ${book.available})"
                    id="btn-${book.id}"
                >
                    Borrow
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
    function handleBorrow(button, bookId, isAvailable) {
        // Send async POST request to borrow book
        fetch('${pageContext.request.contextPath}/user/borrow', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'bookId=' + bookId
        })
        .then(response => {
            if (response.ok) {
                if (isAvailable) {
                    button.textContent = 'Requested';
                    button.classList.remove('btn-outline-primary');
                    button.classList.add('btn-success');
                } else {
                    button.textContent = 'Waiting List';
                    button.classList.remove('btn-outline-primary');
                    button.classList.add('btn-danger');
                }
                button.disabled = true;
            } else {
                alert('Failed to borrow the book.');
            }
        });
    }
</script>

</body>
</html>
