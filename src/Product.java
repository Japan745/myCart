import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet("/addproduct")
public class Product extends HttpServlet {
	
	public static void addproduct(String name, String id, String quantity, String price, Connection conn,HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try {
			PreparedStatement pstmt = conn.prepareStatement("Insert into product values(?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, quantity);
			pstmt.setString(4, price);
			if(pstmt.executeUpdate()==1)
			{
				res.sendRedirect("productlist.jsp");
			}
			else {
				res.sendRedirect("addproduct.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException, ServletException
	{
		String name = request.getParameter("productname");

	    String id  = name+"sm";

	    String quantity= request.getParameter("productquantity");

	    String price = request.getParameter("productprice");
	    Connection conn = DbConnection.dbConnection();
	    addproduct(name,id,quantity,price,conn,request,response);
	 
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
