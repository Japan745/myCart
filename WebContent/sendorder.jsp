<%@ page language="java" import="java.util.*,java.lang.*" contentType="text/html; charset=ISO-8859-1"
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
	Statement st1 = conn.createStatement();
	ResultSet rs = st1.executeQuery("select * from orders where order_id ='"+request.getParameter("id")+"'");
	StringBuffer output = new StringBuffer();
	String message ="value";
	output.append("<table><tr>");
	output.append("<th><h2>Order Date :</h2> </th>");
	output.append("<th>"+request.getParameter("date")+"</th>");
	output.append("<th><h2>Order id : </h2></th>");
	output.append("<th>"+request.getParameter("id")+"</th>");
	output.append("</tr>");
	output.append("<tr>"+"<th>Product </th>"+"<th>Quantity</th>"+"<th>Price</th>"+"<th>Status</th>"+"</tr>");
	while(rs.next()){
	output.append("<tr><td>"+rs.getString("product_name")+"</td>");
	output.append("<td>"+rs.getString("quantity")+"</td>");
	output.append("<td>"+rs.getString("price")+"</td>");
	output.append("<td>"+"Pending"+"</td></tr>");
	}
	output.append("<tr>"+
	"<td><b>Total</b></td>"+
	"<td></td>"+
	"<td><b>");
	ResultSet rs1 = st1.executeQuery("select * from orders where order_id ='"+request.getParameter("id")+"'");
	List<Integer> price1 = new ArrayList<Integer>();
	while(rs1.next()){price1.add(rs1.getInt("price"));}
	Iterator<Integer> pprice1 = price1.iterator();
	int amount=0;
	while(pprice1.hasNext()){amount=amount+pprice1.next();}
	output.append(amount+"</b></td>"+
	"</tr>"+
	"</table>");
	//message = output.toString();
	String email = (String) session.getAttribute("user_id");
	String subject = "Order details";
	response.sendRedirect("sendmail.jsp?umail="+email+"&umessage="+message+"&usubject="+subject);%>
</body>
</html>