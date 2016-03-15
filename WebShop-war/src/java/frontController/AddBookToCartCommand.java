/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package frontController;

import entity.Book;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import util.ShoppingCart;

/**
 *
 * @author alumno
 */
public class AddBookToCartCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
            if(request.getParameter("book")!=null) shoppingCart.addBook((Book)request.getAttribute("book"));
            
            forward("index.jsp");
        } catch (ServletException ex) {
            Logger.getLogger(AddBookToCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AddBookToCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
