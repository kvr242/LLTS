/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author WIN8
 */
public class DbConnection {
    public static Connection con = null;
    public static Connection getConnection(){
            try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/llts_db", "root", "root");
            } catch (Exception e) {
                    e.printStackTrace();
            }
            return con;
    }
    public static void main(String[] args) {
            System.out.println("Connection is : "+getConnection());
    }
    
}
