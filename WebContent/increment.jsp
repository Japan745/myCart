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
	
		
		//PreparedStatement pstmt = conn.prepareStatement("select * from cart where order_id ="+session.getAttribute("order_id"));
		//pstmt.setString(1, (String)session.getAttribute("order_id"));
		Statement st1 = conn.createStatement();
		ResultSet rs = st1.executeQuery("select * from cart where order_id ='"+(String)session.getAttribute("order_id")+"'");
		while(rs.next())
		{
		Statement st = conn.createStatement();
		ResultSet res = st.executeQuery("select * from product");
	
		PreparedStatement pstmt1 = conn.prepareStatement("update cart set quantity = ?,price=? where order_id = ? and product_id = ?");
		System.out.println(request.getParameter("id"));
		System.out.println(session.getAttribute("order_id"));
		System.out.println("---------------New----------------");
		
			while(res.next())
			{
				System.out.println("1: "+rs.getString("product_id"));
				System.out.println("1: "+res.getString("product_id"));
				System.out.println(request.getParameter("id"));
				if(rs.getString("product_id").equals(request.getParameter("id")))
				{
					
					if(rs.getString("product_id").equals(res.getString("product_id")))
					{
						int q = ((rs.getInt("quantity"))+1);
						pstmt1.setInt(1,q);
						int p = q*(Integer.parseInt(res.getString("price")));
						pstmt1.setInt(2,p);
						pstmt1.setString(3, (String)session.getAttribute("order_id"));
						pstmt1.setString(4,request.getParameter("id"));
						pstmt1.executeUpdate();
					}
				}
		}
	}
	//rs.close();
	//res.close();
	response.sendRedirect("myCart.jsp");
	%>
</body>
</html>