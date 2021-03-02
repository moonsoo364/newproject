<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8"); //받아오는 값들을 한글로 인코딩합니다.
	String url = "jdbc:mysql://127.0.0.1:3306/mydb?serverTimezone=UTC";
	String id = "root";
	String pass = "Tink13542";
	Connection conn = null;
	PreparedStatement pstmt =null;

	String name = request.getParameter("name"); //write.jsp에서 name에 입력한 데이터값
	String password = request.getParameter("password");//write.jsp에서 password에 입력한 데이터값
	String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
	String memo = request.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("driver loading Success!");
		
		conn = DriverManager.getConnection(url,id,pass);
		System.out.println("db loading Success!");
		String sql = "INSERT INTO board1(NAME,PASSWORD,TITLE,MEMO) VALUES(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.execute();
		pstmt.close();
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
conn.close();
pstmt.close();

%>


