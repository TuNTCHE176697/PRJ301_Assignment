/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth.lecture;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Feature;
import model.Role;

public abstract class BaseAuthorizationController extends BaseAuthenticationController {

    private boolean isAuthorized(HttpServletRequest request)
    {
       Account account = (Account)request.getSession().getAttribute("account");
       String currentUrl = "Lecture";
        for (Role role : account.getRoles()) {
            for (Feature feature : role.getFeatures()) {
                if(feature.getUrl().equals(currentUrl))
                    return true;
            }
        }
        return false;
    }
    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(isAuthorized(request))
        {
            processPost(request, response, (Account)request.getSession().getAttribute("account"));
        }
        else
        {
           request.getRequestDispatcher("../../view/lecture/auth/accessDenied.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(isAuthorized(request))
        {
            processGet(request, response, (Account)request.getSession().getAttribute("account"));
        }
        else
        {
            request.getRequestDispatcher("../../view/lecture/auth/accessDenied.jsp").forward(request, response);
        }
    }
    
    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response,Account account) throws ServletException, IOException;
    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response,Account account) throws ServletException, IOException;
    
    
}
