/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public abstract class DBContext<T> {
    protected Connection connection;

    public DBContext() {
        try {
            String username = "sa";
            String password = "12345678";
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=BL5_Assignment";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection =  DriverManager.getConnection(url,username,password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
