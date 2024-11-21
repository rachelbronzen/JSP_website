<%@page import="java.util.List"%>
<%@page import="common.Book_Bean"%>
<%@page import="common.Membership_Bean"%>
<%@page import="CRUD.Read_Values"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>TomeTown Library</title>
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark" style="background-color: #ffb6c1">
			<div class="navbar-brand" style="text-decoration:black;">
			TomeTown Library Web
			</div>
		</nav>
	</header>

    <%
        Read_Values obj_Read_Values = new Read_Values();
        List<Book_Bean> books = obj_Read_Values.get_books();
    %>
    
    	<div class="row">

		<div class="container">
			<h3 class="text-center">List of Books</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
	            <th>ID</th>
	            <th>Title</th>
	            <th>Genre</th>
	            <th>Publisher</th>
	            <th>Author</th>
	            <th>Year</th>
	            <th>Pages</th>
					</tr>
				</thead>
		        <%
		            for (Book_Bean book : books) {
		        %>
        <tr>
            <td><%= book.getId() %></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getGenre() %></td>
            <td><%= book.getPublisher() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getYear() %></td>
            <td><%= book.getPages() %></td>
            <td>
			<style>
					    .edit-button {
					        color: black; 
					        text-decoration:
					        border: 1px solid;
					        border-radius: 5px;
					        padding:10px 20px;
					        background-color: pink;
					        display: inline-block;
					        transition: background-color 0.3s, color 0.3s;
					    }
						.edit-button:active {
					        background-color: black;
					    }
			</style>

 
                <a href="edit.jsp?type=book&id=<%= book.getId() %>" class="edit-button">Edit</a>
                </td>
                <td>
			<style>
					    .delete-button {
					        color: black; 
					        text-decoration:
					        border: 1px solid;
					        border-radius: 5px;
					        padding:10px 20px;
					        background-color: #ededed;
					        display: inline-block;
					        transition: background-color 0.3s, color 0.3s;
					    }
					    
					    .delete-button:active {
					        background-color: black;
					    }
			</style>
                
                <a href="controller/delete_controller.jsp?type=book&id=<%= book.getId() %>" class="delete-button"
                   onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
            </td>
        </tr>
				<%
				}
				%>

			</table>
			    <a href="insert_values.jsp?type=books">Add New Book</a>
		</div>
	</div>

    <%
        List<Membership_Bean> memberships = obj_Read_Values.get_memberships();
    %>
    <div class="row">

		<div class="container">
			<h3 class="text-center">List of Memberships</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
            <th>ID Membership</th>
            <th>Name</th>
            <th>Phone Number</th>
            <th>Creation Date</th>
            <th>Table Number</th>
            <th>Reserve Time</th>
					</tr>
				</thead>
		        <%
		        	for (Membership_Bean membership : memberships) {
		        %>
        <tr>
            <td><%= membership.getId_member() %></td>
            <td><%= membership.getName() %></td>
            <td><%= membership.getPhone_num() %></td>
            <td><%= membership.getCreation_date() %></td>
            <td><%= membership.getTable_num() %></td>
            <td><%= membership.getReserve_time() %></td>
            <td>
                <a href="edit.jsp?type=membership&id_member=<%= membership.getId_member() %>" class="edit-button">Edit</a>
            </td>
             <td>
                <a href="controller/delete_controller.jsp?type=membership&id_member=<%= membership.getId_member() %>" class="delete-button"
                   onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
            </td>
        </tr>
				<%
				}
				%>

			</table>
			    <a href="insert_values.jsp?type=membership">Add New Membership</a>
		</div>
	</div>

</body>
</html>
