package Board_module;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Homepage/BoardPost")
public class BoardPostServlet extends HttpServlet{
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		BoardMgr Bmgr = new BoardMgr();
		Bmgr.insertBoard(req);
		resp.sendRedirect("list.jsp");
	}
	
	
}
