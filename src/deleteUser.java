import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
@WebServlet("/deleteuser")
public class deleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException, ServletException
	{
		HttpSession session;
		session = request.getSession(true);
		PreparedStatement pstmt2 = null;
		Statement statement = null;
		ResultSet resultset = null;
		Connection conn = (Connection) session.getAttribute("connection");
		try {
			pstmt2 = conn.prepareStatement("delete from user where useremail = ?");
			pstmt2.setString(1, (String)session.getAttribute("email"));
			System.out.println("----------------------"+(String)session.getAttribute("email"));
			pstmt2.executeUpdate();
			//request.getRequestDispatcher("Adminhomepage.jsp").forward(request, response);
			
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
			 session.removeAttribute("username");
			 session.removeAttribute("useremail");
			 session.removeAttribute("userphone");
			 session.removeAttribute("userdob");
			 session.removeAttribute("usercountry");
			 session.removeAttribute("usergender");
			 session.setAttribute("username",username);
			 session.setAttribute("useremail", useremail);
			 session.setAttribute("userphone", userphone);
			 session.setAttribute("userdob", userdob);
			 session.setAttribute("usercountry", usercountry);
			 session.setAttribute("usergender", usergender);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			pstmt2.close();
			//getUsers.getUsers((String)session.getAttribute("currentUserEmail"),(String)session.getAttribute("currentUserPassword"), conn,
			//		request,response);
			request.getRequestDispatcher("Adminhomepage.jsp").forward(request, response);
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

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
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
