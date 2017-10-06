/*
 * Project Workshop CMPP264(Java)
 * Author: Kaan
 * Purpose: Database connection for Travel Experts mySql database
 * Date: September 2017
 *
 * */

package com.travelexperts.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TravelExpertsDB {

    public static Connection getConnection()
    {
        try
        {
            System.out.println("Connecting to Travel Experts Database...");

            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn =
                    DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts", "root", "");
            return conn;

        }
        catch (SQLException e)
        {
            System.out.println("Something went wrong with database connection");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }

}




