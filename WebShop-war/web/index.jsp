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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            ArrayList<Book> list =(ArrayList) request.getAttribute("products");
            for (Book product : list){
            %>
            <p>
                <%
                    out.print(product.getBookName());
                    %> 
            </p>
            <%}
                %>
    </body>
</html>
