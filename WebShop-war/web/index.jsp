<%@page import="javax.naming.InitialContext"%>
<%@page import="util.Statistics"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="entity.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="./Resources/css/font-awesome.css">
        <link rel="stylesheet" href="style.css">
        <title>WebShop</title>
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
                            //out.print("Visitors: " + request.getAttribute("visitors")); 
                            out.print("Visitors: " + stats.getVisitors()); %>    
                    </p>
                </div>
            </nav>
        </header>

        <main>

            <div class="jumbotron ">
                <div class="row">
                    <%
                        ArrayList<Book> list = (ArrayList) session.getAttribute("books");
                        if (list != null) {
                            for (Book book : list) {
                    %>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail contenedor">
                            <img src="./Resources/llamas1.jpg" height="30%" width="30%" class="bookImage">
                            <div class="caption text-center">
                                <h3><%out.println(book.getBookName());%></h3>    
                                <p>
                                    <br><%out.println(book.getAuthor());%>
                                    <br><%out.println(book.getDescription());%>
                                    <br><%out.println(book.getPrice() + " €");%> 
                                </p>
                                <form name="addToCart" action="FrontServlet">
                                    <input type="hidden" name="command" value="AddBookToCartCommand">
                                    <input type="hidden" name="bookIsbn" value='<% out.print(book.getIsbn()); %>'>
                                    <button type="submit" class="btn btn-primary" value="Add" name="add">Add</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%}
                        }
                    %>
                </div>
            </div>
        </main>

        <footer>
            <nav>
                <form name="viewPage" action="FrontServlet">
                    <input type="submit" class="btn btn-toolbar" value="1" name="homePageNumber"></input>
                    <% for (int i = 2; i <= (int) Math.ceil(((double)((ArrayList) session.getAttribute("allBooks")).size() / 3)); i++) { %> 
                    <input type="submit" class="btn btn-toolbar" value="<% out.print(i); %>" name="homePageNumber"></input>
                    <%   }%>
                </form>
            </nav>
        </footer>  
    </body>
</html>
