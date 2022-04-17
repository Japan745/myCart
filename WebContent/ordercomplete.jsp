<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = (Connection) session.getAttribute("connection");
	PreparedStatement pstmt = conn.prepareStatement("update orders set order_status = 1 where order_id = '"+request.getParameter("id")+"'");
	if(pstmt.executeUpdate()==1){response.sendRedirect("orderlist.jsp");}else{response.sendRedirect("orderlist.jsp");}
	%>

</body>
</html>