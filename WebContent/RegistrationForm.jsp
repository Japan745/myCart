<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java"%>

<!DOCTYPE html>

<html>

    <head>

        <title>Sign Up Form</title>
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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width">

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
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Account
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Adminhomepage.jsp">Sign In</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="RegistrationForm.jsp">Sign Up</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Log Out</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
    
  <!-- <center> <h2 style="font-family: cursive"> "Lets bring your products at your doorstep" </h2> </center>-->
    
   <!--  <center><img src="D:\College\Semester II\JAVA 2\Eclipse_EE_Workspace\JavaProject\WebContent\store.jpg"  style="width:1000px; height:600px;"></center>-->
    <center><h1 style="font-family: sans-serif"> "SIGN UP" </h1></center>
   <center> <h3 style="font-family: cursive"> "Let's create your account" </h3></center>

        <form action="./registrationform" method="post">

              
             <center>

                <table border="0" style="color:black; font-size:25px">

                    <tr>

                        <td>

                            <b>Full Name:</b>

                        </td>

                        <td>

                            <input type="text" name="username" placeholder="your full name" required>
							
                        </td>

                    </tr>

                    <tr>

                        <td>

                            <b>Email-ID:</b>

                        </td>

                        <td>

                            <input type="email" name="useremail" placeholder="user@example.com"  required>
                            <div style="color: #FF0000">${email}</div>
                        </td>

                    </tr>

                    <tr>

                        <td>

                            <b>Create Password:</b>

                        </td>

                        <td>

                            <input type="password" name="userpass" placeholder="password" required>

                        </td>

                    </tr>

                    <tr>

                        <td>

                            <b>Confirm Password:</b>

                        </td>

                        <td>

                            <input type="password" name="userpassconf" placeholder="password must be same" required>
                            <div style="color: #FF0000">${pass}</div>

                        </td>

                    </tr>

                    <tr>

                        <td>

                            <b>D.O.B</b>

                        </td>

                        <td>

                            <input type="date" name="userdob" placeholder="DD/MM/YYYY" required>

                        </td>

                    </tr>

                    <tr>

                        <td>

                            <b>Gender:</b>                       

                        </td>

                        <td>
							<input type="radio" name="usergender" value="Male" default>Male
 							<input type="radio" name="usergender" value="Female">Female

                        </td>
                   </tr>

                    <tr>

                        <td>

                            <b>Phone No:</b>

                        </td>

                        <td>

                            <input type="number" name="userphone" placeholder="your phone number" required>
                            <div style="color: #FF0000">${Phone}</div>

                        </td>

                    </tr>

                    <tr>

                        <td>

                            <b>Country:</b>

                        </td>

                        <td>

                            <input type="text" name="usercountry" placeholder="your country" required>

                        </td>

                    </tr>   

                   <tr>

                        <td>

                            <input type="Submit" name="submit" value="SignUp"></button>

                        </td>

                        <td>

                            <input type="reset" value="Reset">

                        </td>

                    </tr>
					 </center>
                </table>
                <br>
				<!-- <input type="submit" >
				<input type="reset" value="Reset">-->
        </form>
        
        Already have an account | <a href="LoginUser.jsp">Login</a>

    </body>

</html>