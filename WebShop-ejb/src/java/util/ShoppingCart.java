package util;

import entity.Book;
import java.io.Serializable;
import java.util.ArrayList;
import javax.ejb.Schedule;
import javax.ejb.Stateful;

@Stateful
public class ShoppingCart implements ShoppingCartLocal, Serializable{

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

    @Override
    public boolean isEmpty() {
        return (shoppingCart.isEmpty());
    }
}
