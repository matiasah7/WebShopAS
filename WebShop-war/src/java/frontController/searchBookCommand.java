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
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;

/**
 *
 * @author Matias
 */
public class searchBookCommand extends FrontCommand {

    @Override
    public void process() {
        BookFacadeLocal bookFacade;
        try {
            bookFacade = InitialContext.doLookup("java:global/WebShop/WebShop-ejb/BookFacade");
            List<Book> products = bookFacade.findAll();
            ArrayList<Book> productsList = new ArrayList();
            String query = request.getParameter("search");
            for (Book book : products) {
                if(book.getAuthor().toLowerCase().contains(query.toLowerCase()))
                    productsList.add(book);
                else if(book.getBookName().toLowerCase().contains(query.toLowerCase())) 
                    productsList.add(book);
                else if(book.getIsbn().toString().toLowerCase().contains(query.toLowerCase())) 
                    productsList.add(book);
                else if(book.getDescription().toLowerCase().contains(query.toLowerCase())) 
                    productsList.add(book);
            }
                     
            
            request.getSession().setAttribute("books", productsList);
            forward("/index.jsp");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(searchBookCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
