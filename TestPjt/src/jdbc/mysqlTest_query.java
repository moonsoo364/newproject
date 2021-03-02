package jdbc;
 
import java.sql.*;
 
public class mysqlTest_query {
 
    public static void main(String[] args) {
        String url = "jdbc:mysql://127.0.0.1:3306/homepagedb?user=root&password=Tink13542";
        
        		
        Connection conn = null;
 
        /////////////////////////
        Statement stmt = null; //Statement 객체 선언
        /////////////////////////
        ResultSet rs = null;//ResultSet 객체선언
 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("드라이버 로드 성공!");
            
            conn = DriverManager.getConnection(url);
            System.out.println("데이터베이스 접속 성공!");
 
            stmt =conn.createStatement();//쿼리 준비
            String Sql="select * from tablemember";
            ////////////////////////
            rs=stmt.executeQuery(Sql); //rs에 executeQuery의 실행결과를 삽입
            
            while(rs.next()) { //next()rs에 excutequery의 실행 결과를 삽입
            
            	System.out.println(
            			
            			rs.getString(1)+"\t"+
            			rs.getString(2)+"\t"+
            			rs.getString(3)
            			
            	);
            }
        
        }catch(ClassNotFoundException e) {
        	e.printStackTrace();
        }catch(SQLException se) {
        	se.printStackTrace();
        }finally {
        	if(conn!=null) try {conn.close();} catch(SQLException e) {}
        }
        
        
    }//main
}//class

