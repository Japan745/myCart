import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 */

/**
 * @author Japan Patel
 *
 */
public class DbConnection {
	public static Connection dbConnection() throws ClassNotFoundException, SQLException
	{
		Connection conn = null;
		/*if(dbName.equalsIgnoreCase("mysql"))
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/smdb","root","Japan@1998");
		}*/
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/smdb","root","Japan@1998");
		// conn =  DriverManager.getConnection("jdbc:mysql://localhost/?user=root&password=Cart@123");
		
		System.out.println("Connection to Database established");
		return conn;
	}
}
