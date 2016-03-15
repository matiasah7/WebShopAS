/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import controller.BookFacadeLocal;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import util.ShoppingCartLocal;

/**
 *
 * @author alumno
 */
public class AddBookToCartCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            ShoppingCartLocal shoppingCart = (ShoppingCartLocal) request.getSession().getAttribute("shoppingCart");
            if (request.getParameter("bookIsbn") != null) {
                BookFacadeLocal bookFacade = InitialContext.doLookup("java:global/WebShop/WebShop-ejb/BookFacade");
                shoppingCart.addBook(bookFacade.find(Integer.parseInt(request.getParameter("bookIsbn"))));
            }
            forward("/index.jsp");
        } catch (ServletException | IOException | NamingException ex) {
            Logger.getLogger(AddBookToCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
