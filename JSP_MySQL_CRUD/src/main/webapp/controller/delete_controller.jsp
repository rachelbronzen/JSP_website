<%@page import="CRUD.Delete_values"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Controller</title>
</head>
<body>
<%
    String type = request.getParameter("type"); // Determine if it's a book or membership
    String identifier = "membership".equalsIgnoreCase(type) 
    	    ? request.getParameter("id_member") 
    	    : request.getParameter("id");


    Delete_values obj_DeleteValues = new Delete_values();

    if ("book".equalsIgnoreCase(type)) {
        obj_DeleteValues.deleteBook(identifier); // Call the method to delete a book
    } else if ("membership".equalsIgnoreCase(type)) {
        obj_DeleteValues.deleteMembership(identifier); // Call the method to delete a membership
    } else {
        out.println("<script>alert('Invalid type specified!');</script>");
    }
%>
<script type="text/javascript">
    // Redirect to a common page after deletion
    window.location.href = "http://localhost:8081/JSP_MySQL_CRUD/index.jsp";
</script>
</body>
</html>
