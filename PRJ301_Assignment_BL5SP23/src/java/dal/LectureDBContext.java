/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lecture;

/**
 *
 * @author admin
 */
public class LectureDBContext extends DBContext {
    public int getIdByEmail (String email)
    {
        try {
            String sql = "select [leid] from [Lecture] where [leemail] = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,email );
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                int id = rs.getInt("leid");
                return id;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LectureDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
       
    }
    
    public Lecture getLecture (int id)
    {
        try {
            String sql = "select * from [Lecture] where leid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                Lecture lecture = new Lecture();
                lecture.setId(rs.getInt("leid"));
                lecture.setName(rs.getString("lename"));
                lecture.setEmail(rs.getString("leemail"));
                lecture.setGender(rs.getBoolean("legender"));
                lecture.setDob(rs.getString("ledob"));
                lecture.setPhone(rs.getString("lephone"));
                lecture.setAddress(rs.getString("leadress"));
                
                return lecture;
                  
            }
        } catch (SQLException ex) {
            Logger.getLogger(LectureDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
                return null;
        
    }
    
    public void updateLecture (Lecture l)
    {
        String sql = "update [Lecture] "
                + "set [ledob] = ?, [lephone] = ?, [leadress] = ? "
                + "where [leid] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, l.getDob());
            stm.setString(2, l.getPhone());
            stm.setString(3, l.getAddress());
            stm.setInt(4, l.getId());
           
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LectureDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

/*public static void main(String[] args) {
        int i =  new LectureDBContext().getIdByEmail("BanTQ3@fpt.edu.vn");
        Lecture l = new LectureDBContext().getLecture( new LectureDBContext().getIdByEmail("BanTQ3@fpt.edu.vn"));
        System.out.println(i);
        System.out.println(l);
    }*/
    }
