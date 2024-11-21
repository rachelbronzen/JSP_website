package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import common.DB_Connection;

public class Delete_values {

    // Method to delete a book by ID
    public void deleteBook(String id) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("book");
        PreparedStatement ps = null;

        try {
            String query = "DELETE FROM books WHERE id=?";
            ps = connection.prepareStatement(query);
            ps.setString(1, id); // Set the book ID
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error deleting book: " + e.getMessage());
        } finally {
            closeResources(ps, connection);
        }
    }

    // Method to delete a membership by id_member
    public void deleteMembership(String id_member) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("membership_crud");
        PreparedStatement ps = null;

        try {
            String query = "DELETE FROM membership WHERE id_member=?";
            ps = connection.prepareStatement(query);
            ps.setString(1, id_member); // Set the book ID
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error deleting book: " + e.getMessage());
        } finally {
            closeResources(ps, connection);
        }
    }

    // Helper method to close resources
    private void closeResources(PreparedStatement ps, Connection connection) {
        try {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        } catch (Exception e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }
}
