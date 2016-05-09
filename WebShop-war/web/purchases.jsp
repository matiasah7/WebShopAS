<%@page import="util.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@page import="entity.Purchase"%>
<%@page import="util.Statistics"%>
<%@page import="javax.naming.InitialContext"%>
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
        <title>WebShop Customer Purchases</title>
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
                <div class="navbar-header">
                    <p class="navbar-brand">
                        <% Statistics stats = InitialContext.doLookup("java:global/WebShop/WebShop-ejb/Statistics!util.Statistics");
                            out.print("New visitors in last minute: " + stats.getVisitors()); %>    
                    </p>
                </div>
                <div class="navbar-header">
                    <p class="navbar-brand">
                        <% out.print("Sold Books in last minute: " + stats.getSoldBooks()); %>    
                    </p>
                </div>
            </nav>
        </header>

        <main>
            <div class="jumbotron ">
                <%
                    if (session.getAttribute("customerPurchases") != null) {
                        List<Purchase> purchases = (ArrayList<Purchase>) session.getAttribute("customerPurchases");

                        for (Purchase purchase : purchases) {
                %>
                <h3> Purchase id: <% out.print(purchase.getId()); %>  Dni: <% out.print(purchase.getDni()); %> </h3>
                <%
                %>
                <table class="table table-striped">
                    <tr>
                        <td><strong>Book</strong></td>
                        <td><strong>Author</strong></td>
                        <td><strong>Price</strong></td>
                    </tr>
                    <tr>
                        <% ArrayList<Book> list = (ArrayList) purchase.getPurchasecart();
                            if (list != null) {
                                for (Book book : list) { %>
                        <td><% out.print(book.getBookName()); %></td>
                        <td><% out.print(book.getAuthor()); %></td>
                        <td><% out.print(book.getPrice() + " €"); %></td>
                    </tr>

                    <% }
                        } %>
                </table>
                <br>
                <br>
                <br>
                <% }
                    }%>
            </div>
        </main>

    </body>
</html>
