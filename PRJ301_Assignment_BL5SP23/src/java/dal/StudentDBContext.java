/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Major;
import model.Student;

/**
 *
 * @author admin
 */
public class StudentDBContext extends DBContext {
    public int getIdByEmail(String stuemail){
        try {
            String sql = "SELECT stuid FROM Student WHERE stuemail = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, stuemail);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("stuid");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public Student getStudent(int studentid) {
        
        String sql = "SELECT s.stuid, s.stuname, s.stuemail, s.stugender, s.studob, s.stuphone, s.stuaddress, "
                + "m.mid, m.mname "
                + " FROM Student s INNER JOIN Major m"
                + " ON s.mid = m.mid WHERE s.stuid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, studentid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                Major m = new Major();
              
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                s.setEmail(rs.getString("stuemail"));
                s.setGender(rs.getBoolean("stugender"));
                s.setDob(rs.getString("studob"));
                s.setPhone(rs.getString("stuphone"));
                s.setAddress(rs.getString("stuaddress"));

                m.setId(rs.getInt("mid"));
                m.setName(rs.getString("mname"));
                s.setMid(m);
                
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    public void update(Student student) {
        try {
            String sql = "Update Student set studob=?,stuphone=?,stuaddress=? where stuid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student.getDob());
            stm.setString(2, student.getPhone());
            stm.setString(3, student.getAddress());
            stm.setInt(4, student.getId());
            stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /*public static void main(String[] args) {
        int i =  new StudentDBContext().getIdByEmail("TuNTCHE176697@fpt.edu.vn");
        Student s = new StudentDBContext().getStudent(i);
        //ArrayList<Session> sessions = new LectureDBContext().getSessions(i);
        System.out.println(i);
        System.out.println(s);
}*/
}
