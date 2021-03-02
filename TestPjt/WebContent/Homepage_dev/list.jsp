<%@page import="org.w3c.dom.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Board_module.BoardMgr"%>
<%@page import="Board_module.BoardBean" %>
<%@page import="java.util.Vector" %>
<jsp:useBean id="Bmgr" class="Board_module.BoardMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	
	int totalRecord=0; //전체 레코드 수
	int numPerPage=10; //페이지 당 레코드 수
	int nowPage=1;//현재 페이지
	int totalPage=0;//전체 페이지 수
	
	int start=0; //DB에서 select 시작 번호
	int end=10;	 //시작 번호에서 가져올 select의 갯수
	
	int listSize=0; //현재 읽어온 게시물의 갯수
	
	String keyField="", keyWord=""; //DB에서 필드명 
	Vector<BoardBean> vlist =null;
	if(request.getParameter("keyword")!=null){
		keyWord =request.getParameter("keyWord");
		keyField=request.getParameter("keyField");
	}//키워드와 키필드를 요구한다
	if(request.getParameter("reload")!=null){
		if(request.getParameter("reload").equals("true")){
			keyWord="";
			keyField="";
		}
	}//리로딩
	if(request.getParameter("nowPage") !=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	start=(nowPage * numPerPage)-numPerPage;
	end = numPerPage;
	
	totalRecord = Bmgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage); //전체 페이지 수
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="css/style_index.css">
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" ></script>
    <script src="javascript/main.js" defer></script>
    <link rel="stylesheet" href="css/style_list.css">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
</head>
<body>
<!-- navbar는 모든 페이지에 적용 됩니다.-->
    <nav class="navbar">
            <div class="navbar_title">
                <i class="fas fa-chalkboard-teacher"></i>
                <a href="Index.jsp">Hello IT World!</a>
            </div>

            <ul class="navbar_menu">
                <li><a href="Introduce.jsp">Introduce</a></li>
                <li><a href="list.jsp">Board</a></li>
                <li><a href="Static.jsp">Statistics</a></li>     
            </ul>
            <ul class="navbar_reg">
                <li><i class="fas fa-sign-in-alt"></i><a href="login.jsp">&nbsp;login</a></li> 
                <li><i class="fas fa-registered"></i><a href="member.jsp" target="_sub">&nbsp;register</a></li>
                
            </ul>

            <a href="#" class="navbar_togle">
                <i class="fas fa-sliders-h"></i>
            </a>
    </nav>
    <br/>
	<h2 class="board_title">게시판에 오신걸 환영합니다!</h2>
	<br/>
	<div class="post_count">게시글 수:<%=totalRecord %>&nbsp;게시판 페이지:(<font color="red">
	<%=nowPage %>/<%=totalPage%>Pages</font>)</div>
    <div class="container">
    	<table class="board_table" >
    	<tr>
	    	<td colspan="2">
	    	<!-- DB에서 게시물 리스트 가지고 오기 -->
	    	<%
	    		vlist =Bmgr.getBoardList(keyField, keyWord, start, end);
	    		listSize = vlist.size();//브라우저 화면에 보여질 게시물 번호
	    		if (vlist.isEmpty()) {
	    			out.println("등록된 게시물이 없습니다");// 게시물이 없을 때 나오는 문구
	    		} else{
	    	
	    	%>
	    		<tr class="table_head">
	    			<td>번 호</td>
	    			<td>분 류</td>
	    			<td>제 목</td>
	    			<td>작성자</td>
	    			<td>조회수</td>
	    		</tr>
	    		<%
	    		  	for (int i = 0;i<numPerPage; i++){
	    		  		if(i == listSize) break;
	    		  		BoardBean bean = vlist.get(i);
	    		  		int num = bean.getNum();//게시물 번호 찾기
	    		  		String sort = bean.getSort();//게시물 분류 찾기
	    		  		String title = bean.getTitle();//게시물 번호 찾기
	    		  		String name = bean.getName();//작성자 찾기
	    		  		int count =bean.getCount();//조회수 찾기
	    		  
	    		%>
	    		<tr>	
	    		<td><%=totalRecord -((nowPage-1)*numPerPage)-i %></td>
	    		<td><%=sort %></td>
	    		<td><%=title %>	    		
	    		<td><%=name %></td>
	    		<td><%=count %></td>
	    		</tr>
	    	<%}//for %>
	    <%}//if %>
	    
	   </td>
	  </tr>
	    		
	    	
	    	
	    		
    	</table>
    	<div class="bottom_content">
    	<a href="post.jsp" class="board_post">글쓰기</a> 
    	 <a class="move" href="#">&nbsp; &lt;이전 </a>
    	<script language="Javascript">

			for(i = 1; i <=10; i++){  // 변수 i 의 값이 1부터 시작해서 10보다 크게 될때까지 계속 순환문 작동
		
			document.write(i+"&nbsp");
		
			}

		</script>
    	 <a class="move" href="#"> 다음&gt;&nbsp; </a>
    	<a href="list.jsp" class="board_post">처음으로</a> 
    	</div>
    	<div class="search_bar">
    		<table>
    			<tr>
    			<td>
    				<select name="search_type" id="search_type" style="height:30px;">
							<option value="sub_memo">본문</option>
							<option value="subject">제목</option>
							<option value="name">작성자</option>
    			   </select>
    			   </td>
    				<td>
    				<input name="search" type="text" size="50">
    				</td>
    				<td>
    				<input type="button" style="height:30px" value="찾기"onclick="javascript:location.href='list.jsp'">
    				</td>
    				
    			</tr>
    		</table>
    	</div>
    </div>
    
  <!-- footer는 모든 페이지에 적용 됩니다.-->
	<footer class="footer_style">
		<div class="footer_alarm">
			<div class="div_left"><i class="fas fa-exclamation-triangle"></i></div>
			<div class="div_right">
				<div class="footer_ment1">해당 게시판은 컴퓨터,모바일,하드웨어,소프트웨어 등의 뉴스와 정보를 공유하는 곳입니다
				<br>게시판에서 생기는 개인 및 단체의 권리 침해 문의는 aptx15hibr@naver.com로 해주세요.
				</div>
	 			
	 		</div>			
		</div>
	</footer>
</body>
</html>