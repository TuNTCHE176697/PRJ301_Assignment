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
import model.Group;
import model.Lecture;
import model.Room;
import model.Session;
import model.Student;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author admin
 */
public class SessionDBContext extends DBContext {

    public Session getSession(int seid) {

        try {
            String sql = "SELECT ses.seid,ses.gid,ses.date,ses.tid,ses.leid,ses.attend,ses.[index],\n"
                    + "   g.gid,g.gname,\n"
                    + "   r.rid,r.rname,\n"
                    + "   t.tid,t.[description] tdes,t.tname,\n"
                    + "   l.leid,l.lename,\n"
                    + "   s.subid,s.subname,\n"
                    + "   st.stuid,st.stuname,\n"
                    + "   ISNULL(a.present,0) present, ISNULL(a.[description],'')[description]\n"
                    + "   FROM Session ses \n"
                    + "   INNER JOIN Room r ON r.rid = ses.rid\n"
                    + "   INNER JOIN TimeSlot t ON t.tid = ses.tid\n"
                    + "   INNER JOIN Lecture l ON l.leid = ses.leid\n"
                    + "   INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "   INNER JOIN [Subject] s ON s.subid = g.subid\n"
                    + "   INNER JOIN [Student_Group] sg ON sg.gid = g.gid\n"
                    + "   INNER JOIN [Student] st ON st.stuid = sg.stuid\n"
                    + "   LEFT JOIN Attendance a ON a.stuid = st.stuid AND ses.seid = a.seid\n"
                    + "   WHERE ses.seid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, seid);
            ResultSet rs = stm.executeQuery();
            Session ses = null;
            while (rs.next()) {
                if (ses == null) {
                    ses = new Session();
                    Room r = new Room();
                    r.setId(rs.getInt("rid"));
                    r.setName(rs.getString("rname"));
                    ses.setRoom(r);

                    TimeSlot t = new TimeSlot();
                    t.setId(rs.getInt("tid"));
                    t.setDescription(rs.getString("tdes"));
                    t.setName(rs.getString("tname"));
                    ses.setTimeslot(t);

                    Lecture l = new Lecture();
                    l.setId(rs.getInt("leid"));
                    l.setName(rs.getString("lename"));
                    ses.setLecture(l);

                    Group g = new Group();
                    g.setId(rs.getInt("gid"));
                    g.setName(rs.getString("gname"));
                    ses.setGroup(g);

                    Subject sub = new Subject();
                    sub.setId(rs.getInt("subid"));
                    sub.setName(rs.getString("subname"));
                    g.setSubject(sub);

                    ses.setDate(rs.getDate("date"));
                    ses.setIndex(rs.getInt("index"));
                    ses.setAttendated(rs.getBoolean("attend"));
                }
                //read student
                Student s = new Student();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                //read attandance
                Attendance a = new Attendance();
                a.setStudent(s);
                a.setSession(ses);
                a.setPresent(rs.getBoolean("present"));
                a.setDescription(rs.getString("description"));
                ses.getAttendances().add(a);
            }
            return ses;
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(Session session) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [Session] SET attend = 1 WHERE seid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, session.getId());
            stm.executeUpdate();

            //remove old attandances
            sql = "DELETE Attendance WHERE seid = ?";
            PreparedStatement stm_delete = connection.prepareStatement(sql);
            stm_delete.setInt(1, session.getId());
            stm_delete.executeUpdate();

            //insert new attandances
            for (Attendance att : session.getAttendances()) {
                sql = "INSERT INTO [Attendance]\n"
                        + "           ([seid]\n"
                        + "           ,[stuid]\n"
                        + "           ,[present]\n"
                        + "           ,[description])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";
                PreparedStatement stm_insert = connection.prepareStatement(sql);
                stm_insert.setInt(1, session.getId());
                stm_insert.setInt(2, att.getStudent().getId());
                stm_insert.setBoolean(3, att.isPresent());
                stm_insert.setString(4, att.getDescription());
                stm_insert.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public ArrayList<Session> GetSessionsByGroupIdandStuID(int gid_input, int stuid) {
        ArrayList<Session> sessions = new ArrayList<>();
        String sql = "SELECT ses.[index],ses.seid,ses.date,ses.attend,g.gid,g.gname,r.rid,r.rname,t.tid,t.tname, t.description, l.leid, l.lename, a.present,a.description as comment\n"
                + "FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n"
                + "INNER JOIN Room r ON r.rid = ses.rid\n"
                + "INNER JOIN TimeSlot t ON t.tid = ses.tid\n"
                + "INNER JOIN Lecture l on l.leid = ses.leid\n"
                + "INNER JOIN Student_Group sg ON sg.gid = g.gid\n"
                + "INNER JOIN Student stu ON stu.stuid = sg.stuid\n"
                + "left JOIN Attendance a on a.stuid = stu.stuid and a.seid = ses.seid\n"
                + "WHERE stu.stuid = ? and g.gid = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, stuid);
            stm.setInt(2, gid_input);
            rs = stm.executeQuery();

            while (rs.next()) {
                Session s = new Session();
                s.setIndex(rs.getInt("index"));
                s.setId(rs.getInt("seid"));
                s.setDate(rs.getDate("date"));
                s.setAttendated(rs.getBoolean("attend"));

                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                s.setGroup(g);

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

                Attendance a = new Attendance();
                a.setPresent(rs.getBoolean("present"));
                a.setDescription(rs.getString("comment"));
                s.setAttendance(a);

                sessions.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public ArrayList<Session> getSessionsByLeidAndGid(int leid, int gid) {
        ArrayList<Session> sessions = new ArrayList<>();
        String sql = "select s.stuid, s.stuname, ses.seid, ses.[index], ses.date, ses.attend, g.gid, g.gname, a.present\n"
                + "from Student s inner join Student_Group sg on sg.stuid = s.stuid\n"
                + "		  inner join [Group] g on g.gid = sg.gid\n"
                + "		  inner join [Session] ses on ses.gid = g.gid\n"
                + "		  left join [Attendance] a on a.seid = ses.seid and a.stuid = s.stuid\n"
                + "where g.gid = ? and ses.leid = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setInt(2, leid);
            rs = stm.executeQuery();

            while (rs.next()) {
                Session s = new Session();
                s.setIndex(rs.getInt("index"));
                s.setId(rs.getInt("seid"));
                s.setDate(rs.getDate("date"));
                s.setAttendated(rs.getBoolean("attend"));

                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                s.setGroup(g);

                Attendance a = new Attendance();
                a.setPresent(rs.getBoolean("present"));
                s.setAttendance(a);
                
                ArrayList<Student> students = new ArrayList<>();
                for (Student student: students)
                {
                    student.setId(rs.getInt("stuid"));
                    student.setName(rs.getString("stuname"));
                    students.add(student);   
                }
                s.setStudents(students);
                sessions.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }
    /*public static void main(String[] args) {
        int i =  new StudentDBContext().getIdByEmail("TuNTCHE176697@fpt.edu.vn");
        //Student s = new StudentDBContext().getStudent(i);
        ArrayList<Session> sessions = new SessionDBContext().GetSessionsByGroupIdandStuID(3,i);
        //System.out.println(i);
        System.out.println(sessions);
}*/
}
