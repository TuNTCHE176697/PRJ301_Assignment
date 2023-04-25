/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author admin
 */
public class AccountDBContext extends DBContext {

    public Account getAccount(String email, String password) {

        try {

            String sql = "Select [email], [password], [username] "
                    + "from [Acount] "
                    + "where [email] = ? and [password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                Account a = new Account();
                a.setEmail(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                a.setUsername(rs.getString("username"));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getNumberOfRoles(String email, String url) {
        try {

            String sql = "select count(*) as Total \n"
                    + "from Acount a  inner join [Role_Account] ra on a.email = ra.email\n"
                    + "inner join [Role] r on r.roid = ra.roid\n"
                    + "inner join [Role_Feature] rf on rf.roid = r.roid\n"
                    + "inner join [Feature] f on rf.fid = f.fid\n"
                    + "where a.email = ? and f.furl = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, url);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;

    }

    /*public static void main(String[] args) {
        
        Account a = new AccountDBContext().getAccount("BanTQ3@fpt.edu.vn", "112");
        System.out.println(a.getUsername());
      
}*/
}
