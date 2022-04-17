<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
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

 session = request.getSession();
/*if(session==null){response.sendRedirect("LoginUser.jsp");}else{
			String quantity = request.getParameter("quantity");
			//String sno = (String) session.getAttribute("sno");
			//String name = (String) session.getAttribute("name");
			//String price = (String) session.getAttribute("price");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			CartItems.addItems(name,price,quantity);
			CartItems.print();
				//cart.add(name+","+price+","+quantity);
				//System.out.println(cart); }
*/
	Connection conn = (Connection) session.getAttribute("connection");
	String id = request.getParameter("id");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("Select * from product");
	PreparedStatement pstmt = conn.prepareStatement("Insert into cart values(?,?,?,?,?,?)");//(order_id,user_id,product_id,product_name,quantity,price)
	while(rs.next())
	{
		if(rs.getString("product_id").equals(id))
		{
			pstmt.setString(1,(String) session.getAttribute("order_id"));
			pstmt.setString(2, (String)session.getAttribute("user_id"));
			pstmt.setString(3,id);
			pstmt.setString(4, rs.getString("product_name"));
			pstmt.setInt(5, 1);
			pstmt.setInt(6,Integer.parseInt(rs.getString("price")));
			pstmt.executeUpdate();
		}
	}
	response.sendRedirect("Userhomepage.jsp");

%>
</body>
</html>