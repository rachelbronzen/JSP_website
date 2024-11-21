<%@page import="CRUD.Insert_Values"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert Controller</title>
</head>
<body>
<%
    String type = request.getParameter("type");
    Insert_Values obj_Insert_Values = new Insert_Values();

    if ("books".equalsIgnoreCase(type)) {
        // Handle book insertion
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String publisher = request.getParameter("publisher");
        String author = request.getParameter("author");
        String year = request.getParameter("year");
        String pages = request.getParameter("pages");

        obj_Insert_Values.insert_into_books(id, title, genre, publisher, author, year, pages);

        // Redirect to books list
        response.sendRedirect("http://localhost:8081/JSP_MySQL_CRUD/index.jsp");

    } else if ("membership".equalsIgnoreCase(type)) {
        // Handle membership insertion
        String id_member = request.getParameter("id_member");
        String name = request.getParameter("name");
        String phone_num = request.getParameter("phone_num");
        String creation_date = request.getParameter("creation_date");
        String table_num = request.getParameter("table_num");
        String reserve_time = request.getParameter("reserve_time");

        obj_Insert_Values.insert_into_membership(id_member, name, phone_num, creation_date, table_num, reserve_time);

        // Redirect to membership list
        response.sendRedirect("http://localhost:8081/JSP_MySQL_CRUD/index.jsp");

    } else {
        // Invalid type error
        out.println("<h2>Error: Invalid type parameter. Use 'type=books' or 'type=membership'.</h2>");
    }
%>
</body>
</html>
