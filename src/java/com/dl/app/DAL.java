package com.dl.app;
import java.sql.*;
public class DAL {
    private static Connection con = null;
    
    private void connect() {
        try {
            //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            //con = DriverManager.getConnection("jdbc:odbc:MVCDNS"); // change the dsnname based on your project
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/socmgmtsys","root",""); 
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void disconnect() {
        
        try {
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    // this method is used to execute the insert update and delete queries
    public int executeDML(String sql) {
        try {
            connect();
            Statement insertStmt = con.createStatement();
            int rownumber=0;
            insertStmt.executeUpdate(sql,insertStmt.RETURN_GENERATED_KEYS);
            ResultSet rs= insertStmt.getGeneratedKeys();
            if (rs.next()) 
            {
              rownumber= rs.getInt(1);
            } 
            return rownumber;
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            disconnect();
        }
    }

    public ResultSet executeQuery(String sql) {
        try {
            connect();
            Statement insertStmt = con.createStatement();
            ResultSet rs = insertStmt.executeQuery(sql);
            return rs;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } 
    }
}