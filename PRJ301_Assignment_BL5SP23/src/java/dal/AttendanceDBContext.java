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
import model.Attendance;
import model.Session;
import model.Student;

/**
 *
 * @author admin
 */
public class AttendanceDBContext extends DBContext{
    
    public ArrayList<Attendance> getAttendances() {
        ArrayList<Attendance> attendances = new ArrayList<>();
        
        String sql = "SELECT * FROM Attendance";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                Student  s = new Student();
                Session se = new Session();
                
                a.setPresent(rs.getBoolean("present"));
                a.setDescription(rs.getString("description"));

                s.setId(rs.getInt("stuid"));
                se.setId(rs.getInt("seid"));
                
                a.setStudent(s);
                a.setSession(se);
                
                attendances.add(a);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return attendances;
    }
}
