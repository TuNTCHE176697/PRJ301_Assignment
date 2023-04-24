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
import model.Subject;

/**
 *
 * @author admin
 */
public class GroupDBContext extends DBContext{
    
    public Group getGroup(int gid) {

        Group group = new Group();
        try {
            String sql_get_group = "SELECT g.gid, g.gname, s.subid, s.subname, g.leid, g.semester, g.year\n"
                    + "FROM [Group] g INNER JOIN Subject s on s.subid = g.subid \n"
                    + "WHERE gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql_get_group);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Group gr = new Group();
                Subject su = new Subject();
                Lecture l = new Lecture();

                su.setId(rs.getInt("subid"));
                su.setName(rs.getString("subname"));
                l.setId(rs.getInt("leid"));
                gr.setLecture(l);
                gr.setSubject(su);

                gr.setId(rs.getInt("gid"));
                gr.setName(rs.getString("gname"));
                gr.setSemester(rs.getString("semester"));
                gr.setYear(rs.getInt("year"));
                group = gr;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return group;
    }
    
    public ArrayList<Group> getGroupsByStudentId(int stuid) {
        ArrayList<Group> groups = new ArrayList<>();

        try {
            String sql = "SELECT\n"
                    + "g.gid,g.gname,su.subid,g.leid,g.semester,g.[year],su.subname\n"
                    + "FROM Student s\n"
                    + "INNER JOIN [Student_Group] sg ON sg.stuid = s.stuid\n"
                    + "INNER JOIN [Group] g ON g.gid = sg.gid\n"
                    + "INNER JOIN Subject su on su.subid = g.subid\n"
                    + "WHERE s.stuid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stuid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                g.setSemester(rs.getString("semester"));
                g.setYear(rs.getInt("year"));

                Subject s = new Subject();
                s.setId(rs.getInt("subid"));
                s.setName(rs.getString("subname"));
                g.setSubject(s);

                Lecture l = new Lecture();
                l.setId(rs.getInt("leid"));
                g.setLecture(l);

                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return groups;
    }
    
}
