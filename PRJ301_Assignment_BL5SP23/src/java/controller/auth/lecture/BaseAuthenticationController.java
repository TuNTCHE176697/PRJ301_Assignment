/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth.lecture;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

public abstract class BaseAuthenticationController extends HttpServlet {
    private boolean isAuthenticated(HttpServletRequest request)
    {
        Account account = (Account)request.getSession().getAttribute("account");
        return account != null;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(isAuthenticated(request))
        {
            //process business
            processPost(request, response);
        }
        else
        {
            request.getRequestDispatcher("../view/lecture/auth/accessDenied.jsp").forward(request, response);
        }
    }
    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(isAuthenticated(request))
        {
            //process business
            processGet(request, response);
        }
        else
        {
            request.getRequestDispatcher("../view/lecture/auth/accessDenied.jsp").forward(request, response);
        }
    }
    
}
