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
                            out.print("New visitors in last minute: " + stats.getVisitors()); %>    
                    </p>
                </div>
                <div class="navbar-header">
                    <p class="navbar-brand">
                        <% out.print("Sold Books in last minute: " + stats.getSoldBooks());%>    
                    </p>
                </div>

            </nav>
        </header>

        <main>

            <div class="jumbotron ">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <h1>Customer DNI:</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-md-offset-3">
                            <form action="FrontServlet" class="search-form">
                                <div class="form-group has-feedback">
                                    <label for="search" class="sr-only">Search</label>
                                    <input type="hidden" name="command" value="ShowPurchasesCommand">
                                    <input type="text" class="form-control" name="customerDNI" id="search" placeholder="search">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </main>
</body>
</html>
