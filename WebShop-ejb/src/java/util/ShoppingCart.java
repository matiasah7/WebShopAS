/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import entity.Book;
import java.util.ArrayList;
import javax.ejb.Stateful;

/**
 *
 * @author Matias
 */
@Stateful
public class ShoppingCart implements ShoppingCartLocal {

    ArrayList<Book> shoppingCart = new ArrayList();
    
    @Override
    public ArrayList<Book> getShoppingCartList() {
        return shoppingCart;
    }

    @Override
    public void addBook(Book book) {
        shoppingCart.add(book);
    }

    @Override
    public void removeBook(Book book) {
        shoppingCart.remove(book);
    }

    @Override
    public void removeBook(int cartBookId) {
        shoppingCart.remove(cartBookId);
    }

    @Override
    public void clear() {
        shoppingCart.clear();
    }

    @Override
    public int getTotalValue() {
        int totalValue = 0;
        for (Book book : shoppingCart) {
            totalValue+=book.getPrice();
        }
        return totalValue;
    }
}
