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
import util.ShoppingCartLocal;

/**
 *
 * @author Matias
 */
public class PurchaseFinishCommand extends FrontCommand{

    @Override
    public void process() {
        ShoppingCartLocal shoppingCart = (ShoppingCartLocal) request.getSession().getAttribute("shoppingCart");
        ShoppingCartLocal purchaseResumenCart = new ShoppingCart();
        for (Book book : shoppingCart.getShoppingCartList()) {
            purchaseResumenCart.addBook(book);
        }
        request.getSession().setAttribute("purchaseResumenCart", purchaseResumenCart);
        shoppingCart.clear();
        try {
            forward("/PurchaseResumen.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(PurchaseFinishCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
