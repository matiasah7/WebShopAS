/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Productcode_1;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Matias
 */
@Local
public interface Productcode_1FacadeLocal {

    void create(Productcode_1 productcode_1);

    void edit(Productcode_1 productcode_1);

    void remove(Productcode_1 productcode_1);

    Productcode_1 find(Object id);

    List<Productcode_1> findAll();

    List<Productcode_1> findRange(int[] range);

    int count();
    
}
