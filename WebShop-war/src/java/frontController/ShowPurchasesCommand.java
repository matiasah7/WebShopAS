/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import controller.PurchaseFacadeLocal;
import entity.Purchase;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;

/**
 *
 * @author Matias
 */
public class ShowPurchasesCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            PurchaseFacadeLocal purchaseFacade = InitialContext.doLookup("java:global/WebShop/WebShop-ejb/PurchaseFacade");
            String DNI = (String) request.getParameter("customerDNI");
            List<Purchase> purchases = purchaseFacade.findAll();
            ArrayList<Purchase> customerPurchases = new ArrayList<>();
            for (Purchase purchase : purchases) {
                if (purchase.getDni().equals(DNI)) {
                    customerPurchases.add(purchase);
                }
            }
            if (!customerPurchases.isEmpty()) {
                request.getSession().setAttribute("customerPurchases", customerPurchases);
            }
            forward("/purchases.jsp");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(ShowPurchasesCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
