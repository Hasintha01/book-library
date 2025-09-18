package com.library;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/books")
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookDAO bookDAO;

    @Override
    public void init() {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                request.getRequestDispatcher("addBook.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Book existingBook = bookDAO.getBookById(id);
                request.setAttribute("book", existingBook);
                request.getRequestDispatcher("editBook.jsp").forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                bookDAO.deleteBook(id);
                response.sendRedirect("books");
                break;
            default:
                List<Book> list = bookDAO.getAllBooks();
                request.setAttribute("listBooks", list);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String genre = request.getParameter("genre");
        int year = Integer.parseInt(request.getParameter("year"));

        switch (action) {
            case "insert":
                Book newBook = new Book();
                newBook.setTitle(title);
                newBook.setAuthor(author);
                newBook.setGenre(genre);
                newBook.setYear(year);
                bookDAO.addBook(newBook);
                response.sendRedirect("books");
                break;

            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                Book book = new Book();
                book.setId(id);
                book.setTitle(title);
                book.setAuthor(author);
                book.setGenre(genre);
                book.setYear(year);
                bookDAO.updateBook(book);
                response.sendRedirect("books");
                break;
        }
    }
}
