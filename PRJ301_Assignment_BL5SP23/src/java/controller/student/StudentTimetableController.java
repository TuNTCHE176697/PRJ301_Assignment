/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.student;

import dal.LectureDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.TimeSlotDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import model.Session;
import model.TimeSlot;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class StudentTimetableController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");        
        StudentDBContext StuDB = new StudentDBContext();
        int stuid = StuDB.getIdByEmail(email);
        
        String raw_from = request.getParameter("from");
        java.sql.Date from = null;
        java.sql.Date to = null;
        
        
        if(raw_from == null || raw_from.length() == 0)
        {
            Date today = new Date();
            Date raw_to = DateTimeHelper.addDays(today, 6);
            from = DateTimeHelper.toDateSql(today);
            to = DateTimeHelper.toDateSql(raw_to);
        }
        else
        {
            from = java.sql.Date.valueOf(raw_from);
            Date e_from = DateTimeHelper.toDateUtil(from);
            Date raw_to = DateTimeHelper.addDays(e_from, 6);
            to = DateTimeHelper.toDateSql(raw_to);
        }
        
        ArrayList<java.sql.Date> dates = DateTimeHelper.getDatesList(from, to);
        request.setAttribute("stuid", stuid);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("dates", dates);
        
        TimeSlotDBContext TimeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = TimeDB.getSlots();
        request.setAttribute("slots", slots);
        
        ArrayList<Session> sessions = StuDB.getSessions(stuid);
        request.setAttribute("sessions", sessions);
        
        request.getRequestDispatcher("../view/student/timetable.jsp").forward(request, response);
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
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
