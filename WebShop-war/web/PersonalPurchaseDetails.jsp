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
                <form name="purchaseFinish" action="FrontServlet">
                    <input type="hidden" name="command" value="PurchaseFinishCommand">
                    <div class="form-group">
                        <label for="Namme">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Name">
                    </div>
                    <div class="form-group">
                        <label for="Surname">Surname</label>
                        <input type="text" class="form-control" id="surname" placeholder="Surname">
                    </div>
                    <div class="form-group">
                        <label for="dni">DNI</label>
                        <input type="text" class="form-control" id="dni" placeholder="DNI">
                    </div>
                    <div class="form-group">
                        <label for="Phone">Phone</label>
                        <input type="number" class="form-control" id="phone" placeholder="Phone">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="Address">Address</label>
                        <input type="text" class="form-control" id="address" placeholder="Address">
                    </div>
                    <div class="form-group">
                        <label for="Card Number">Card Number</label>
                        <input type="number" class="form-control" id="cardnumber" placeholder="CardNumber">
                    </div>
                    <label>Card </label>
                    <select class="form-control"> 
                        <option>Visa</option>
                        <option>MasterCard</option>
                    </select>
                    <br>
                    <button type="submit" class="btn btn-default">Pay</button>
                </form>

            </div>
            <nav class="navbar navbar-inverse">
                <%if (!((ShoppingCartLocal) session.getAttribute("shoppingCart")).isEmpty()) {%>
                <h3><span class="nav navbar-nav navbar-text">
                        <%out.print("Total: " + ((ShoppingCartLocal) session.getAttribute("shoppingCart")).getTotalValue() + "€");
                            }%>
                    </span></h3>
            </nav>
        </main>

    </body>
</html>
