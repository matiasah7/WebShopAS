/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import entity.Book;
import java.util.ArrayList;
import javax.ejb.Local;

/**
 *
 * @author alumno
 */
@Local
public interface ShoppingCartLocal {
    ArrayList<Book> getShoppingCartList();
    void addBook(Book book);
    void removeBook(Book book);
    void removeBook(int cartBookId);
    void clear();
    int getTotalValue();
}
