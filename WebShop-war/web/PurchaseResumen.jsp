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
                <table class="table table-striped">
                    <tr>
                        <td><strong>Book</strong></td>
                        <td><strong>Author</strong></td>
                        <td><strong>Price</strong></td>
                    </tr>
                    <tr>
                        <%ArrayList<Book> list = ((ShoppingCartLocal) session.getAttribute("purchaseResumenCart")).getShoppingCartList();
                            if (list != null) {
                                for (Book book : list) {%>
                        <td><%out.print(book.getBookName());%></td>
                        <td><%out.print(book.getAuthor());%></td>
                        <td><%out.print(book.getPrice() + " €");%></td>
                    </tr>

                                <%}
                            }%>
                </table>
            </div>
        </main>
        <footer>     
            <nav class="navbar navbar-inverse">

                <%if (!((ShoppingCartLocal) session.getAttribute("shoppingCart")).isEmpty()) {%>
                <h3><span class="nav navbar-nav navbar-text">
                        <% out.print("Total: " + ((ShoppingCartLocal) session.getAttribute("shoppingCart")).getTotalValue() + "€");
                            }%>
                    </span></h3>
                <h3><li><a href="index.jsp" ><i class="fa fa-home" aria-hidden="true"></i> Home</a></li> </h3>
            </nav>
        </footer>
    </body>
</html>
