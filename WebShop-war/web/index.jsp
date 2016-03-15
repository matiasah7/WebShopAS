<%-- 
    Document   : index
    Created on : 14-mar-2016, 23:19:42
    Author     : Matias
--%>

<%@page import="entity.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebShop</title>
    </head>
    <body>
        <h1>Welcome to our store!</h1>
        <a href="ShoppingCart.jsp">View Shopping Cart</a>
        <%
            ArrayList<Book> list = (ArrayList) session.getAttribute("books");
            if (list != null) {
                for (Book book : list) {
        %>
        <p>
            <%
                out.print(book.getBookName() + "   |   " + book.getAuthor() + "   |   " + book.getDescription() + "   |     price: " + book.getPrice());
            %> 

        </p>
        <form name="addToCart" action="FrontServlet">
            <input type="hidden" name="command" value="AddBookToCartCommand">
            <input type="hidden" name="bookIsbn" value='<% out.print(book.getIsbn()); %>'>
            <input type="submit" name="add" value="Add">
        </form>
        <%}
            }
        %>

    </body>
</html>
