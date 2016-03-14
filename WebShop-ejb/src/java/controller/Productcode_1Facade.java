/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Productcode_1;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Matias
 */
@Stateless
public class Productcode_1Facade extends AbstractFacade<Productcode_1> implements Productcode_1FacadeLocal {

    @PersistenceContext(unitName = "WebShop-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public Productcode_1Facade() {
        super(Productcode_1.class);
    }
    
}
