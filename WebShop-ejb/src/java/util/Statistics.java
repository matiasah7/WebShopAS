/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import javax.annotation.PostConstruct;
import javax.ejb.Singleton;
import javax.ejb.Startup;

/**
 *
 * @author Matias
 */
@Startup
@Singleton
public class Statistics{

    private int visitors;
    private int soldBooks;

    @PostConstruct
    public void init() {
        visitors = 0;
        soldBooks = 0;
    }
    
    public void addVisitor() {
        visitors++;
    }

    public int getVisitors() {
        return visitors;
    }

    public void addSoldBooks(int books) {
        soldBooks += books;
    }

    public int getSoldBooks() {
        return soldBooks;
    }
}
