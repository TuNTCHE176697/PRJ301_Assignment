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
import model.Group;
import model.Lecture;
import model.Major;
import model.Room;
import model.Session;
import model.Student;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author admin
 */
public class StudentDBContext extends DBContext {

    public int getIdByEmail(String stuemail) {
        try {
            String sql = "SELECT stuid FROM Student WHERE stuemail = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, stuemail);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
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

    public ArrayList<Session> getSessions(int id) {
        ArrayList<Session> sessions = new ArrayList<>();
        String sql = "SELECT ses.seid,ses.date,ses.attend,g.gid,g.gname,s.subid,s.subname,r.rid,r.rname,t.tid,t.tname, t.description, l.leid, l.lename\n"
                + "FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n"
                + "           	      INNER JOIN Room r ON r.rid = ses.rid\n"
                + "		      INNER JOIN Subject s ON s.subid = g.subid\n"
                + "                   INNER JOIN TimeSlot t ON t.tid = ses.tid\n"
                + "		      INNER JOIN Lecture l on l.leid = ses.leid\n"
                + "		      INNER JOIN Student_Group sg ON sg.gid = g.gid\n"
                + "                   INNER JOIN Student stu ON stu.stuid = sg.stuid\n"
                + "WHERE stu.stuid = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            
            while (rs.next())
            {
                Session s = new Session();
                s.setId(rs.getInt("seid"));
                s.setDate(rs.getDate("date"));
                s.setAttendated(rs.getBoolean("attend"));
                
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                s.setGroup(g);
                
                Subject su = new Subject();
                su.setId(rs.getInt("subid"));
                su.setName(rs.getString("subname"));
                g.setSubject(su);
                
                Room r = new Room();
                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                s.setRoom(r);
                
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("tid"));
                t.setName(rs.getString("tname"));
                t.setDescription(rs.getString("description"));
                s.setTimeslot(t);
                
                Lecture l = new Lecture();
                l.setId(rs.getInt("leid"));
                l.setName(rs.getString("lename"));
                s.setLecture(l);
                
                sessions.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    /*public static void main(String[] args) {
        int i =  new StudentDBContext().getIdByEmail("TuNTCHE176697@fpt.edu.vn");
        Student s = new StudentDBContext().getStudent(i);
        //ArrayList<Session> sessions = new LectureDBContext().getSessions(i);
        System.out.println(i);
        System.out.println(s);
}*/
}
