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
        <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="./Resources/css/font-awesome.css">
        <link rel="stylesheet" href="style.css">
        <title>WebShop Shopping Cart</title>
    </head>
    <body class="container">
        <header>
            <nav class="navbar navbar-inverse">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">Welcome to our store!</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="cart"><a href="ShoppingCart.jsp" ><i class="fa fa-shopping-cart" aria-hidden="true"></i> Shopping Cart</a></li> 
                </ul>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="index.jsp" ><i class="fa fa-home" aria-hidden="true"></i> Home</a></li> 
                </ul>
            </nav>
        </header>

        <main>
            <div class="jumbotron ">
                    <%
                        ArrayList<Book> list = ((ShoppingCartLocal) session.getAttribute("shoppingCart")).getShoppingCartList();
                        if (list != null) {
                            for (Book book : list) {
                    %>
                                <h3>   
                                    <%
                                        out.print(book.getBookName());
                                    %>
                                </h3>
                                <p>
                                    <br>
                                    <%
                                        out.print(book.getAuthor());
                                    %>
                                    <br>
                                    <%out.print(book.getDescription()); %>
                                    <br>
                                    <%out.print(book.getPrice() + " €");
                                    %> 
                                </p>

                    <%}
                        }
                    %>

            </div>
            <nav class="navbar navbar-inverse">

                <%
                    if (!((ShoppingCartLocal) session.getAttribute("shoppingCart")).isEmpty()) {
                %>
                <h3><span class="nav navbar-nav navbar-text">
                        <%
                                out.print("Total: " + ((ShoppingCartLocal) session.getAttribute("shoppingCart")).getTotalValue() + "€");
                            }
                        %>
                    </span></h3>
            </nav>
        </main>

    </body>
</html>