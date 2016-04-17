/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Schedule;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import util.ShoppingCartLocal;

/**
 *
 * @author Matias
 */
public class HomePageCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            setShoppingCart();
            setBooksListAttribute(getPage());
            forward("/index.jsp");
        } catch (ServletException | IOException | NamingException ex) {
            Logger.getLogger(HomePageCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void setShoppingCart() throws NamingException {
        HttpSession session = request.getSession(true);
        ShoppingCartLocal shoppingCart = (ShoppingCartLocal) session.getAttribute("shoppingCart");

        if (shoppingCart == null) {
            shoppingCart = (ShoppingCartLocal) InitialContext.doLookup("java:global/WebShop/WebShop-ejb/ShoppingCart!util.ShoppingCartLocal");
            session.setAttribute("shoppingCart", shoppingCart);
        }
    }

    private void setBooksListAttribute(int page) throws NamingException {
        BookFacadeLocal bookFacade = InitialContext.doLookup("java:global/WebShop/WebShop-ejb/BookFacade");
        ArrayList<Book> productsList = getBooksArrayList(bookFacade, page);
        request.getSession().setAttribute("books", productsList);
    }

    private ArrayList<Book> getBooksArrayList(BookFacadeLocal bookFacade, int page) {
        int range[] = {3*(page-1),3*(page-1)+2};
        List<Book> products = bookFacade.findRange(range);
        ArrayList<Book> productsList = new ArrayList();
        productsList.addAll(products);
        return productsList;
    }

    private int getPage() {
        HttpSession session = request.getSession(true);
        if (session.getAttribute("homePageNumber") == null) {
            return 1;
        }
        return (int) session.getAttribute("homePageNumber");
    }


}
