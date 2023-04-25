/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecture;

import controller.both.BaseAuthController;
import dal.LectureDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Lecture;

/**
 *
 * @author admin
 */
public class LectureInformationController extends BaseAuthController {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LectureInformationController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LectureInformationController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        LectureDBContext db = new LectureDBContext();
        Account account = (Account) request.getSession().getAttribute("account");
        Lecture lecture = db.getLecture(db.getIdByEmail(account.getEmail()));
        request.setAttribute("lecture", lecture);
        request.getRequestDispatcher("../view/lecture/information.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String raw_dob = request.getParameter("dob");
        String raw_phone = request.getParameter("phone");
        String raw_address = request.getParameter("address");
        
        String dob = raw_dob;
        String phone = raw_phone;
        String address = raw_address;
        
        Account account = (Account) request.getSession().getAttribute("account");
        LectureDBContext db = new LectureDBContext();
        
        Lecture lecture = db.getLecture(db.getIdByEmail(account.getEmail()));
        lecture.setDob(dob);
        lecture.setPhone(phone); 
        lecture.setAddress(address);
        
        db.updateLecture(lecture);
        request.setAttribute("noti", "Information updated!");
        doGet(request, response);
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
