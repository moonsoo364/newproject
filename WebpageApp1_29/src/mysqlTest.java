import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class mysqlTest {
     
    public static void main(String[] args) {
    	Connection con;
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    		con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/homepagedb?serverTimezone=UTC&characterEncording=UTF-8");
    		System.out.println("Success");
    	}catch(SQLException ex) {System.out.println("SQLException"+ex);}
    	catch(Exception e) {System.out.println("Exception:"+e);}
    }
}
