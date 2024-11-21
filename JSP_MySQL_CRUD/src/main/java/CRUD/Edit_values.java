package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DB_Connection;
import common.Book_Bean;
import common.Membership_Bean;

public class Edit_values {

    // Methods for handling Books
    public Book_Bean get_value_of_books(String id) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("book"); 
        PreparedStatement ps = null;
        ResultSet rs = null;
        Book_Bean obj_Book_Bean = new Book_Bean();
        
        try {
            String query = "select * from books where id=?";
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                obj_Book_Bean.setId(rs.getString("id"));
                obj_Book_Bean.setTitle(rs.getString("title"));
                obj_Book_Bean.setGenre(rs.getString("genre"));
                obj_Book_Bean.setPublisher(rs.getString("publisher"));
                obj_Book_Bean.setAuthor(rs.getString("author"));
                obj_Book_Bean.setYear(rs.getString("year"));
                obj_Book_Bean.setPages(rs.getString("pages"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return obj_Book_Bean;
    }

    public void edit_books(Book_Bean obj_Book_Bean) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("book"); 
        PreparedStatement ps = null;
        
        try {
            String query = "update books set title=?,genre=?,publisher=?,author=?,year=?,pages=? where id=?";
            ps = connection.prepareStatement(query);
            ps.setString(1, obj_Book_Bean.getTitle());
            ps.setString(2, obj_Book_Bean.getGenre());
            ps.setString(3, obj_Book_Bean.getPublisher());
            ps.setString(4, obj_Book_Bean.getAuthor());
            ps.setString(5, obj_Book_Bean.getYear());
            ps.setString(6, obj_Book_Bean.getPages());
            ps.setString(7, obj_Book_Bean.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Methods for handling Membership
    public Membership_Bean get_value_of_user(String id_member) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("membership_crud"); 
        PreparedStatement ps = null;
        ResultSet rs = null;
        Membership_Bean obj_Membership_Bean = new Membership_Bean();

        try {
            String query = "select * from membership where id_member=?";
            ps = connection.prepareStatement(query);
            ps.setString(1, id_member);
            rs = ps.executeQuery();

            while (rs.next()) {
            	obj_Membership_Bean.setId_member(rs.getString("id_member"));
                obj_Membership_Bean.setName(rs.getString("name"));
                obj_Membership_Bean.setPhone_num(rs.getString("phone_num"));
                obj_Membership_Bean.setCreation_date(rs.getString("creation_date"));
                obj_Membership_Bean.setTable_num(rs.getString("table_num"));
                obj_Membership_Bean.setReserve_time(rs.getString("reserve_time"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return obj_Membership_Bean;
    }

    public void edit_user(Membership_Bean obj_Membership_Bean) {
        DB_Connection obj_DB_Connection = new DB_Connection();
        Connection connection = obj_DB_Connection.get_connection("membership_crud"); 
        PreparedStatement ps = null;

        try {
            String query = "update membership set name=?,phone_num=?,creation_date=?,table_num=?,reserve_time=? where id_member=?";
            ps = connection.prepareStatement(query);
            ps.setString(1, obj_Membership_Bean.getName());
            ps.setString(2, obj_Membership_Bean.getPhone_num());
            ps.setString(3, obj_Membership_Bean.getCreation_date());
            ps.setString(4, obj_Membership_Bean.getTable_num());
            ps.setString(5, obj_Membership_Bean.getReserve_time());
            ps.setString(6, obj_Membership_Bean.getId_member());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
