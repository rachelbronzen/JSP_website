package common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB_Connection {
    public static void main(String[] args) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        
        // Test connection to the `membership_crud` database
        System.out.println("Membership DB: " + obj_DB_Connection.get_connection("membership_crud"));

        // Test connection to the `book` database
        System.out.println("Book DB: " + obj_DB_Connection.get_connection("book"));
    }

    // Generic method to get connection based on database name
    public Connection get_connection(String databaseName) {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Deprecated, use com.mysql.cj.jdbc.Driver for newer MySQL versions
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/" + databaseName, "root", "HAHAhihi1110?");
        } catch (Exception e) {
            System.out.println("Error connecting to database " + databaseName + ": " + e);
        }
        return connection;
    }
}
