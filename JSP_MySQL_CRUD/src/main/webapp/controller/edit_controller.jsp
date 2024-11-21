<%@page import="CRUD.Edit_values"%>
<%@page import="common.Book_Bean"%>
<%@page import="common.Membership_Bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Processing Edit</title>
</head>
<body>
<%
    String type = request.getParameter("type"); // "book" or "membership"
    Edit_values obj_Edit_values = new Edit_values();

    if ("book".equalsIgnoreCase(type)) {
        // Parameters for books
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String publisher = request.getParameter("publisher");
        String author = request.getParameter("author");
        String year = request.getParameter("year");
        String pages = request.getParameter("pages");

        // Create and populate Book_Bean
        Book_Bean obj_Book_Bean = new Book_Bean();
        obj_Book_Bean.setId(id);
        obj_Book_Bean.setTitle(title);
        obj_Book_Bean.setGenre(genre);
        obj_Book_Bean.setPublisher(publisher);
        obj_Book_Bean.setAuthor(author);
        obj_Book_Bean.setYear(year);
        obj_Book_Bean.setPages(pages);

        // Update the book in the database
        obj_Edit_values.edit_books(obj_Book_Bean);
    } else if ("membership".equalsIgnoreCase(type)) {
        // Parameters for memberships
        String id_member = request.getParameter("id_member");
        String name = request.getParameter("name");
        String phone_num = request.getParameter("phone_num");
        String creation_date = request.getParameter("creation_date");
        String table_num = request.getParameter("table_num");
        String reserve_time = request.getParameter("reserve_time");

        // Create and populate Membership_Bean
        Membership_Bean obj_Membership_Bean = new Membership_Bean();
        obj_Membership_Bean.setId_member(id_member);
        obj_Membership_Bean.setName(name);
        obj_Membership_Bean.setPhone_num(phone_num);
        obj_Membership_Bean.setCreation_date(creation_date);
        obj_Membership_Bean.setTable_num(table_num);
        obj_Membership_Bean.setReserve_time(reserve_time);

        // Update the membership in the database
        obj_Edit_values.edit_user(obj_Membership_Bean);
    } else {
        out.println("<h1>Error: Invalid type parameter</h1>");
    }
%>
<script type="text/javascript">
    // Redirect to the appropriate page after processing
    window.location.href = "http://localhost:8081/JSP_MySQL_CRUD/index.jsp";
</script>
</body>
</html>
