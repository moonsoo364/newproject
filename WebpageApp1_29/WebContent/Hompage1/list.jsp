<%@page import="org.w3c.dom.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="css/style_idx.css">
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" ></script>
    <script src="javascript/main.js" defer></script>
    <link rel="stylesheet" href="css/style_board1.css">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
</head>
<body>
    <nav class="navbar">
            <div class="navbar_title">
                <i class="fas fa-chalkboard-teacher"></i>
                <a href="Index.jsp">Hello IT World!</a>
            </div>

            <ul class="navbar_menu">
                <li><a href="Introduce.jsp">Introduce</a></li>
                <li><a href="">Board</a></li>
                <li><a href="">Statistics</a></li>     
            </ul>
            <ul class="navbar_reg">
                <li><i class="fas fa-sign-in-alt"></i><a href="login.jsp">&nbsp;login</a></li> 
                <li><i class="fas fa-registered"></i><a href="member.jsp" target="_sub">&nbsp;register</a></li>
                
            </ul>

            <a href="#" class="navbar_togle">
                <i class="fas fa-sliders-h"></i>
            </a>
    </nav>
    <div class="container">
    	<table class="board_table" >
    		<tr class="table_head">
    			<td>번 호</td>
    			<td>분 류</td>
    			<td>제 목</td>
    			<td>작성자</td>
    			<td>조회수</td>
    		</tr>
    		<tr class="table_body">
    			<td>1</td>
    			<td>공지사항</td>
    			<td>안녕하세요</td>
    			<td>홍길동</td>
    			<td>0</td>
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
    	<a href="post.jsp" class="board_post">처음으로</a> 
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
    				<input name="search" type="text" size="25">
    				</td>
    				<td>
    				<input type="button" style="height:30px" value="찾기"onclick="javascript:location.href='list.jsp'">
    				</td>
    				
    			</tr>
    		</table>
    	</div>
    </div>
    
  
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