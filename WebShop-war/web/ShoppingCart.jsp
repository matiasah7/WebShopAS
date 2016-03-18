<%-- 
    Document   : ShoppingCart
    Created on : 15-mar-2016, 16:46:42
    Author     : Soraya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Book"%>
<%@page import="util.ShoppingCartLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebShop</title>
    </head>
    <body>
        <h1>Shopping Cart</h1>
        <a href="index.jsp">Home</a> 

        <%
            ArrayList<Book> list = ((ShoppingCartLocal) session.getAttribute("shoppingCart")).getShoppingCartList();
            if (list != null) {
                for (Book book : list) {
        %>
        <p>
            <%
                out.print(book.getBookName() + "   |   " + book.getAuthor() + "   |   " + book.getDescription() + "   |     price: " + book.getPrice());
            %> 
        <form name="removeFromCart" action="FrontServlet">
            <input type="hidden" name="command" value="RemoveBookFromCartCommand">
            <input type="hidden" name="bookIsbn" value='<% out.print(book.getIsbn()); %>'>
            <input type="submit" name="Remove" value="Remove">
        </form>
    </p>
    <%}
        }
        if(!((ShoppingCartLocal) session.getAttribute("shoppingCart")).isEmpty())
            out.print("Total: " + ((ShoppingCartLocal) session.getAttribute("shoppingCart")).getTotalValue() + "€");
    %>
</body>
</html>
