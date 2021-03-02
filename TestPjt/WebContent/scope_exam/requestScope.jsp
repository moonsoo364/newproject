<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request scope</title>
</head>
<body>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="req" class="mybean.scope.RequestScopeBean" scope="request"/>
    <jsp:setProperty property="header" name="req" param="header"/>
    <jsp:setProperty property="footer" name="req" param="footer"/>
 
    <!-- 머릿말이 들어갈 부분 -->
    <jsp:include page="inc/header.jsp"/>
   
    <hr/>
   
    <!-- 순서2. <form>태그 -->
    <h1>머릿말과 꼬릿말을 직접 입력을 해서 설정</h1>
    <form action="requestScope.jsp" method="post">
        머릿말에 들어갈 내용 : <br/>
        <textarea rows="2" cols="60" name="header"></textarea><p/>
        꼬리말에 들어갈 내용 : <br/>
        <textarea rows="2" cols="60" name="footer"></textarea><p/>
        <input type="submit" value="새로고침"/>
    </form>
   
    <hr/>
   
    <!-- 꼬리말이 들어갈 부분 -->
    <jsp:include page="inc/footer.jsp"/>
</body>
</html>