import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

/**
 * 
 */

/**
 * @author Japan Patel
 *
 */
@WebServlet("/usertable")
public class UsersTable extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public static boolean insertValues(String username,String useremail,String password,String dob,String gender,String phone,String country, Connection conn
			,HttpServletRequest request,HttpServletResponse response) throws SQLException
	{
		PreparedStatement pstmt = null;
		Statement statement = null;
		boolean res=false;
		int i=1;
		try {
			
			 statement = conn.createStatement();
			 ResultSet rs = statement.executeQuery("SELECT * FROM user");
			 String ans = "email already exists";
			 while(rs.next())
			 {
				 if(rs.getString("useremail").equalsIgnoreCase(useremail))
				 {
					 request.setAttribute("email",ans); // set your String value in the attribute
					 RequestDispatcher dispatcher = request.getRequestDispatcher("RegistrationForm.jsp");
					 dispatcher.forward( request, response );
					 i=0;
					 
				 }
			 }
			 if(i==1) {
			pstmt = conn.prepareStatement("Insert Into user(username,useremail,password,dob,gender,phone,country) values(?,?,?,?,?,?,?)");
			pstmt.setString(1,username);
			pstmt.setString(2,useremail);
			pstmt.setString(3,password);
			pstmt.setString(4,dob);
			pstmt.setString(5,gender);
			pstmt.setString(6,phone);
			pstmt.setString(7,country);
			if(pstmt.executeUpdate()== 1)
			{
				System.out.println("User registration done");
				res=true;
			}
			 }
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {
				pstmt.close();
				statement.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
		
		return res;
		
	}
	
	public static void updateValues(String Username,String Password, String Firstname, String Lastname , Connection conn)
	{
		PreparedStatement pstmt1 = null;
		try {
			pstmt1 = conn.prepareStatement("Update login set password = ? where username = ?");
			pstmt1.setString(1, Password);
			pstmt1.setString(2, Username);
			if(pstmt1.executeUpdate() == 1)
			{
				System.out.println("Row Alterted");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {
				pstmt1.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
	}
	
	public ResultSet getUsers(Connection conn)
	{
		Statement statement = null;
		ResultSet resultset = null;
		try {
			statement = conn.createStatement();
			 resultset = statement.executeQuery("SELECT * FROM user");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				statement.close();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return resultset;
		
	}
	
}
