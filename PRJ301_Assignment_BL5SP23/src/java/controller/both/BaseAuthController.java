/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.both;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author admin
 */

public abstract class BaseAuthController extends HttpServlet {
   
    private boolean isAuth(HttpServletRequest request)
    {
        Account account = (Account) request.getSession().getAttribute("account");
        if(account == null)
            return false;
        else
        {
            String url = request.getServletPath();
            AccountDBContext db = new AccountDBContext();
            int num = db.getNumberOfRoles(account.getEmail(), url);
            return num >=1;
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        if(isAuth(request))
        {
            processGet(request, response);
        }
        else
        {
            request.getRequestDispatcher("../view/accessDenied.jsp").forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException;
    
    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException;
        
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        if(isAuth(request))
        {
            processPost(request, response);
        }
        else
        {
            request.getRequestDispatcher("../view/accessDenied.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
