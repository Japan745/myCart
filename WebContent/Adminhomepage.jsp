<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*,java.lang.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
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
<meta charset="ISO-8859-1">
<title>User home page</title>
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
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Adminhomepage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addproduct.jsp">Add Product</a>
      </li>
      <li>
        <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Orders
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="orderlist.jsp">Incomplete orders</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="completeorderlist.jsp">Complete orders</a>
        </div>
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


<%
List<String> username;  
List<String> useremail;
List<String> userphone;
List<String> userdob;
List<String> usercountry;
List<String> usergender;
 session = request.getSession(false);
if (session == null) {
    // a session exists
	 request.getRequestDispatcher("LoginUser.jsp").forward(request,response);
     
}
	Connection conn = (Connection)session.getAttribute("connection");
	 username = (List<String>) session.getAttribute("username");
	 userphone = (List<String>)session.getAttribute("userphone");
	 useremail = (List<String>)session.getAttribute("useremail");
	 userdob = (List<String>)session.getAttribute("userdob");
	 usercountry = (List<String>)session.getAttribute("usercountry");
	 usergender = (List<String>)session.getAttribute("usergender");
	 System.out.print(session.getId());%>

	<table id="customers" border="0" width="100%">
		<tr>
			<th><h3>Name</h3></th><t>
	
			<th><h3>Email</h3></th>
	
			<th><h3>Phone</h3></th>
	
			<th><h3>Country</h3></th>
	
			<th><h3>Gender</h3></th>
			
			<th><h3>Delete User</h3></th>
		</tr>
		<%Iterator<String> name = username.iterator();
		Iterator<String> email = useremail.iterator();
		Iterator<String> phone = userphone.iterator();
		Iterator<String> country = usercountry.iterator();
		Iterator<String> gender = usergender.iterator();%>
		<% while(name.hasNext()&&email.hasNext()&&phone.hasNext()&&country.hasNext()&&gender.hasNext()){ %>
		<form action="./deleteuser" method="post">
		<tr>
			<td><% String n = name.next();out.println(n);%></td>
			<td><%String e = email.next();out.println(e);System.out.println(e);%></td>
			<td><%String p = phone.next();out.println(p);%></td>
			<td><%String c = country.next();out.println(c);%></td>
			<td><%String g = gender.next();out.println(g);%></td>
			
			<td><button name="Remove" value=<%session.setAttribute("email", e); %> >Remove</button></td>
		</tr>
		</form>
		<%} %>
		<!-- <tr>
			<td>Orders</td>
			<td><a href="orderlist.jsp"><button name="order list">Incomplete Order List</button></a></td>
			<td><a href="completeorderlist.jsp"><button name="order list">Complete Order List</button></a></td>
		</tr>
		<tr>
			<td>Add product</td>
			<td><a href="addproduct.jsp"><button name="order list">Click</button></a></td>
		</tr>-->
	</table>
</body>
</html>