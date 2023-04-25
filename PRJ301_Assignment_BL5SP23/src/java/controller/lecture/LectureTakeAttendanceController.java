/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecture;


import controller.auth.lecture.BaseAuthorizationController;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Attendance;
import model.Session;
import model.Student;

public class LectureTakeAttendanceController extends BaseAuthorizationController  {

    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response,Account account) 
            throws ServletException, IOException {
        int seid = Integer.parseInt(request.getParameter("seid"));
        SessionDBContext SesDB = new SessionDBContext();
        Session session = SesDB.getSession(seid);
        request.setAttribute("ses", session);
        request.setAttribute("seid", seid);
        request.getRequestDispatcher("../view/lecture/takeattendance.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response,Account account) 
            throws ServletException, IOException {
        Session ses = new Session();
        ses.setId(Integer.parseInt(request.getParameter("seid")));
        String[] stuids = request.getParameterValues("stuid");
        for (String stuid : stuids) {
            Attendance a = new Attendance();
            Student s = new Student();
            a.setStudent(s);
            a.setDescription(request.getParameter("description" + stuid));
            a.setPresent(request.getParameter("present" + stuid).equals("present"));
            s.setId(Integer.parseInt(stuid));
            ses.getAttendances().add(a);
        }
        SessionDBContext db = new SessionDBContext();
        db.update(ses);     
        response.sendRedirect("takeattend?seid=" + ses.getId());

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
