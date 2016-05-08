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
                <div class="row">
                    <%ArrayList<Book> list = ((ShoppingCartLocal) session.getAttribute("shoppingCart")).getShoppingCartList();
                        if (list != null) {
                            for (Book book : list) {%>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail contenedor">
                            <img src="./Resources/llamas1.jpg" height="30%" width="30%" class="bookImage">
                            <div class="caption text-center">
                                <h3><%out.print(book.getBookName());%></h3>
                                <p>
                                    <br><%out.print(book.getAuthor());%>
                                    <br><%out.print(book.getDescription()); %>
                                    <br><%out.print(book.getPrice() + " €");%> 
                                </p>
                                <form name="removeFromCart" action="FrontServlet">
                                    <input type="hidden" name="command" value="RemoveBookFromCartCommand">
                                    <input type="hidden" name="bookIsbn" value='<% out.print(book.getIsbn()); %>'>
                                    <input type="submit" name="Remove" value="Remove">
                                </form>
                            </div>
                        </div>
                    </div>

                    <%}
                        }
                    %>
                </div>

            </div>
            <nav class="navbar navbar-inverse">

                <%if (!((ShoppingCartLocal) session.getAttribute("shoppingCart")).isEmpty()) {%>
                <h3><span class="nav navbar-nav navbar-text">
                        <%out.print("Total: " + ((ShoppingCartLocal) session.getAttribute("shoppingCart")).getTotalValue() + "€");%>
                    </span></h3>
                <h3><li><a href="PersonalPurchaseDetails.jsp" ><i class="fa fa-money" aria-hidden="true"></i> Buy All</a></li> </h3>
                        <%}%>
            </nav>
        </main>

    </body>
</html>
