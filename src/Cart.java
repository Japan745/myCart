import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
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
@WebServlet("/addtocart")
public class Cart  extends HttpServlet{
	
	ArrayList<String> cart = new ArrayList<String>();
	HttpSession session;
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException, ServletException
	{
		session = request.getSession();
		String quantity = (String) session.getAttribute("quantity");
		String product_name = (String) session.getAttribute("name");
		String product_price = (String) session.getAttribute("price");
		addtocart(quantity,product_name,product_price);
		request.getRequestDispatcher("Userhomepage.jsp").forward(request,response);
	}
	
	public void addtocart(String quantity, String name, String price) {
		// TODO Auto-generated method stub
		cart.add(name+","+price+","+quantity);
		session.removeAttribute("quantity");
		session.removeAttribute("name");
		session.removeAttribute("price");
		System.out.println(cart);
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
