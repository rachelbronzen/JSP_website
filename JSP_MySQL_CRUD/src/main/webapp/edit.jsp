<%@page import="CRUD.Edit_values"%>
<%@page import="common.Book_Bean"%>
<%@page import="common.Membership_Bean"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Edit Values</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }
        .card {
            background-color: #ffb6c1;
            width: 60%;
            max-width: 600px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card-body {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #dedce1;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #c1bfc7;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <%
                String type = request.getParameter("type"); // "book" or "membership"
                Edit_values obj_Edit_values = new Edit_values();
                
                if ("book".equalsIgnoreCase(type)) {
                    String id = request.getParameter("id");
                    Book_Bean obj_Book_Bean = obj_Edit_values.get_value_of_books(id);
                %>
                <form action="controller/edit_controller.jsp">
                    <input type="hidden" name="type" value="book">
                    <h1>Edit Book Details</h1>
                    <div class="form-group">
                        <label>ID</label>
                        <input type="text" class="form-control" name="id" value="<%= id %>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Title</label>
                        <input type="text" class="form-control" name="title" value="<%= obj_Book_Bean.getTitle() %>">
                    </div>
                    <div class="form-group">
                        <label>Genre</label>
                        <select class="form-control" name="genre">
                            <option value="" disabled selected>Choose Here</option>
                            <option value="fiction" <%= "fiction".equals(obj_Book_Bean.getGenre()) ? "selected" : "" %>>Fiction</option>
                            <option value="non-fiction" <%= "non-fiction".equals(obj_Book_Bean.getGenre()) ? "selected" : "" %>>Non-fiction</option>
                            <option value="mystery" <%= "mystery".equals(obj_Book_Bean.getGenre()) ? "selected" : "" %>>Mystery</option>
                            <option value="science" <%= "science".equals(obj_Book_Bean.getGenre()) ? "selected" : "" %>>Science</option>
                            <option value="fantasy" <%= "fantasy".equals(obj_Book_Bean.getGenre()) ? "selected" : "" %>>Fantasy</option>
                            <option value="biography" <%= "biography".equals(obj_Book_Bean.getGenre()) ? "selected" : "" %>>Biography</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Publisher</label>
                        <input type="text" class="form-control" name="publisher" value="<%= obj_Book_Bean.getPublisher() %>">
                    </div>
                    <div class="form-group">
                        <label>Author</label>
                        <input type="text" class="form-control" name="author" value="<%= obj_Book_Bean.getAuthor() %>">
                    </div>
                    <div class="form-group">
                        <label>Year</label>
                        <input type="text" class="form-control" name="year" value="<%= obj_Book_Bean.getYear() %>">
                    </div>
                    <div class="form-group">
                        <label>Pages</label>
                        <input type="text" class="form-control" name="pages" value="<%= obj_Book_Bean.getPages() %>">
                    </div>
                    <button type="submit" class="btn">Save</button>
                </form>
                <%
                } else if ("membership".equalsIgnoreCase(type)) {
                    String id_member = request.getParameter("id_member");
                    Membership_Bean obj_Membership_Bean = obj_Edit_values.get_value_of_user(id_member);
                %>
                <form action="controller/edit_controller.jsp">
                    <input type="hidden" name="type" value="membership">
                    <h1>Edit Membership Details</h1>
                    <div class="form-group">
                        <label>Membership ID</label>
                        <input type="text" class="form-control" name="id_member" value="<%= id_member %>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="name" value="<%= obj_Membership_Bean.getName() %>">
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text" class="form-control" name="phone_num" value="<%= obj_Membership_Bean.getPhone_num() %>">
                    </div>
                    <div class="form-group">
                        <label>Membership Creation Date</label>
                        <input type="date" class="form-control" name="creation_date" value="<%= obj_Membership_Bean.getCreation_date() %>">
                    </div>
                    <div class="form-group">
                        <label>Table Number</label>
                        <input type="text" class="form-control" name="table_num" value="<%= obj_Membership_Bean.getTable_num() %>">
                    </div>
                    <div class="form-group">
                        <label>Table Reserve Time (HH:MM:SS)</label>
                        <input type="text" class="form-control" name="reserve_time" value="<%= obj_Membership_Bean.getReserve_time() %>">
                    </div>
                    <button type="submit" class="btn">Save</button>
                </form>
                <%
                } else {
                %>
                <center>
                    <h1>Error</h1>
                    <p>Invalid type parameter. Please specify either "book" or "membership".</p>
                </center>
                <%
                }
                %>
            </div>
        </div>
    </div>
</body>
</html>
