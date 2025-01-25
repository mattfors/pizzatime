package org.fors;

import io.github.cdimascio.dotenv.Dotenv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MySQLTest {
    public static void main(String[] args) {
        Dotenv dotenv = Dotenv.load();

        String jdbcDriver = "com.mysql.cj.jdbc.Driver";
        String jdbcConnectionURL = dotenv.get("MYSQL_CONNECTION_URL");
        String jdbcUsername = dotenv.get("MYSQL_USER");
        String jdbcPassword = dotenv.get("MYSQL_PASSWORD");

        try {
            // Load the JDBC driver
            Class.forName(jdbcDriver);

            // Establish the connection
            Connection connection = DriverManager.getConnection(jdbcConnectionURL, jdbcUsername, jdbcPassword);

            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a query
            ResultSet resultSet = statement.executeQuery("SELECT VERSION()");

            // Process the result set
            while (resultSet.next()) {
                String result = resultSet.getString(1);
                System.out.println("Result: " + result);
            }

            // Close the resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}