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
<% Connection conn = (Connection) session.getAttribute("connection");
	PreparedStatement pstmt = conn.prepareStatement("delete from cart where order_id = ? and product_id = ?");
	pstmt.setString(1, (String)session.getAttribute("order_id"));
	pstmt.setString(2, request.getParameter("id"));
	System.out.println((String)session.getAttribute("order_id"));
	System.out.println(request.getParameter("id"));
	if(pstmt.executeUpdate()==1){response.sendRedirect("myCart.jsp");};
	%>
</body>
</html>