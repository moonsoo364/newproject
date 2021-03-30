package Board_module;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Homepage_dev/BoardPost")
public class BoardPostServlet extends HttpServlet{
	
	//post.jsp에 form의 method가 post이기 때문에 dopost, 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value1=null;
		String value2=null;
		req.setCharacterEncoding("UTF-8");
		BoardMgr Bmgr = new BoardMgr();
		Bmgr.insertBoard(req);
		value1=(String)req.getAttribute("title");
		value2=(String)req.getAttribute("content");
		
			if((value1==null)||(value2==null))
			{
				System.out.print("게시판의 제목과 내용이 넘어오지 않았습니다.\n");
				resp.sendRedirect("post.jsp");
				
			}else {
				resp.sendRedirect("list.jsp");
				System.out.print("데이터가 정상적으로 저장됬습니다.\n");
			}
	}
	
	
}
