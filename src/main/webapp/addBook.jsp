<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js"></script>
</head>
<body>
<div class="container">
    <h2>Add New Book</h2>
    <form name="bookForm" action="books" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="action" value="insert">
        Title:<br>
        <input type="text" name="title"><br>
        Author:<br>
        <input type="text" name="author"><br>
        Genre:<br>
        <input type="text" name="genre"><br>
        Year:<br>
        <input type="number" name="year"><br>
        <input type="submit" value="Add Book">
    </form>
    <br>
    <a class="button" href="books">Back to List</a>
</div>
</body>
</html>
