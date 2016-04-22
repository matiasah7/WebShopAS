
package frontController;

import entity.Book;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import util.ShoppingCart;
import util.ShoppingCartLocal;
import util.Statistics;

public class PurchaseFinishCommand extends FrontCommand{

    @Override
    public void process() {
        ShoppingCartLocal shoppingCart = (ShoppingCartLocal) request.getSession().getAttribute("shoppingCart");
        ShoppingCartLocal purchaseResumenCart = new ShoppingCart();
        for (Book book : shoppingCart.getShoppingCartList()) {
            purchaseResumenCart.addBook(book);
        }
        request.getSession().setAttribute("purchaseResumenCart", purchaseResumenCart);
        try {
            Statistics stats = InitialContext.doLookup("java:global/WebShop/WebShop-ejb/Statistics!util.Statistics");
            stats.addSoldBooks(shoppingCart.getShoppingCartList().size());
        } catch (NamingException ex) {
            Logger.getLogger(PurchaseFinishCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        shoppingCart.clear();
        try {
            forward("/PurchaseResumen.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(PurchaseFinishCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
