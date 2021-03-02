package jdbc;
 
import java.sql.*;
 
public class jdbc_test {
 
    public static void main(String[] args) {
        String url = "jdbc:mysql://127.0.0.1:3306/homepagedb?serverTimezone=UTC&characterEncording=UTF-8useSSL=false&user=root&password=Tink13542";
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("드라이버 로드 성공!");
            
            conn = DriverManager.getConnection(url);
            System.out.println("데이터베이스 접속 성공!");
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            if(conn!=null) try {conn.close();} catch (SQLException e) {}
        }
    }//main
}//class


