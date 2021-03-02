<%@page contentType="application; charset=UTF-8"%>
<jsp:useBean id="bMgr" class="Board_module.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>