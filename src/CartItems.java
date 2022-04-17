import java.util.ArrayList;
import java.util.Iterator;

/**
 * 
 */

/**
 * @author Japan Patel
 *
 */
public  class CartItems {
	
	public static String name,price,quantity;
	public static ArrayList<String> cart = new ArrayList<String>();
	public static void addItems(String productname,String productprice,String productquantity)
	{
		name = productname;
		price = productprice;
		quantity = productquantity;
		cart.add(name+","+price+","+quantity);
	}
	public static void removeitems(String name)
	{
		Iterator<String> cartitems = cart.iterator();
		while(cartitems.hasNext())
		{
			if((cartitems.next()).startsWith(name))
			{
				cartitems.remove();
			}
		}
	}
	public static void print() {
		
		Iterator<String> cartitems = cart.iterator();
		while(cartitems.hasNext()) {System.out.println(cartitems.next());}
	}
}
