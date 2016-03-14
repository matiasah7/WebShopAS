/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Matias
 */
public abstract class FrontCommand {
 
    protected ServletContext context;
    protected HttpServletRequest request;
    protected HttpServletResponse response;
 
    public void init(ServletContext servletContext, HttpServletRequest req, HttpServletResponse resp) {
        this.context = servletContext;
        this.request = req;
        this.response = resp;
    }
   
    public void forward(String target) throws ServletException, IOException {
        RequestDispatcher dp = context.getRequestDispatcher(target);
        dp.forward(request, response);
    }
 
    abstract public void process();
}