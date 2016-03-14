/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import controller.BookFacadeLocal;
import controller.ProductFacadeLocal;
import entity.Book;
import entity.Product;
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
public class HomePageCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            BookFacadeLocal bookFacade = InitialContext.doLookup("java:global/WebShop/WebShop-ejb/BookFacade");
            List<Book> products = bookFacade.findAll();
            ArrayList<Book> productsList = new ArrayList();
            for (Book product : products) {
                productsList.add(product);
            }
            request.setAttribute("products", productsList);
            forward("/index.jsp");
        } catch (ServletException ex) {
            Logger.getLogger(HomePageCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(HomePageCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(HomePageCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
