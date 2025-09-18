<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.library.*" %>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js"></script>
</head>
<body>
<div class="container">
    <h2>Edit Book</h2>
    <%
        Book book = (Book) request.getAttribute("book");
    %>
    <form name="bookForm" action="books" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= book.getId() %>">
        Title:<br>
        <input type="text" name="title" value="<%= book.getTitle() %>"><br>
        Author:<br>
        <input type="text" name="author" value="<%= book.getAuthor() %>"><br>
        Genre:<br>
        <input type="text" name="genre" value="<%= book.getGenre() %>"><br>
        Year:<br>
        <input type="number" name="year" value="<%= book.getYear() %>"><br>
        <input type="submit" value="Update Book">
    </form>
    <br>
    <a class="button" href="books">Back to List</a>
</div>
</body>
</html>
