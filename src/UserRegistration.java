import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 */

/**
 * @author Japan Patel
 *
 */
@WebServlet("/registrationform")
public class UserRegistration extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException, ServletException
	{
		String name = request.getParameter("username");

	    String email = request.getParameter("useremail");

	    String pass = request.getParameter("userpass");
	    
	    String upass = request.getParameter("userpassconf");

	    String dob = request.getParameter("userdob");

	    String gender = request.getParameter("usergender");

	    String phone = request.getParameter("userphone");

	    String country = request.getParameter("usercountry");
	    
	    if(!pass.equals(upass))
	    {
	    	request.setAttribute("pass", "Password do not match");
	    }
	    if(phone.length()!=10)
	    {
	    	request.setAttribute("Phone", "Enter valid phone number");
	    }
	    Connection conn = DbConnection.dbConnection();
	    boolean res = UsersTable.insertValues(name,email,pass,dob,gender,phone,country,conn,request,response);
	    PrintWriter out = response.getWriter();
	    if(res==true)
	    {
	    	request.getRequestDispatcher("LoginUser.jsp").forward(request,response);
	    	out.println("<html><body><b>Successfully Inserted"
                    + "</b></body></html>");
	    }
	    else
	    {
	    	response.sendRedirect("RegistrationForm.jsp");
	    	out.println("<html><body><b>Inserted Failed"
                    + "</b></body></html>");
	    	
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
