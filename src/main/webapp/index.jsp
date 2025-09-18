<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.library.*" %>
<html>
<head>
    <title>Book Library</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Book Library</h2>
    <a class="button" href="books?action=new">Add New Book</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
            <th>Year</th>
            <th>Actions</th>
        </tr>
        <%
            List<Book> listBooks = (List<Book>) request.getAttribute("listBooks");
            if (listBooks != null) {
                for (Book b : listBooks) {
        %>
        <tr>
            <td><%= b.getId() %></td>
            <td><%= b.getTitle() %></td>
            <td><%= b.getAuthor() %></td>
            <td><%= b.getGenre() %></td>
            <td><%= b.getYear() %></td>
            <td>
                <a class="button" href="books?action=edit&id=<%= b.getId() %>">Edit</a>
                <a class="button" href="books?action=delete&id=<%= b.getId() %>">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</div>
</body>
</html>
