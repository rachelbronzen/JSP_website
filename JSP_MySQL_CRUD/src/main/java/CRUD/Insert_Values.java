package CRUD;

import common.DB_Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class Insert_Values {
    // Method to insert values into the `books` table
    public void insert_into_books(String id, String title, String genre, String publisher, String author, String year, String pages) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("book");
        PreparedStatement ps = null;

        try {
            String query = "INSERT INTO books(id, title, genre, publisher, author, year, pages) VALUES(?, ?, ?, ?, ?, ?, ?)";
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, title);
            ps.setString(3, genre);
            ps.setString(4, publisher);
            ps.setString(5, author);
            ps.setString(6, year);
            ps.setString(7, pages);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error inserting into books table: " + e);
        } finally {
            try {
                if (ps != null) ps.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                System.err.println("Error closing resources: " + e);
            }
        }
    }

    // Method to insert values into the `membership` table
    public void insert_into_membership(String id_member, String name, String phone_num, String creation_date, String table_num, String reserve_time) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("membership_crud");
        PreparedStatement ps = null;

        try {
            String query = "INSERT INTO membership(id_member, name, phone_num, creation_date, table_num, reserve_time) VALUES(?, ?, ?, ?, ?, ?)";
            ps = connection.prepareStatement(query);
            ps.setString(1, id_member);
            ps.setString(2, name);
            ps.setString(3, phone_num);
            ps.setString(4, creation_date);
            ps.setString(5, table_num);
            ps.setString(6, reserve_time);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error inserting into membership table: " + e);
        } finally {
            try {
                if (ps != null) ps.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                System.err.println("Error closing resources: " + e);
            }
        }
    }
}
