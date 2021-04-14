import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/HelloWorld")
public class HelloWorldServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out =resp.getWriter();
		String yourName=req.getParameter("name");
		
		out.println("<html>");
		out.println("Hello World!<br>");
		out.println("mothod:"+req.getMethod()+"<br>");
		out.println("you're name is:"+yourName+"<br>");
		out.println("</html");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out =resp.getWriter();
		String yourName=req.getParameter("name");
		out.println("<html>");
		out.println("hello, world<br>");
		out.println("method:"+req.getMethod()+"<br>");
		out.println("you're name is"+yourName);
		out.print("</html>");
	}

}
