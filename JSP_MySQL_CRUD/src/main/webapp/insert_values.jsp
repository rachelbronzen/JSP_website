<%@page import="java.util.Iterator"%>
<%@page import="common.Book_Bean"%>
<%@page import="common.Membership_Bean"%>
<%@page import="java.util.List"%>
<%@page import="CRUD.Read_Values"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert Values</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>

<body>
<%
    String type = request.getParameter("type"); // 'books' or 'membership'
%>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #ffb6c1">
            <div class="navbar-brand" style="text-decoration:black;">
            TomeTown Library Web
            </div>
        </nav>
    </header>

    <div style="display: flex; justify-content: center; align-items: center; height: 75vh; background-color: white; margin:70px; color: #ededed;">
        <div class="card" style="background-color: #ffb6c1; width: 60%; max-width: 600px;">
            <div class="card-body" style="background-color: #2b2a2f; border-radius: 5px;">
                <form action="controller/insert_controller.jsp" method="post">
                
                <% if ("books".equalsIgnoreCase(type)) { %>
                    <input type="hidden" name="type" value="books">
                    <caption>
                        <h2>Add Book Data</h2>
                    </caption>
                    
                    <fieldset class="form-group">
                        <label>ID</label> 
                        <input type="text" class="form-control" name="id" required="required" placeholder="Insert Here">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Title</label> 
                        <input type="text" class="form-control" name="title" required="required" placeholder="Insert Here">
                    </fieldset>

					<fieldset class="form-group">
					    <label>Genre</label>
					    <select class="form-control" name="genre" required="required">
					        <option value="" disabled selected>Choose Here</option>
					        <option value="fiction">Fiction</option>
					        <option value="non-fiction">Non-fiction</option>
					        <option value="mystery">Mystery</option>
					        <option value="science">Science</option>
					        <option value="fantasy">Fantasy</option>
					        <option value="biography">Biography</option>
					    </select>
					</fieldset>


                    <fieldset class="form-group">
                        <label>Publisher</label> 
                        <input type="text" class="form-control" name="publisher" required="required" placeholder="Insert Here">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Author</label> 
                        <input type="text" class="form-control" name="author" required="required" placeholder="Insert Here">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Year</label> 
                        <input type="text" class="form-control" name="year" required="required" placeholder="Insert Here">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Pages</label> 
                        <input type="text" class="form-control" name="pages" required="required" placeholder="Insert Here">
                    </fieldset>
                    
                    <button type="submit" class="btn" style="background-color: #dedce1; color: white; font-weight: bold;">Save</button>

                <% } else if ("membership".equalsIgnoreCase(type)) { %>

                    <input type="hidden" name="type" value="membership">
                    <caption>
                        <h2>Add Membership Data</h2>
                    </caption>

                    <fieldset class="form-group">
                        <label>Membership ID</label> 
                        <input type="text" class="form-control" name="id_member" required="required" placeholder="Insert Here">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Name:</label> 
                        <input type="text" class="form-control" name="name" required="required" placeholder="Insert Here">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Phone Number</label> 
                        <input type="text" class="form-control" name="phone_num" required="required" minlength="10" placeholder="Insert Here">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Membership Creation Date</label> 
                        <input type="date" class="form-control" name="creation_date" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Table Number</label> 
                        <input type="text" class="form-control" name="table_num" required="required" minlength="2" placeholder="Insert Here (max 99)">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Table Reserve Time (HH:MM:SS)</label>
                        <input type="text" class="form-control" name="reserve_time" placeholder="HH:MM:SS" pattern="\d{2}:\d{2}:\d{2}" required>
                    </fieldset>

                    <button type="submit" class="btn" style="background-color: #dedce1; color: white; font-weight: bold;">Save</button>

                <% } else { %>
                    <h3>Invalid type specified. Use ?type=books or ?type=membership in the URL.</h3>
                <% } %>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
