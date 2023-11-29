package com.sikiedu.utils;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.beans.PropertyVetoException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBUtil {

    private static final DataSource dataSource;

    static {
        dataSource = setupDataSource();
    }

    private static DataSource setupDataSource() {
        ComboPooledDataSource cpds = new ComboPooledDataSource();
        try {
            cpds.setDriverClass("com.mysql.cj.jdbc.Driver");
            cpds.setJdbcUrl("jdbc:mysql://localhost:3306/sweetcake");
            cpds.setUser("root");
            cpds.setPassword("");
            // Optionally configure other settings like initial pool size, max pool size, etc.
        } catch (PropertyVetoException ex) {
            Logger.getLogger(DBUtil.class.getName()).log(Level.SEVERE, "Error setting up data source", ex);
            throw new RuntimeException("Error initializing datasource: " + ex.getMessage(), ex);
        }
        return cpds;
    }

    public static DataSource getDataSource() {
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}
