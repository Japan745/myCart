import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.lang.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 */

/**
 * @author Japan Patel
 *
 */
@WebServlet("/loginform")
public class UserLogin  extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static boolean admin = false;
	public static HttpSession session;
	public static boolean userlogin(String email, String password, Connection conn) throws SQLException  {
		
		if(email.equalsIgnoreCase("pjapan500@gmail.com") && password.equalsIgnoreCase("admin101"))
		{
			admin=true;
			session.setAttribute("currentUserEmail", email);
			 session.setAttribute("currentUserPassword", password);
			// getUsers.getUsers(email, password, conn);
			// return true;
			Statement statement = null;
			ResultSet resultset = null;
			try {
				statement = conn.createStatement();
				 resultset = statement.executeQuery("SELECT * FROM user");
				 ArrayList<String> username=new ArrayList<String>();  
				 ArrayList<String> useremail=new ArrayList<String>();
				 ArrayList<String> userphone=new ArrayList<String>();
				 ArrayList<String> userdob=new ArrayList<String>();
				 ArrayList<String> usercountry=new ArrayList<String>();
				 ArrayList<String> usergender=new ArrayList<String>();
				 System.out.println("Fetching successfull");
				 while(resultset.next())
				 {
					 System.out.println(resultset.getString("username"));
					 username.add(resultset.getString("username"));
					 useremail.add(resultset.getString("useremail"));
					 userphone.add(resultset.getString("phone"));
					 userdob.add(resultset.getString("dob"));
					 usercountry.add(resultset.getString("country"));
					 usergender.add(resultset.getString("gender"));
				 }
				 session.setAttribute("username",username);
				 session.setAttribute("useremail", useremail);
				 session.setAttribute("userphone", userphone);
				 session.setAttribute("userdob", userdob);
				 session.setAttribute("usercountry", usercountry);
				 session.setAttribute("usergender", usergender);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					statement.close();
					resultset.close();
					return true;
				}catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			return true;
		}else {
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement("Select * from user where useremail = ? and password = ?");
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString("useremail").equalsIgnoreCase(email) && rs.getString("password").equalsIgnoreCase(password))
				{
					System.out.println("user detected");
					session.setAttribute("user_id", email);
					 UUID uuid = UUID.randomUUID();
					 String order_id = uuid.toString();
					 session.setAttribute("order_id", order_id);
					return true;
				}
				else {
					return false;
				}
			}else {
				return false;
			}
		}
		
	}
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException, ServletException
	{
		
	    String email = request.getParameter("useremail");

	    String pass = request.getParameter("userpass");
	    Connection conn = DbConnection.dbConnection();
	    session = request.getSession(true);
	    session.setAttribute("connection", conn);
	    session.setAttribute("request", request);
	    session.setAttribute("response", response);
	    boolean res = UserLogin.userlogin(email,pass,conn);
	    PrintWriter out = response.getWriter();
	    if(res==true)
	    {
	    	if(admin==true)
	    	{
	    		request.getRequestDispatcher("Adminhomepage.jsp").forward(request, response);
	    	}
	    	else {
	    	out.println("<html><body><b>Login Successfull"
                    + "</b></body></html>");
	    	request.getRequestDispatcher("Userhomepage.jsp").forward(request, response);
	    	}
	    	//
	    }
	    else
	    {
	    	request.setAttribute("login", "Username or password is incorrect");
	    	session.invalidate();
	    	request.getRequestDispatcher("LoginUser.jsp").forward(request,response);
	    	out.println("<html><body><b>Login Failed"
                    + "</b></body></html>");
	    	
	    	
	    }
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		try {
			doMethod(req,res);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
