<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

    String name = request.getParameter("username");

    String email = request.getParameter("useremail");

    String pass = request.getParameter("userpass");

    String dob = request.getParameter("userdob");

    String gender = request.getParameter("usergender");

    String phone = request.getParameter("userphone");

    String country = request.getParameter("usercountry");
    java.sql.Connection conn = DbConnection.dbConnection();
    UsersTable.insertValues(name,email,pass,dob,gender,phone,country,conn);
    
 %>
 <table>
 	<tr>
 		<td>
 		Name is : <%=name %>
 		</td>
 	</tr>
 	<tr>
 		<td>
 		Email is : <%=email %>
 		</td>
 	</tr>
 	<tr>
 		<td>
 		Date of Birth is : <%=dob %>
 		</td>
 	</tr>
 	<tr>
 		<td>
 		Gender is : <%=gender %>
 		</td>
 	</tr>
 	<tr>
 		<td>
 		phone number  is : <%=phone %>
 		</td>
 	</tr>
 	<tr>
 		<td>
 		country is : <%=country %>
 		</td>
 	</tr>
 </table>
</body>
</html>