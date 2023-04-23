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
import model.TimeSlot;

/**
 *
 * @author admin
 */
public class TimeSlotDBContext extends DBContext{
    
    public ArrayList<TimeSlot> getSlots()
    {
        ArrayList<TimeSlot> slots = new ArrayList<>();
        try {          
            String sql = "select * from TimeSlot";
            PreparedStatement stm  = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                TimeSlot slot = new TimeSlot();
                slot.setId(rs.getInt("tid"));
                slot.setName(rs.getString("tname"));
                slot.setDescription(rs.getString("description"));
                slots.add(slot);
            }
          
        } catch (SQLException ex) {
            Logger.getLogger(TimeSlotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
          
        return slots;
    }
    
}
