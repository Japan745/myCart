<%@ page language="java" import="java.util.*,java.lang.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />    
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="ContactUs.html">Contact</a>
      </li>
      <li>
        <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Account
        </a>
        
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Signout.jsp">Log Out</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>


<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

<table id = "customers">
<thead>
        </thead>
        <thead>
          <tr>
            <th scope="col">Product Name</th>
            <th scope="col"> price</th>
            <th scope="col">Quantity</th>
           <!--  <th scope="col">Sub Total</th>-->
            <th scope="col">Remove </th>
          </tr>
        </thead>
        <tbody>
      	<%Connection conn = (Connection) session.getAttribute("connection");
      	//int amount=0;
      	PreparedStatement pstmt = conn.prepareStatement("select * from cart where order_id = ?");
      	pstmt.setString(1, (String)session.getAttribute("order_id"));
      	ResultSet rs = pstmt.executeQuery();
      	List<String> pname = new ArrayList<String>();
      	List<Integer> price = new ArrayList<Integer>();
      	List<Integer> quantity = new ArrayList<Integer>();
      	List<String> p_id = new ArrayList<String>();
      	while(rs.next()){pname.add(rs.getString("product_name"));price.add(rs.getInt("price"));quantity.add(rs.getInt("quantity"));p_id.add(rs.getString("product_id"));}
      	Iterator<String> name = pname.iterator();Iterator<Integer> pprice = price.iterator();Iterator<Integer>quan = quantity.iterator();Iterator<String>id = p_id.iterator();
      	while(name.hasNext() && pprice.hasNext() && quan.hasNext()&& id.hasNext()){%>
          <tr>
			<%String l_id = id.next(); %>
            <td><%out.println(name.next());%></td>
            <td><i class="fa fa-usd"></i><%out.println(pprice.next());%></td>
            <td><a href="increment.jsp?id=<%=l_id%>"><i class='fa fa-plus-circle'></i></a><%out.println(quan.next());%><a href="decrement.jsp?id=<%=l_id%>"><i class='fa fa-minus-circle'></i></a></td>
            <!-- <td><i class="fa fa-usd"></i> </td>-->
            <td><a href="removefromcart.jsp?id=<%=l_id%>"><i class='fa fa-trash'></i></a></td>
          </tr>
	<%} %>
		<tr>
			<td>Total</td>
			<td><i class="fa fa-usd"></i><% PreparedStatement pstmt1 = conn.prepareStatement("select * from cart where order_id = ?");
      		pstmt1.setString(1, (String)session.getAttribute("order_id"));
      		ResultSet rs1 = pstmt1.executeQuery();
      		List<Integer> price1 = new ArrayList<Integer>();
      		while(rs1.next()){price1.add(rs1.getInt("price"));}
      		Iterator<Integer> pprice1 = price1.iterator();
      		int amount=0;
      		while(pprice1.hasNext()){amount=amount+pprice1.next();}out.println(amount);%></td>
      		<th scope="col"><a href="checkout.jsp?id=<%=(String)session.getAttribute("order_id")%>">Proceed to order</a></th>
		</tr>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>