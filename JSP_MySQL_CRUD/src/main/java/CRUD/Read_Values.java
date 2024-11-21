package CRUD;

import common.DB_Connection;
import common.Book_Bean;
import common.Membership_Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Read_Values {

    public static void main(String[] args) {
        Read_Values obj_Read_Values = new Read_Values();
        obj_Read_Values.get_books();
        obj_Read_Values.get_memberships();
    }

    // Method to get values for books
    public List<Book_Bean> get_books() {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("book"); 
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Book_Bean> bookList = new ArrayList<>();

        try {
            String query = "SELECT * FROM books";
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Book_Bean obj_Book_Bean = new Book_Bean();
                System.out.println("Book ID: " + rs.getString("id"));
                System.out.println("Title: " + rs.getString("title"));
                System.out.println("Genre: " + rs.getString("genre"));
                System.out.println("Publisher: " + rs.getString("publisher"));
                System.out.println("Author: " + rs.getString("author"));
                System.out.println("Year: " + rs.getString("year"));
                System.out.println("Pages: " + rs.getString("pages"));

                obj_Book_Bean.setId(rs.getString("id"));
                obj_Book_Bean.setTitle(rs.getString("title"));
                obj_Book_Bean.setGenre(rs.getString("genre"));
                obj_Book_Bean.setPublisher(rs.getString("publisher"));
                obj_Book_Bean.setAuthor(rs.getString("author"));
                obj_Book_Bean.setYear(rs.getString("year"));
                obj_Book_Bean.setPages(rs.getString("pages"));

                bookList.add(obj_Book_Bean);
            }
        } catch (Exception e) {
            System.out.println("Error while fetching books: " + e);
        }
        return bookList;
    }

    // Method to get values for membership
    public List<Membership_Bean> get_memberships() {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("membership_crud");
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Membership_Bean> membershipList = new ArrayList<>();

        try {
            String query = "SELECT * FROM membership";
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Membership_Bean obj_Membership_Bean = new Membership_Bean();
                System.out.println("Membership ID: " + rs.getString("id_member"));
                System.out.println("Name: " + rs.getString("name"));
                System.out.println("Phone Number: " + rs.getString("phone_num"));
                System.out.println("Creation Date: " + rs.getString("creation_date"));
                System.out.println("Table Number: " + rs.getString("table_num"));
                System.out.println("Reserve Time: " + rs.getString("reserve_time"));

                obj_Membership_Bean.setId_member(rs.getString("id_member"));
                obj_Membership_Bean.setName(rs.getString("name"));
                obj_Membership_Bean.setPhone_num(rs.getString("phone_num"));
                obj_Membership_Bean.setCreation_date(rs.getString("creation_date"));
                obj_Membership_Bean.setTable_num(rs.getString("table_num"));
                obj_Membership_Bean.setReserve_time(rs.getString("reserve_time"));

                membershipList.add(obj_Membership_Bean);
            }
        } catch (Exception e) {
            System.out.println("Error while fetching memberships: " + e);
        }
        return membershipList;
    }
}
